# RaspPowerHat
A raspberry hat designed to manage raspberry powering from a car battery.<br>
The purpose of the hat is to switch on the RaspBerry when car accessory power is switched on (easy ;-) ) and to switch it off properly (after linux shutdown ) when the car accessory power is switched off (more difficult).

If the PI is not halted 10 minutes after accessory power switch off, the power supply of the PI is cut to avoid to dry the battery.

To achieve this objective, the raspberry itself is powered by a permanent +12V power line through a 5V step down converter. A connection to ACC power supply (switched ignition) allow to switch on and later off the raspberry.<br>

The Hat PCB is designed to fit well on a Raspberry PI Z but can also be used on Raspberry 2 or 3.<br/>
![Front view](Hat1.png)

Black wire is for ground, red for permanent 12 to 24 V, yellow is for accessories ON or ignition On information

One limitation is the output current of the 5V converter which is 2A. This is the biggest converter I found which can be soldered on the back of the PCB.
![Front view](Hat2.png)

The Hat is build using an ATTINY 45.

You can get information about [Hardware and PCB](PCB/README.md), [Firmware](Firmware/README.md) and [PI test software](Software/README.md)
