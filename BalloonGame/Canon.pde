class Canon {
  
  PVector pos;
  float rot;
  ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
  float cooldown = 1; //In seconds
  float time;
  PImage imageFoot = loadImage("Pictures/Foot.png");
  PImage imageBody = loadImage("Pictures/Body.png");
  
  Canon() {
    imageFoot.resize(70, 100);
    imageBody.resize(75, 150);
  }
  
  void display() {
    pos = new PVector(width / 2, height - 150);
    push();
      translate(pos.x, pos.y);
      setRotation();
      image(imageBody, 0, -35);
    pop();
    image(imageFoot, pos.x, pos.y + 25);
  }
  
  void setRotation() {
    if(mouseX != 0)
      rot = atan2(mouseY - pos.y, mouseX - pos.x);
    rotate(rot + PI/2);
  }
  
  void shoot() {
    if(millis() > time) {
      projectiles.add(new Projectile(rot));
      time = millis() + cooldown * 1000;
    }
  }
}
