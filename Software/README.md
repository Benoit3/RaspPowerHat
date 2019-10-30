This folder contains the software script to be run in the Raspberry. It has been tested with Raspbian stretch lite on a Raspberry PI Zero Wifi. 
Scripts are written in Python3.

<h2>Test of the PCB</h2>

You need first to install python3 libraries:<br/>
sudo apt-get install python3-rpi.gpio<br/>
sudo apt-get install python3-smbus<br/>

You need also to modify /boot/config.txt :<br/>

#to enable GPIO26 to go low when cpu is in halted state<br/>
dtoverlay=gpio-poweroff,active_low="y" <br/>

#to enable I2C at 10 kHz speed (low speed is needed to be supported by the ATtiny45 in slave mode)<br/>
dtparam=i2c_arm=on<br/>
dtparam=i2c_arm_baudrate=10000<br/>

You need also to add to the /etc/modules file following lines:<br/>

#request i2c module to be loaded in the kernel<br/>
i2c-dev<br/>

You can now test the PCB with the following line:
python3 i2ctest.py

The script will display ten lines per second like: 0 0 0 [1, 16, 191, 0, 127, 0, 1, 0, 0, 1, 209]
where data are :
- counter of i2c read exception :should stay at 0
- counter of i2c slave busy info : can increase slowly
- counter of i2c frame error (first byte not equal to 1, second to 0x10 (version error), or checksum) : should stay at 0
- 11 byte array :
  - 0: 1 (frame is OK)
  - 1: 16 (frame protocol version 0x10)
  - 2: buffer update counter : incremented every 100 ms 
  - 3: high byte of Vacc value (unit: tenth of volt)
  - 4: low byte of Vacc value (unit: tenth of volt)
  - 5: timer used to validate change of Vacc_Status (unit : 100ms)
  - 6: Vacc_Status
  - 7: high byte of shutting down timer (unit: 1s)
  - 8: low byte of shutting down timer (unit : 1s)
  - 9: Power Status : 1=ON, 2=shutdown requested
  - 10: chksum (XOR of above bytes)

Remark : if byte 9 equal 2, shutting down is requested. Power supply will be switch off as soon as GPIO26 becomes low or shutting down timer is expired (to avoid to dry the battery in case of PI software issue), even if Vacc becomes high again. In this case PI will be powered again and retstart immediately after shutdown.

<h2>Setup of the service</h2>
To have a service continously monitoring Vacc and managing shutdown, you need to copy following files :

RaspPower.service into /etc/systemd/system with following access rights:<br/>
-rw-r--r-- 1 root root 278 Jun 25 22:21 /etc/systemd/system/RaspPower.service

ioManager.py, logging.conf, RaspPower.py, stopManager.py into /home/pi/RaspPower with following access rights:<br/>
-rw-r--r-- 1 pi pi    3138 Jun 25 22:32 ioManager.py<br/>
-rw-r--r-- 1 pi pi     440 Jun 25 21:35 logging.conf<br/>
-rw-r--r-- 1 pi pi    1181 Jun 25 22:29 RaspPower.py<br/>
-rw-r--r-- 1 pi pi     234 Jun 25 21:35 stopManager.py<br/>

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

You are now reading to switch on/off your PI by changing the Vacc input voltage (threshold is 11 V +/- 0.5V)
