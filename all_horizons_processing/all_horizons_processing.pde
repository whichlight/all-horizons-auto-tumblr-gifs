/*
 all horizons
 Kawandeep Virdee
 
 */

boolean saveFrames = false;
int time=0;
ArrayList lights;
float DECAY=random(0.15,0.9); //0.15 to 0.9
float DURATION= random(2,6); //2 to 8
int RATE_BIRTH = int(random(5,20)); //from 1 to 20

float front = random(0,360);
float back = random(0,360);
boolean saved = false;

void setup() {
  frameRate(20);
  size(600, 600);
  colorMode(HSB, 360, 100, 100, 1);
  lights = new ArrayList();

}

void draw() {
  noStroke();
  fill(back,100,100);
  rect(0, 0, width, height);
  if(time%RATE_BIRTH==0){
     lights.add(new LightBar()); 
  }

  for (int i=0; i<lights.size(); i++) {
    LightBar box = (LightBar) lights.get(i);
    box.display();
    box.update();
    if(box.y>height/2+20){
      lights.remove(box);
      if(saveFrames==true){
        saveFrames=false;
      }
      if(!saved){
        saveFrames=true;
        saved = true;
      }
    }
  }
  
  

  if (saveFrames) {
      save("images/"+str(time)+".png");
  }
  time++;
}

class LightBar {
  float y;

  LightBar() {
    y=5;
  }

  void update() {
    y++;
  }

  void display() {
    noStroke();
    fill(front,100,100, 1-pow(((DURATION*y)/height),DECAY));
    rect(0, height/2-y, width, 2*y);
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println("Start saving frames");
      saveFrames=true;
    } 
    else if (keyCode == DOWN) {
      println("Stop saving frames");
      saveFrames=false;
    }
  }
}

