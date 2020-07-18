#!/bin/sh

log() { logger -p daemon "ACPI: $*"; }
uhd() { log "event unhandled: $*"; }

set $*
action=${1#*/}

[ -d /dev/snd ] && alsa=true || alsa=false
amixer="amixer -q set Master"
acapture="amixer -q set Capture"

case $action in
	mute)
		$alsa && $amixer toggle;;
	volumeup)
		$alsa && $amixer 3dB+;;
	volumedown)
		$alsa && $amixer 3dB-;;
	f20) 
		$alsa && $acapture toggle;; 	
	*) 
		uhd $*;;
esac

unset alsa amixer acapture action
