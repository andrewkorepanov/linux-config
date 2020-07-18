#!/bin/sh

log() { logger -p daemon "ACPI: $*"; }
uhd() { log "event unhandled: $*"; }

set $*
value=$4

case $value in
        *0) log "switching to power.adp power profile"
                hprofile power.adp;;
        *1) log "switching to power.adp power profile"
                hprofile power.adp;;
        *) uhd $*;;
esac

unset value 

