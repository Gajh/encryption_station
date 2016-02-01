# README

#### Version 1.1
## Objective
We want to create an autonomous embedded system which can crypt and/or decrypt files in a flash drive. The final purpose is to make it completely autonomous even to update it.
The system has to check if a flash drive is plugged, in that case the system crypts/decrypts the flash drive then unmounts it and a LED blinks rapidly to signal that the device can be unplugged.

Version 1.1 use an ARMADEUS apf28

## Update
In the version 1.1 we have implemented the decrypt function, now we can have a file to decrypt and/or a file to crypt.

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
$ screen <port-name>
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
Your system is set up, you need now restart your Armadeus. 
### Use the system
To use your autonomous crypt/decrypt station you need:
* One or two text file which you will name toCrypt.txt and/or toDecrypt.txt on your flash drive
* Plug the flash drive on your station
* Wait until the LED blinks rapidly
* Check on your computer if the file are correctly crypted or decrypted.

### Debug
Connect the Armadeus to your PC and use **minicom** or **screen**.\
Then, if you want to debug or deactivate the deamon we advise you to plug a flash drive and wait util **umount** is printed on the prompt. DO NOT unplugged the flash drive, remove or comment the command line in /etc/init.d/S99test.sh and then you can unplugged the flash drive and restart the Armadeus.