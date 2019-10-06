#!/usr/bin/env python

from threading import Thread
import logging, logging.config,time,subprocess
import stopManager
import ioManager

if __name__ == '__main__':
	# Initialisation Logger
	logging.config.fileConfig('logging.conf');
	logger = logging.getLogger(__name__);
	
	try:

		#stop Manager
		stop=stopManager.stopManager()

		#io Manager
		io=ioManager.IoManager()
		
		ioThread=Thread(target=io.manager)
		ioThread.daemon=True
		ioThread.start()
		ioShutdownRequested=False
		
		#init led display
		io.setLed(1,io.LED_ON)
	
		#run monitoring service
		shutdownRequested=False; #shutDownRequested init
		
		while not stop.stop_now:
			#check power status
			print("Voltage :"+str(io.supplyVoltage)+ " Power Status : "+str(io.powerStatus))

			#if shutdown has been requested by  power supply
			if ( io.powerStatus==2 and not shutdownRequested) :
				io.setLed(1,io.LED_BLINK)
				cmd='sudo shutdown -h 0'
				subprocess.call(cmd, shell=True)
				shutdownRequested=True

			#loop is done with 1s cycle
			time.sleep(1)

		#io thread end
		logger.info('Stop Requested')
		io.cont=False
		ioThread.join()
	
	except Exception:
    		logger.exception("Fatal exception")




