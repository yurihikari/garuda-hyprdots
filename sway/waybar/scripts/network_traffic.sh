#!/bin/bash

# network_traffic.sh [-tPOLLING_INTERVAL] [NETWORK_INTERFACE...]

getopts t: __ && shift
isecs=${OPTARG:-1}
ifaces=($@)
: ${rate_max:=1000000} # maximum transfer rate for {percent}, can be overridden setting the env var

# `snore` adapted from https://blog.dhampir.no/content/sleeping-without-a-subprocess-in-bash-and-how-to-sleep-forever
# without MacOS workaround, TODO: with _snore_fd initialized separatedly, also i dont touch IFS so dont bother with it
snore() {
    local IFS
    [[ -n "${_snore_fd:-}" ]] || { exec {_snore_fd}<> <(:); } 2>/dev/null
    read ${1:+-t "$1"} -u $_snore_fd || :
}

human_readable() {
  local hrunits=( B K M G T P )
  local ndigits=${#1}
  local idxunit=$(( (2 + ndigits) / 3 - 1))
  local lentrim=$(( ndigits - (idxunit * 3 ) ))
  echo ${1::$lentrim}${hrunits[$idxunit]}
}

exit_err() {
  printf '{"text": "⚠ %s", "tooltip": "%s", "class": "error"}\n' "$@"
  exit
}

if test ${#ifaces[@]} -gt 0; then
# sanity check the interface names
  for iface in ${ifaces[@]}; do
    test -h "/sys/class/net/${iface}" || exit_err "${iface}" "${iface} is not an existing network interface name"
  done
else
# default to all interfaces except `lo`
  ifaces=(/sys/class/net/*)
  ifaces=(${ifaces[@]##*/})
  ifaces=(${ifaces[@]//lo/})
# TODO: check that filtering out `lo` is enough, else `^(eth|wlan|enp|wlp)` as suggested
fi

# sanity check polling interval
if test ${isecs} -lt 1; then
  exit_err "${isecs}" "${isecs} is not a valid polling interval"
fi
# NOTE: `snore` would take a decimal interval but bash arithmetic does not
#if test $(echo "${isecs} >= 0.2" |bc) -eq 0; then
#  exit_err "${isecs}" "${isecs} is not a valid polling interval"
#fi

# NOTE: `/proc/net/dev` format is:
#   interface:
#       RX  bytes packets errs drop fifo  frame compressed multicast
#       TX  bytes packets errs drop fifo  colls carrier compressed

# NOTE: array items are:
# 0=rx_bytes 1=rx_packets 2=rx_errs 3=rx_drop
# 4=tx_bytes 5=tx_packets 6=tx_errs 7=tx_drop
for iface in ${ifaces[@]} aggregate; do
  declare -a traffic_prev_${iface} traffic_curr_${iface} traffic_delt_${iface}
  declare -n traffic_prev=traffic_prev_${iface}
  declare -n traffic_curr=traffic_curr_${iface}
  declare -n traffic_delt=traffic_delt_${iface}
  traffic_prev=( 0 0 0 0  0 0 0 0 )
  traffic_curr=( 0 0 0 0  0 0 0 0 )
  traffic_delt=( 0 0 0 0  0 0 0 0 )
done

# TODO: rearrange the loop, do not show bogus on first iteration
while snore ${isecs} ;do
  tooltip=""
  traffic_delt_aggregate=( 0 0 0 0  0 0 0 0 )

  readarray -s2 proc_net_dev </proc/net/dev
  while read -a data; do
    iface=${data[0]%:}
    test "${ifaces[*]}" = "${ifaces[*]//${iface}/}" && continue
    declare -n traffic_prev=traffic_prev_${iface}
    declare -n traffic_curr=traffic_curr_${iface}
    declare -n traffic_delt=traffic_delt_${iface}
    traffic_curr=(${data[@]:1:4} ${data[@]:9:4})
    #FIXME: tooltip is delayed one iteration wrt main display (but why?)
    #printf -v tooltip_hr_rx '%4s⇣' $(human_readable ${traffic_delt[0]})
    #printf -v tooltip_hr_tx '%4s⇡' $(human_readable ${traffic_delt[4]})
    #tooltip="${tooltip:+${tooltip}\r}${iface}\t${tooltip_hr_rx}\t${tooltip_hr_tx}"
    for i in {0..7}; do
      (( traffic_delt[i] = ( traffic_curr[i] - traffic_prev[i] ) / isecs ))
      (( traffic_delt_aggregate[i] += traffic_delt[i] ))
    done
    traffic_prev=(${traffic_curr[@]})
  done <<<"${proc_net_dev[@]}"

  printf '{"text": "%4s⇣ %4s⇡", "tooltip": "%s",  "percentage": %d}\n'   \
    $(human_readable ${traffic_delt_aggregate[0]})  \
    $(human_readable ${traffic_delt_aggregate[4]})  \
    "${tooltip}"                                    \
    $(( ( traffic_delt_aggregate[0] + traffic_delt_aggregate[4] ) / rate_max ))
  #printf '{"text": "%5s⇣ %5s⇡", "alt": "%s", "tooltip": "%s", "class": "%s", "percentage": %d }\n' $(human_readable ${traffic_delt[0]}) $(human_readable ${traffic_delt[4]}) '_alt' '_tooltip' '_class' 0
done


# NOTE: in waybar config (do NOT use "interval"):
#         "custom/network_traffic": {
#             "exec": "~/.config/waybar/scripts/network_traffic.sh",
#             "return-type": "json",
#             "format": "Speed: {}",    // optional
#         },
