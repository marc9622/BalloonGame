class FlyingObject {
  
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float mass;
  PImage image;
  boolean isDestroyed = false;
  float aeroDynamic;
  
  void display() {
    if(isDestroyed)
      return;
    if(isOutOfFrame())
      destroy();
    applyForces();
  }
  
  void applyForces() {
    acc.div(mass);
    vel.add(acc);
    pos.add(vel);
    acc = new PVector();
  }
  
  void gravity() {
    acc.add(0, gravityAcc * mass);
  }
  
  void airResistance() {
    PVector drag = new PVector(vel.x, vel.y);
    drag.mult(-1);
    drag.normalize();
    drag.mult((1 / aeroDynamic) * pow(vel.mag(),2));
    acc.add(drag);
  }
  
  void wind() {
    acc.add(windDirection * windStrength, 0);
  }
  
  boolean isOutOfFrame() {
    if(pos.x - 100 > width || pos.x + 100 < 0 || pos.y > height + 100)
      return true;
    return false;
  }
  
  void destroy() {
    isDestroyed = true;
  }
}
