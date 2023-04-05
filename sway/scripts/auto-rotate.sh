#!/bin/bash

# Wait for iio-sensor-proxy service to start
while [ ! -x /usr/bin/iio-sensor-proxy ]
do
    sleep 1
done

# Loop indefinitely, checking the orientation of the laptop and rotating the screen accordingly
while true
do
    orientation=$(gdbus call --system --dest net.hadess.SensorProxy --object-path /net/hadess/SensorProxy --method org.freedesktop.DBus.Properties.Get net.hadess.SensorProxy AccelerometerOrientation | awk -F '"' '{print $2}')
    case "$orientation" in
        normal) sway-output -d --rotate normal;;
        inverted) sway-output -d --rotate inverted;;
        left-up) sway-output -d --rotate right;;
        right-up) sway-output -d --rotate left;;
        *) sway-output -d --rotate normal;;
    esac
    sleep 1
done
