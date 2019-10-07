# RaspPowerHat
A raspberry hat designed to manage raspberry powering from a car battery.<br>
The purpose of the hat is to switch on the RaspBerry when car accessory power is switched on (easy ;-) ) and to switch it off properly (after linux shutdown ) when the car accessory power is switched off (more difficult)

To achieve this objective, the raspberry itself is powered by a permanent +12V power line through a 5V step down converter.<br/>

The PCB is designed to fit well on a Raspberry PI Z but can also be used on Raspberry 2 or 3.<br/>

One limitation is the output current of the 5V converter which 2A ( biggest converter I found to be soldered on the PCB)
