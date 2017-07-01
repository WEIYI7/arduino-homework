const int EchoPin = 3;
const int TrigPin = 2;
int r;   
float cm;
void setup() {
  // put your setup code here, to run once:
 Serial.begin(9600);


pinMode(TrigPin, OUTPUT);
pinMode(EchoPin, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(TrigPin, LOW); 
delayMicroseconds(2);
digitalWrite(TrigPin, HIGH);
delayMicroseconds(10);
digitalWrite(TrigPin, LOW); 
  
 cm = pulseIn(EchoPin, HIGH) / 58.0;
  cm=(int(cm*100))/100;
   if (cm <= 10){
   r=0;
   }
    else{
    r=1;
    }
   Serial.print(r);      
    
}
