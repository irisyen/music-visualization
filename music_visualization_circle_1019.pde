import ddf.minim.*; 
import ddf.minim.analysis.*; 

Minim minim; 
AudioPlayer player; 
BeatDetect beat; 
float circle = 70; 


void setup(){ 
  size(640, 480); 
  minim = new Minim(this); 
  player = minim.loadFile("/Users/Zoe/Desktop/TheScientist.mp3", 2048); 
  beat = new BeatDetect(); 
  noCursor(); 
  player.loop(); 
} 

void draw(){ 
  beat.detect(player.mix); 
  //session 1 beat detect 

  
  fill(-1, 20); 
  rect(0, 0, width, height); 
  /* 
  translate(width/2, height/2); 
  noFill(); 
  fill(random(0,255), random(0,255), random(0,255), 100); 
  if (beat.isOnset()){ 
    circle = circle+40; 
    translate(random(width/2), random(height/2)); 
  }else { 
    circle = 0; 
  } 
  ellipse(0, 0, circle, circle); 
  noStroke(); 
  //stroke(-1, 40); 
  */ 
  //session 2 
  int b_size = player.bufferSize(); 
  //println(b_size); 
  // -1 ~ 1 internal buffer of audio 
  //float left = player.left.get(0); 
  //println(player.left.get(0)); 
   
  translate(width/2, height/2); 
   
  for (int i = 0; i < player.bufferSize(); i+=10){ 
    float x = (150)*cos(i*2*PI/b_size); 
    float y = (150)*sin(i*2*PI/b_size); 
    float x_size = (150 +player.left.get(i)*100)*cos(i*2*PI/b_size); 
    float y_size = (150 +player.right.get(i)*100)*sin(i*2*PI/b_size); 
    //stroke(random(255),random(255),random(255),100); //random(255),random(255),random(255),100
    stroke(#009393);
    line(x, y, x_size, y_size); 
  } 
   
}