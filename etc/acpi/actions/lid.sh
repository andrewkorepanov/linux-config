#!/bin/sh

log() { logger -p daemon "ACPI: $*"; }
uhd() { log "event unhandled: $*"; }

set $*
id=$3

case "$id" in
	close) pm-suspend&;;
        open) :;;
	*) uhd $*;;
esac

unse id

