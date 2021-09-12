class Balloon extends FlyingObject {
  
  int value;
  
  Balloon() {
    if(windDirection > 0)
      pos.x = - 50;
    else
      pos.x = width + 50;
    pos.y = random(50, 600);
    mass = 10;
    aeroDynamic = 100;
    setValue();
  }
  
  void setValue() {
    float rng = random(0, 100);
    if(rng <= 50) {
      value = 1;
      image = loadImage("Pictures/Blue.png");
      return;
    }
    if(rng <= 75) {
      value = 2;
      image = loadImage("Pictures/Green.png");
      return;
    }
    if(rng <= 90) {
      value = 3;
      image = loadImage("Pictures/Pink.png");
      return;
    }
    value = 5;
    image = loadImage("Pictures/Yellow.png");
  }
  
  void display() {
    super.display();
    image(image, pos.x, pos.y);
  }
  
  void applyForces() {
    wind();
    super.applyForces();
  }
}
