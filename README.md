# README

#### Version 1.2

## Disclaimer
We do not have an Armadeus apf28 to test our code but we use a raspberry pi 2 the only file you have to change is the bin encrypte which was compiled for raspberry.
So you may need to cross compile encrypte.c for Armadeus apf28. To do so, download the stable version of Armadeus software at and detar it:
http://sourceforge.net/projects/armadeus/files/
```sh
 $ tar xjvf armadeus-6.0.tar.bz2
```
then you will need to config to apf28 and compile the cross compiler:
```sh
$ make apf28_defconfig
$ make toolchain
```
The last thing you need is to add the cross compiler to the PATH and then you can compile the encrypte.c file:
```sh
$ export PATH=$PATH:[apf28 folder]/output/host/usr/bin/
$ arm-linux-gcc -w -o encrypte encrypte.c
```

## Objective
We want to create an autonomous embedded system which can crypt and/or decrypt files in a flash drive. The final purpose is to make it completely autonomous even to update it.
The system has to check if a flash drive is plugged, in that case the system crypts/decrypts the flash drive then unmounts it and a LED blinks rapidly to signal that the device can be unplugged.

Version 1.2 use a raspberry pi 2

## Update
In the version 1.2 the system is able to crypt and/or decrypt all the file present on your flash drive.

## Setup your device

clone the repository on your pc:
```sh
$ git clone https://github.com/nicolas2lee/linux_tp 
```
Then plug a flash drive and copy the files test.sh & S99test.sh

Connect the Armadeus to your pc through a the usb cable. 
```sh
$ minicom <port-name>
or 
$ screen <port-name> 115200
```
Plug the flash drive into the Armadeus mount it and copy both file on it. S99test.sh must be in /etc/init.d/ and test.sh must be in /root/. You have to set these file as executable file.

```sh
$ mount /dev/sda /mnt
$ cp /mnt/test.sh /root/
$ cp /mnt/S99test.sh /etc/init.d/
$ chmod a+x /root/test.sh
$ chmod a+x /etc/init.d/S99test.sh
$ umount /mnt 
```
Restart your Armadeus, your system is set up. You should see a LED blinking. 

### Use the system
To use your autonomous crypt/decrypt station you need:
* text files which you will name toCrypt[number].txt and/or toDecrypt[number].txt on your flash drive
* Plug the flash drive on your station
* Wait until the LED blinks rapidly
* Check on your computer if the file are correctly crypted or decrypted.

### Debug
Connect the Armadeus to your PC and use **minicom** or **screen**.\

Then, if you want to debug or deactivate the deamon we advise you to plug a flash drive and wait util **umount** is printed on the prompt. DO NOT unplugged the flash drive, remove or comment the command line in /etc/init.d/S99test.sh and then you can unplugged the flash drive and restart the Armadeus.