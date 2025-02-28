#!/bin/bash

# Start pulseaudio in the background if not running
if ! pulseaudio --check; then
    pulseaudio --start --log-target=syslog --system=false --disallow-exit
    echo "Started PulseAudio"
fi

# Start OBS
exec obs "$@"