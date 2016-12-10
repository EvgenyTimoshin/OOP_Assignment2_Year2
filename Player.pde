class Player extends GameObject
{
  PVector velocity;
  PVector accel;
  float theta;
  float mass = 1;
  int health;
  int ammo;
  PVector force;
  color c;
  
  Player(float x, float y, float theta, float size, color c)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    this.health = 100;
    this.ammo = 0;
    this.c = c;
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-theta);
    fill(c);
    stroke(c);
    ellipse(0, 0, size, size);
    line(0, 0, 0, size*1.5);
    popMatrix();
  }
  
  void update()
  {
    theta = atan2(mouseX - pos.x, mouseY - pos.y);
  }

}