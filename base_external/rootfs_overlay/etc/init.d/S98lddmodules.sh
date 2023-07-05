#!/bin/sh

case "$1" in
    start)
        echo "Starting pca and i2c modules"
        modprobe i2c-bcm2835  
        modprobe i2c-dev 
        echo pca 0x40 > /sys/bus/i2c/devices/i2c-1/new_device
        /usr/bin/pca_load
        /usr/bin/aesdsocket &
        ;;
    stop)
        echo "Stopping pca and i2c modules"
        rmmod i2c-bcm2835
        rmmod i2c-dev
        /usr/bin/pca_unload
        ;;
    *)
    echo "Usage: $0 {start|stop}"
    exit 1
    ;;
esac

exit 0