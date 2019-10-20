This folder contains definition of the electronic partof the Hat. 
Files can be edited with [Kicad PCB](http://www.kicad-pcb.org/) ,a Cross Platform and Open Source Electronics Design Automation Suite .
![Schematic](schematic.png)

Some explanation :
- U2 BTS452T is a Smart Power Switch to power the PI through the Traco regulator TSR 2-2450. C3 is not mandatory but recommended by the Traco application note if input voltage of 24V is used.
- D1 and D5 are to power the 78L33 regulator and then the arduino ATTINY 45 from Vacc or from the U2 power switch.
