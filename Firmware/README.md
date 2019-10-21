This folder contains the ATtiny 45 firmware used on the RaspPower Hat.
The ATtiny 45 shall be used with a 8 MHz clock to answer properly as an I2C slave.

The I2C stack is issued from https://github.com/lucullusTheOnly/TinyWire.

To flash the ATtiny 45, the simple thing is to use SparkFun Tiny AVR Programmer : https://www.sparkfun.com/products/11801

To edit source and flash ATtiny 45, open the RaspPower.ino with the arduino WorkBench, do not forget to set it to 8Mhz.

After that you can go the software folder and test your hat with i2ctest.py by reading README.md [here](../Software/README.md)
