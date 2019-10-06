#!/usr/bin/env python
import logging, time
import RPi.GPIO as GPIO,smbus

raspPowerI2cAddress=0x27
statusFrameLength=11
statusFrameVersionValue=0x10

#index of status frame bytes
statusFrameStatus=0
statusFrameVersion=1
statusFramecounter=2
statusFrameChecksum=statusFrameLength-1

#led connections
LED=[16,13,11,12]

class IoManager:
	#led Status
	LED_OFF=0
	LED_BLINK=1
	LED_ON=2

	#class init 
	def __init__(self):

		#logger
		self.logger = logging.getLogger(__name__)

		#continue flag
		self.cont=True

		# I2C channel 1
		# Initialize I2C (SMBus)
		self.I2C = smbus.SMBus(1)

		#status initialisation
		self.supplyStatusValid=False
		self.supplyStatusLastIndex=0
		self.supplyVoltage=0
		self.powerStatus=0;
		self.logger.debug("Supply Voltage monotoring init");

		#io initialisation
		#led
		GPIO.setwarnings(False)
		GPIO.setmode(GPIO.BOARD)
		self.led_status=[]
		for idx,led in enumerate(LED):
			GPIO.setup(led,GPIO.OUT,initial=GPIO.LOW)
			self.led_status.append(self.LED_OFF)

	#RaspPower status request
	def raspPowerStatusRequest(self):
		try:
			supplyStatus=self.I2C.read_i2c_block_data(raspPowerI2cAddress, 1,statusFrameLength)
			self.logger.debug("I2c: "+str(supplyStatus));
			chk=0
			for i in range(len(supplyStatus)-1):
				chk^=supplyStatus[i]
			if (supplyStatus[statusFrameStatus]==0):
				self.supplyStatusValid=False
				self.logger.warning("RaspPower busy");
			elif (supplyStatus[statusFrameVersion]!=statusFrameVersionValue):
				self.supplyStatusValid=False
				self.logger.warning("RaspPower version Error");	
			elif ((supplyStatus[0]!=1) or (chk!=supplyStatus[statusFrameChecksum])):
				self.supplyStatusValid=False
				self.logger.error("RaspPower frame Error")
			elif (supplyStatus[statusFramecounter]==self.supplyStatusLastIndex):
				self.supplyStatusValid=False
				self.logger.warning("Supply Status not updated since last fetch")
			else:
			#update fetch counter
				self.supplyStatusLastIndex=supplyStatus[statusFramecounter]
			#get supply voltage & status
				self.supplyVoltage=(supplyStatus[3]*256+supplyStatus[4])/10.0
				self.powerStatus=supplyStatus[9]
				self.supplyStatusValid=True
			#log
				self.logger.info("Supply Voltage : " + str(self.supplyVoltage) + " Power Status : "+str(self.powerStatus));
				
		except OSError:
				self.logger.error("I2C bus Error");

	#every second update led and check power status
	def manager(self):
		while(self.cont):
			#update led variing their status
			for idx,led in enumerate(LED):
				if self.led_status[idx]==self.LED_OFF:
					GPIO.output(led,GPIO.LOW)
				elif self.led_status[idx]==self.LED_BLINK:
					GPIO.output(led,not GPIO.input(led))
				elif self.led_status[idx]==self.LED_ON:
					GPIO.output(led,GPIO.HIGH)
					
			#raspPower status update	
			self.raspPowerStatusRequest()
				
			#wait 1 s before next request
			time.sleep(1)
			
		#switch leds off
		for idx,led in enumerate(LED):
			GPIO.setup(led,GPIO.OUT,initial=GPIO.LOW)
			self.led_status[idx]=self.LED_OFF
	

	def supplyVoltage(self):
		#return power supply value
		return(self.supplyVoltage);
		
	def setLed(self,id,status):
		self.led_status[id-1]=status


