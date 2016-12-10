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
  float power = 200;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
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
    this.ammo = 100;
    this.c = c;
    
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    fill(c);
    stroke(c);
    ellipse(0, 0, size, size);
    line(0, 0, 0, size*1.5);
    popMatrix();
  }
  
  void update()
  {
    forward.x = 0;
    forward.y = -1;
    theta = -atan2(mouseX - pos.x, mouseY - pos.y);
    
    if (checkKey('w'))
    {
      force.add(PVector.mult(forward, power));
    }
    if (checkKey('s'))
    {
      force.add(PVector.mult(forward, -power));      
    }
    if (checkKey('a'))  
    {
      forward.x = sin(QUARTER_PI);
      forward.y = -cos(QUARTER_PI);
      force.add(PVector.mult(forward, -power));
       
    }
    if (checkKey('d'))
    {
      forward.x = sin(QUARTER_PI);
      forward.y = -cos(QUARTER_PI);
      force.add(PVector.mult(forward, power));
    }
    if (mousePressed && elapsed > toPass && ammo > 0)
    {
      Bullet b = new Bullet(pos.x, pos.y, theta, 10, 4);
      gameObjects.add(b);
      elapsed = 0;
      ammo--;
    }
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
  }

}