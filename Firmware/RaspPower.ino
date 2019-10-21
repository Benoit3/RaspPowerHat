
//This sketch shall be use with a 8MHz clock to allow correct processing of I2C slave mode feature
//The clock of I2C master shall be set to 10 kHz (same reason as above)
#include "TinyWire.h"      // ATTiny wire lib https://github.com/Benoit3/TinyWire

  
//I2C BUS slave address
#define I2C_SLAVE_ADDR 0x27 

//variable used to save I2C slave command
byte mode=0;

//variable used to forbid send of I2C status frame during update of it
volatile bool lock=false;

//Length of stus frame
#define STATUS_FRAME_LENGTH 11

//version of status frame definition
#define STATUS_FRAME_VERSION 0x10

//buffer of the status frame
byte statusFrame[STATUS_FRAME_LENGTH];
//the frame counter is the third ( index=2) of the frame
#define STATUS_FRAME_CNT 2


//VACC measurement
#define VACC_INPUT A3

//Coefficient of ADC to get input voltage (Vref is Vcc)
#define ADC_FACTOR 3.3/1023

//Coefficient of input resistor divider
#define VACC_COEFF 110.0/10.0

//Vacc limit in Volt to detect VAcc is OK
#define VACC_LIMIT 11.0

//Hysteris Threshold in Volt
#define VACC_THRESHOLD 0.5

//Validation time in second to validate Vacc ON state
#define VACC_ON_VAL_TIME 1

//Validation time in second to validate OFF state
#define VACC_OFF_VAL_TIME 5

byte V_Acc_Timeout=0; //V_Acc up timer
unsigned int V_Acc_Int=0;  //Vacc value in tenth of volt;

//PI Interface
#define PI_POWER PB1
#define PI_HALTED PB4

//Pi_Status values
#define PI_OFF 0
#define PI_ON 1
#define PI_SHUTTING_DOWN 2
unsigned char Pi_Status=PI_OFF;

//PI shutting down timeout (in case the PI doesn't go in Halt mode, after the timeout, power is nevertheless switched off)
#define SHUTTING_DOWN_TIMEOUT 600  //10 minutes
unsigned int Shutting_Down_Timer=0;


//V_Acc Status
bool V_Acc_Status=false;

//task scheduling marker
//constant use to manage time variable overflow 32768u
#define TIMEOVERFLOW_THR 32767
unsigned int top100ms;
unsigned int top1s;
unsigned int time;
 
void setup() {
  
  //Set up pin mode to control raspberry power
  digitalWrite(PI_POWER,LOW);
  pinMode(PI_POWER, OUTPUT);

  //Set Up for Raspberry I2C interface
  TinyWire.begin(I2C_SLAVE_ADDR);
  
  //handler function to process received data (after a Stop or Restart)
  //trigered by a stop or restart after having received data
  //TinyWire.onReceive( onI2CReceive ); 
  TinyWire.onRequest( onI2CSend ); 
  
  //Setup pin mode to get raspberry halted status
  pinMode(PI_HALTED,INPUT);
    
  //ADC inititialisation
  pinMode(VACC_INPUT, INPUT);

  //init time top references;
   time=(unsigned int) millis();
   top100ms=time+100;
   top1s=time+1000;

   //init status frame counter
   statusFrame[STATUS_FRAME_CNT]=0;
}


//I2C Slave Receive Callback
//to save address of requested data
void onI2CReceive(int howMany){
  // loops, until all received bytes are read
  
 while(TinyWire.available()>0){
    mode=TinyWire.read(); //remark: mode is still never used
  }
}

void onI2CSend(){
  //if the access to the buffer is not locked
  if (!lock) {
    //send the content of the buffer
    TinyWire.send(statusFrame,STATUS_FRAME_LENGTH);
  }
  //else the a one byte=0 answer 
  else TinyWire.send(0x00);
}

void loop() {
 
  float V_Acc;
  byte index;
  
  //get timestamp
  time=(unsigned int) millis();


  //100ms period processing 
  //check time with rollover robust solution
  if ( (time - top100ms) < TIMEOVERFLOW_THR ) {
  
    top100ms+=100;
    
    //***************************************
    //V_Acc measurement and status processing
    //***************************************
    
    V_Acc=analogRead(VACC_INPUT)*ADC_FACTOR*VACC_COEFF; //float value
    V_Acc_Int=(unsigned int)round(V_Acc*10); //int value in tenth of volt

    //If PI is not powered and V_Acc above ON threshold
    if ( !V_Acc_Status && (V_Acc >= VACC_LIMIT + VACC_THRESHOLD)) {
      //switch V_Acc_Status to True after VACC_ON_VAL_TIME
      if (V_Acc_Timeout==0) V_Acc_Timeout=VACC_ON_VAL_TIME*10; else V_Acc_Timeout--;
      if (V_Acc_Timeout== 0 ) V_Acc_Status=true;    
    }
    //If PI is powered and V_Acc below OFF threshold
    else if ( V_Acc_Status && (V_Acc <= VACC_LIMIT - VACC_THRESHOLD)) {
      if (V_Acc_Timeout==0) V_Acc_Timeout=VACC_OFF_VAL_TIME*10; else V_Acc_Timeout--;
      //switch V_Acc_Status to False after VACC_OFF_VAL_TIME
      if (V_Acc_Timeout== 0 ) V_Acc_Status=false;  
    }
    else {
      V_Acc_Timeout=0;
    }

    //lock and update the frame buffer
    lock=true;
    statusFrame[0]=0x01;
    statusFrame[1]=STATUS_FRAME_VERSION;
    statusFrame[STATUS_FRAME_CNT]++;
    statusFrame[3]=highByte(V_Acc_Int);
    statusFrame[4]=lowByte(V_Acc_Int);
    statusFrame[5]=V_Acc_Timeout;
    statusFrame[6]=(byte)V_Acc_Status;
    statusFrame[7]=highByte(Shutting_Down_Timer);
    statusFrame[8]=lowByte(Shutting_Down_Timer);
    statusFrame[9]=(byte) Pi_Status;
    statusFrame[STATUS_FRAME_LENGTH-1]=0;
    
    //chk processing
    for (index=0;index < (STATUS_FRAME_LENGTH-1);index++) statusFrame[STATUS_FRAME_LENGTH-1]^=statusFrame[index];
    //unlock the buffer
    lock=false;
  }
    
  //1s period activities
  //check time with rollover robust solution
  if ((time - top1s) < TIMEOVERFLOW_THR) {
    top1s+=1000;

  //mangement of PI power switch
    switch(Pi_Status) {
      case PI_OFF:
        if (V_Acc_Status) {
          Pi_Status=PI_ON;
          digitalWrite(PI_POWER,HIGH);
        }
      break;

      case PI_ON:
        if (!V_Acc_Status) {
          Pi_Status=PI_SHUTTING_DOWN;
          Shutting_Down_Timer=SHUTTING_DOWN_TIMEOUT;
        }
      break;

      case PI_SHUTTING_DOWN:

        //If timer is reached or HALT detected
        if( (--Shutting_Down_Timer ==0) || (digitalRead(PI_HALTED)==LOW)) {
          Shutting_Down_Timer =0;
          Pi_Status=PI_OFF;
          digitalWrite(PI_POWER,LOW);
        }
      break;
    }
  }
  
  delay(10);
}
