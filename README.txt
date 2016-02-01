Objectives

The system has to check if a flash drive is plugged, in that case the system crypts the flash drive then unmount it and a LED blink to signal that the device can be unplugged. 
In this version, a LED blink slowly when there is no flash drive plugged into the Armadeus, that means that your system is searching if a flash drive is plugged.

In version 0.2 we do not crypt the flash drive.

To run:

*First copy S99Test.sh in /etc/init.d
*Copy test.sh in /root/
*Reboot the Armadeus.
