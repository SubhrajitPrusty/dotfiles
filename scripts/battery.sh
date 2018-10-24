echo $(notify-send "$( acpi -b | awk '{ print $6, $5 }')")
