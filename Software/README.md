This folder contains the software script to be run in the Raspberry. It has been tested with Raspbian stretch on a RaspBerry Zero Wifi. 
The script is written in Python3.

To install it, you need to type following commands to install libraries:<br/>
sudo apt-get install python3-rpi.gpio<br/>
sudo apt-get install python3-smbus<br/>

You need to modify /boot/config.txt :<br/>

#to enable GPIO26 to go low when cpu is in halted state<br/>
dtoverlay=gpio-poweroff,active_low="y" <br/>

#to enable I2C at 10 kHz speed (low speed is needed to be supported by the ATtiny45 in slave mode)<br/>
dtparam=i2c_arm=on<br/>
dtparam=i2c_arm_baudrate=10000<br/>

You need also to add to the /etc/modules file following lines:<br/>

#request i2c module to be loaded in the kernel<br/>
i2c-dev<br/>

You need to copy following files :

RaspPower.service into /etc/systemd/system with following access rights:<br/>
-rw-r--r-- 1 root root 278 Jun 25 22:21 /etc/systemd/system/RaspPower.service

ioManager.py, logging.conf, RaspPower.py, stopManager.py into /home/pi/RaspPower with following access rights:<br/>
-rw-r--r-- 1 pi pi    3138 Jun 25 22:32 ioManager.py
-rw-r--r-- 1 pi pi     440 Jun 25 21:35 logging.conf
-rw-r--r-- 1 pi pi    1181 Jun 25 22:29 RaspPower.py
-rw-r--r-- 1 pi pi     234 Jun 25 21:35 stopManager.py

You may now try the system with the command : python3 RaspPower.py<br>
Standard output shall display lines like:<br/>
Voltage :13.9 Power Status : 1
Voltage :14.7 Power Status : 1
Voltage :13.4 Power Status : 1

Power status (provided by the Hat) value is 1 in normal mode and becomes 2 when shutdown is requested

To install the service:<br/>
sudo systemctl daemon-reload

To enable the service:<br/>
sudo systemctl enable RaspPower.service

To launch it without waiting a reboot:<br/>
sudo systemctl start RaspPower.service


