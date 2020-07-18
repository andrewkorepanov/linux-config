#!/bin/sh
logger "[ACPI] Fn+F5 pressed, WiFi rfkill state toggled"
rf=/sys/class/rfkill/rfkill0
case $(< $rf/state) in
    0) echo 1 >$rf/state;;
    1) echo 0 >$rf/state;;
esac
