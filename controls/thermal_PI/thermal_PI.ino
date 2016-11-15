

// These constants won't change.  They're used to give names
// to the pins used:
const int analogInPin = A1;  // Analog input pin 
const int analogOutPin = 5; // Analog output pin 


void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
}

float integralE = 0;
  
void loop() {
  float Vout,Vin,P,err;
  float Vset = 0.35;

  float Kp=1,Ki=0;
  float R =50;
  int inValue;
  // read the analog in value:
  inValue = analogRead(analogInPin);            
  
  Vin = (float)inValue/1024.0*5.0;
  err = (Vset-Vin);
  integralE = integralE +err*0.002; 
  
  P = Kp*err + Ki*integralE;
  if (P<0) P=0;
    
  Vout = sqrt(P*R);
  if (Vout>5) Vout =5;
  if (Vout<0) Vout = 0;
  
 
  
  analogWrite(analogOutPin, (Vout/5.0)*255);           

  Serial.print("\t Vin  = ");      
  Serial.print(Vin);   
  Serial.print("  Vout  = ");      
  Serial.println(Vout);

 
  // wait 2 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(2);                     
}
