#! /bin/sh
GPIO_LINUX=21
i=0
i=2000000
if [ -d /sys/class/gpio/gpio$GPIO_LINUX ]
	then echo "gpio$GPIO_LINUX exists"
else
 	echo $GPIO_LINUX > /sys/class/gpio/export
fi

echo "out" > /sys/class/gpio/gpio$GPIO_LINUX/direction
while true; do
 	#sleep 3
 	echo 1 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	sleep 5
	usleep $i
	echo 0 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	usleep $i


	echo 1 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	usleep $i
	echo 0 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	usleep $i

	echo 1 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	usleep $i
 	echo 0 > /sys/class/gpio/gpio$GPIO_LINUX/value 
	sleep 5
	usleep $i
 	if [ -b /dev/sda ]
 		then	echo "mount"
		mount /dev/sda1 /mnt/
		sleep 1 
		ls /mnt
		mount /dev/sda1 /mnt/ 
 		umount /mnt
		echo "out" > /sys/class/gpio/gpio$GPIO_LINUX/direction
		while [ $i -le 2 ];do
			echo 1 > /sys/class/gpio/gpio$GPIO_LINUX/value 
			sleep 1
			echo 0 > /sys/class/gpio/gpio$GPIO_LINUX/value 
			sleep 1
			echo $i
			i=$(($i+1))
		done
		i = 500000
 	else
		echo "not ok"
		i=0
		echo "no usb "
		i=2000000
 	fi
done
