class Blood extends GameObject
{
  PVector velocity;
  PVector accel;
  float mass = 1;
  PVector force;
  float timeToMove = 0;
  float timeToLive = 6000;
  float power;
  color c;
  
  
  
  Blood(float x, float y, float theta)
  {
    pos = new PVector(x, y);
    size = random(2, 40);
    pos = new PVector(x, y);
    forward = new PVector(0,-1);
    accel = new PVector(10,10);
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    mass = 0.5;
    power = 250;
    force.add(PVector.mult(forward, power));
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    this.theta = random(theta - 0.4, theta + 0.4);
    c = color(random(255, 190),random(0,40), random(0,40));
  }
  
  void render()
  {
    fill(c);
    stroke(#832020);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update()
  {
      timeToMove ++;
      timeToLive --;
      if(timeToMove < 40 && size < 4 
          || timeToMove < 37 && size > 4 && size < 8
          || timeToMove < 34 && size < 12 && size > 4
          || timeToMove < 30 && size > 12 && size < 20
          || timeToMove < 28 && size > 20 &&  size < 23 
          || timeToMove < 22 && size > 25
          || timeToMove < 17 && size > 25 && size < 33
          || timeToMove < 10 && size > 34 && size < 38 
          || timeToMove < 0 && size > 39)
      {
        force.add(PVector.mult(forward, power));
      }
      forward.x = (-sin(theta));
      forward.y = (+cos(theta));
      accel = PVector.div(force, mass);
      velocity.add(PVector.mult(accel, timeDelta));
      if(timeToMove > 80)
      {
        velocity.x = velocity.x *0.70;
        velocity.y = velocity.y * 0.70;
      }
      pos.add(PVector.mult(velocity, timeDelta));
      force.x = force.y = 0;
      velocity.mult(0.99f);
      
      if(timeToLive < 0)
      {
        gameObjects.remove(this);
      }
  }
}