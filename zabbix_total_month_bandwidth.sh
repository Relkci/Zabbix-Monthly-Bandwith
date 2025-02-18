#!/bin/bash
    # Current month total bandwidth in MB

    int=$1
    i=$(vnstat -i $int --oneline  | awk -F\; '{ print $11 }')

    bandwidth_number=$(echo $i | awk '{ print $1 }')
    bandwidth_unit=$(echo $i | awk '{ print $2 }')

    case "$bandwidth_unit" in
    B)    bandwidth_number_MB=$(echo "$bandwidth_number/1024/1024" | bc)
        ;;
    KiB)    bandwidth_number_MB=$(echo "$bandwidth_number/1024" | bc)
        ;;
    MiB)    bandwidth_number_MB=$bandwidth_number
        ;;
    GiB)     bandwidth_number_MB=$(echo "$bandwidth_number*1024" | bc)
        ;;
    TiB)    bandwidth_number_MB=$(echo "$bandwidth_number*1024*1024" | bc)
        ;;
    esac

    echo $bandwidth_number_MB

