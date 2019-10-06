import signal

class stopManager:
  stop_now = False
  def __init__(self):
    signal.signal(signal.SIGINT, self.stopTest)
    signal.signal(signal.SIGTERM, self.stopTest)


  def stopTest(self,signum,frame):
    self.stop_now = True
