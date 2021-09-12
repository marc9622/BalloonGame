class Projectile extends FlyingObject{
  
  int points;
  int hits;
  float shootingStrength = 2000;
  
  Projectile(float angle) {
    pos = canon.pos;
    setStartAccAndPos(angle);
    mass = 50;
    aeroDynamic = 100;
    image = loadImage("Pictures/Dart.png");
    image.resize(15, 80);
  }
  
  void display() {
    super.display();
    push();
      translate(pos.x, pos.y);
      rotate(getAngle());
      image(image, 0, 0);
    pop();
    checkCollision();
  }
  
  void applyForces() {
    gravity();
    airResistance();
    wind();
    super.applyForces();
  }
  
  void setStartAccAndPos(float angle) {
    PVector dir = new PVector(cos(angle), sin(angle));
    acc.add(dir).mult(shootingStrength);
    pos.add(dir.mult(100)).add(new PVector(0, 0));
  }
  
  float getAngle() {
    if(vel.x != 0)
      return atan2(vel.y, vel.x) + PI/2;
    return 0;
  }
  
  void checkCollision() {
    for(Balloon b : balloons)
      if(b != null && !b.isDestroyed && pow(pos.x - b.pos.x, 2) + pow(pos.y - b.pos.y, 2) < 2000)
        hit(b);
  }
  
  void hit(Balloon balloon) {
    points += balloon.value;
    balloon.isDestroyed = true;
    hits++;
  }
  
  void destroy(){
    shots++;
    if(hits == 0)
      missed++;
    
    score += points * hits;
    pointText = "You hit " + hits + " and got " + points + " point(s)!";
    super.destroy();
  }
}
