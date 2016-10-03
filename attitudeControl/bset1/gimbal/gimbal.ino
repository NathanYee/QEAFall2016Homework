// Gimbal 3Axis

#include <Servo.h>

Servo servo1;
Servo servo2;
Servo servo3;

const int servo1pin = 31;
const int servo2pin = 33;
const int servo3pin = 35;


void setup() {
  // put your setup code here, to run once:
  
  servo1.attach(servo1pin);
  servo2.attach(servo2pin);
  servo3.attach(servo3pin);

}

void loop() {
  // put your main code here, to run repeatedly:
  servo1.write(90);
  servo2.write(90);
  servo3.write(90);

}
