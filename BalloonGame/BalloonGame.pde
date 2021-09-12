int score;
String pointText = "";
float missed, shots;
Canon canon;
Balloon[] balloons;

float gravityAcc = 9.82 / 10;
float windStrength = 15;
float windDirection;

int balloonTotal = 10;
int balloonAmount = 0;
int balloonWait;

PImage background;
PImage stick, flag;

void setup() {
  size(1000, 1000);
  imageMode(CENTER);
  background = loadImage("Pictures/Background.png");
  background.resize(width, height);
  stick = loadImage("Pictures/Stick.png");
  flag = loadImage("Pictures/Flag.png");
  canon = new Canon();
  balloons = new Balloon[balloonTotal];
}

void draw() {
  image(background, width / 2, height / 2);
  for(int i = 0; i < canon.projectiles.size(); i++)
    if(canon.projectiles.get(i).isDestroyed) {
      canon.projectiles.remove(i);
    }
    else
      canon.projectiles.get(i).display();
  for(Balloon b : balloons)
    if(b != null)
      b.display();
  canon.display();
  wind();
  drawFlag();
  increaseBalloonsAmount();
  createBalloons();
  fill(50);
  textSize(30);
  text("Score: " + score + " in " + millis() / 1000 + " seconds", 10, 35);
  text(pointText, 10, 70);
  text("Accuracy: " + getAccuracyText(), 10, 105);
}

String getAccuracyText() {
  float accuracy = (1 - missed / shots) * 100;
  if(accuracy == 0)
    return "Fucking horrible!";
  if(accuracy <= 10)
    return "Just bad...";
  if(accuracy <= 20)
    return "Are you even trying?";
  if(accuracy <= 30)
    return "Poor.";
  if(accuracy <= 40)
    return "It could be better.";
  if(accuracy <= 50)
    return "Alright.";
  if(accuracy <= 60)
    return "Above 50%";
  if(accuracy <= 70)
    return "Good good.";
  if(accuracy <= 80)
    return "You've tried this before.";
  if(accuracy <= 90)
    return "Sharpshooter";
  if(accuracy <= 100)
    return "Can't miss!";
  return "";
}

void wind() {
  windDirection = (noise(frameCount / 20f) * 2 - 1);
}

void drawFlag() {
  push();
    translate(700, 840);
    image(stick, 0, 0);
    scale(windDirection, 1);
    imageMode(CORNER);
    image(flag, 0, -100);
  pop();
}

void createBalloons() {
  for(int i = 0; i < balloonAmount; i++) //<>//
    if(balloons[i] == null || balloons[i].isDestroyed)
      balloons[i] = new Balloon();
}

void increaseBalloonsAmount(){
  if(balloonAmount < 10 && millis() > balloonWait * 1000) {
    balloonWait += 10;
    balloonAmount++;
  }
}

void mouseReleased() {
  canon.shoot();
}
