import processing.serial.*;
int p_r;
Serial myPort;

int y,mo,d,h,m,s;   
PFont myFont;

void setup(){
    size(600,600);
    background(200);
    myPort = new Serial(this, "COM3", 9600);
}

void draw(){
  p_r=myPort.read();
  println(p_r);
    background(200);
    s = second();   
    m = minute();   
    h = hour();     
    d = day();      
    mo = month();   
    y = year();     

    myFont=createFont("FFScala",30);    
    myClockDraw();
}

void myClockDraw(){
  if(p_r!=49){
    translate(width/2,height/2);    
    fill(255);  
    stroke(0);
    strokeWeight(6);
    ellipse(0,0,400,400);
   
    stroke(0);     
    textFont(myFont);   
    fill(0);    
    text("12",-20,-160);
    text("3",168,10);
    text("6",-10,178);
    text("9",-188,10);
    fill(0);
    text(y+"-"+mo+"-"+d,-60,-93);   

    
    for(int i=1;i<=60;i++){
        pushMatrix();
        rotate(PI*2.0*i/60.0);  
        stroke(0);
        if(i%15==0){
            strokeWeight(6);
            line(0,-190,0,-200);
        }else if( i%5 ==0){
            strokeWeight(4);
            line(0,-192,0,-200);
        }else{
            strokeWeight(3);
            line(0,-195,0,-200);
        }
        popMatrix();
    }

    
    pushMatrix();   
    
    rotate(PI*2*s/60+PI);   
    stroke(0);  
    strokeWeight(2);   
    line(0,0,0,180);    
    popMatrix();

    pushMatrix();
    rotate(PI*2*m/60+PI);
    stroke(0);
    strokeWeight(4);
    line(0,0,0,140);    
    popMatrix();

    pushMatrix();
    rotate(PI*2*h/12+PI);
    stroke(0);
    strokeWeight(8);
    line(0,0,0,100);    
    popMatrix();  
}
else{
background(0);
}
}