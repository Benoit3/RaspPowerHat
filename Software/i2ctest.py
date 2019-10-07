# i2ctest.py
# To test RaspPower I2c communication


import smbus,time

# I2C channel 1
# Initialize I2C (SMBus)
bus = smbus.SMBus(1)

end=False;
i2cException=0
i2cBusy=0
i2cErr=0


while (not end):
	try:
		#i2c address of ATtiny slave is 0x27
		#i2c command send is 1
		#number of bytes read from the slave is 11
		tinyStatus=bus.read_i2c_block_data(0x27, 1,11)
		chk=0
		for i in range(len(tinyStatus)-1):
			chk^=tinyStatus[i]
		if (tinyStatus[0]==0):
			i2cBusy+=1
		elif ((tinyStatus[0]!=1) or (tinyStatus[1]!=0x10) or (chk!=tinyStatus[len(tinyStatus)-1])):
			i2cErr+=1
		#print number of i2c Exception, number of i2cBusy frame, number of frame error and content of the frame
		print(i2cException,i2cBusy,i2cErr,tinyStatus)
	except OSError:
		i2cException+=1
	





