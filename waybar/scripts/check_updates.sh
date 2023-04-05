#!/bin/bash
i="$(checkupdates)"
printf "%b%b" "$i" "${i:+\n}" |wc -l; echo "$i" |column -t #|tr '\n' '\r'
