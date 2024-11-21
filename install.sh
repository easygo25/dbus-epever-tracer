#!/bin/bash

read -p "Install Epever Solarcharger on Venus OS at your own risk? [Y to proceed]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Download and install pip3 and minimalmodbus"

	opkg update
	opkg install python3-pip
	pip3 install -U minimalmodbus


	echo "Download driver and library"

	cd /data

	wget https://github.com/easygo25/dbus-epever-tracer/archive/master.zip
	unzip master.zip
	rm master.zip

	wget https://github.com/victronenergy/velib_python/archive/master.zip
	unzip master.zip
	rm master.zip

	mkdir -p dbus-epever-tracer/ext/velib_python
    	cp -R dbus-epever-tracer-master/* dbus-epever-tracer
	cp -R velib_python-master/* dbus-epever-tracer/ext/velib_python
	
	rm -r velib_python-master
	rm -r dbus-epever-tracer-master

	echo "Add entries to serial-starter"
	cd ..
	sed -i '/service.*imt.*dbus-imt-si-rs485tc/a service epever		dbus-epever-tracer' /etc/venus/serial-starter.conf
	#sed -i '$aACTION=="add", ENV{ID_BUS}=="usb", ENV{ID_MODEL}=="USB_Serial",          ENV{VE_SERVICE}="epever"' /etc/udev/rules.d/serial-starter.rules
	sed -i '/^alias\s*default/ { s/[[:space:]]*$//; /:epever$/! s/$/:epever/ }' /etc/venus/serial-starter.conf

	echo "Install driver"
	chmod +x /data/dbus-epever-tracer/driver/start-dbus-epever-tracer.sh
	chmod +x /data/dbus-epever-tracer/driver/dbus-epever-tracer.py
	chmod +x /data/dbus-epever-tracer/service/run
	chmod +x /data/dbus-epever-tracer/service/log/run

	ln -s /data/dbus-epever-tracer/driver /opt/victronenergy/dbus-epever-tracer
	ln -s /data/dbus-epever-tracer/service /opt/victronenergy/service-templates/dbus-epever-tracer

	echo "To finish, reboot the Venus OS device"
fi
