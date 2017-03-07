#!/bin/sh

# MacBook Pro 11,4. Linux Ubuntu 16.10.
# script to monitor battery
# shows the battery percentage and status (charging, discharging)...

battery() {
        local BATPATH=/sys/class/power_supply/BAT0
        local ACPATH=/sys/class/power_supply/ADP1
        local current=`cat $BATPATH/charge_now`
        local full=`cat $BATPATH/charge_full`
        local percentage=$(($current * 100 / $full))

        local status=`cat $BATPATH/status`
        local mstat="" # mini status
        case $status in
                Charging)
                        mstat="+"
                        ;;
                Discharging)
                        mstat="-"
                        ;;
                Full)
                        mstat=""
                        ;;
                Unknown)
                        mstat="?"
                        mstat="" # fixes ?, cause it's common when battery will not charge on
                        ;;
                *)
                        mstat="?$BATPATH/status?"
                        ;;
        esac

        local ac=`cat $ACPATH/online`
        local mac="" # mini ac
        if ((ac == 1)); then
                mac="AC"
        else
                mac="BAT"
        fi

        echo -n "$mac $mstat$percentage%"
}
