### THIS IS A WORK IN PROGRESS -- YMMV, NO WARRANTY EXPRESSED OR IMPLIED. YOU CAN ENDANGER YOURSELF AND OTHERS.

# Epver Venus Driver
This project integrates the Epver Solarcharger with Victron Venus OS. The software runs on the Venus OS device as a Venus driver and uses the Venus dbus to read/write data for use with the Venus device.

Tested with RPi 3B - v2.91 Build 20220925213117
### Install

The provided install.sh script will copy files download dependencies and should provide a running configuration. It will not setup valid configuration values so don't expect this to be plug and play:

1. enable root access on your Venus device
2. from root login on the venus root home directory
3. run
```
wget https://github.com/easygo25/dbus-epever-tracer/raw/master/install.sh
```
4. run 
```
chmod +x install.sh
```
5. run
```
./install.sh
```
6. answer Y to the install of the driver
7. reboot your Venus device

8. connect the RS485 adapter to your Venus / Raspberry Pi now.
### Hardware connection

Use this adapter:

https://www.amazon.de/gp/product/B082D5PXJ4/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1