class Blood extends GameObject
{
  PVector velocity;
  PVector accel;
  float mass = 1;
  PVector force;
  float timeToMove = 0;
  float timeToLive = 600;
  float power;
  color c;
 
  Blood(float x, float y, float theta)
  {
    pos = new PVector(x, y);
    size = random(0, 32);
    pos = new PVector(x, y);
    forward = new PVector(0,-1);
    accel = new PVector(10,10);
    velocity = new PVector(0,0);
    force = new PVector(0,0);
    mass = 0.5;
    power = 130;
    force.add(PVector.mult(forward, power));
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    this.theta = random(theta - 0.7, theta + 0.7);
    c = color(random(255, 190),random(0,40), random(0,40));
  }
  
  void render()
  {
    fill(c);
    //stroke(#832020);
    noStroke();
    ellipse(pos.x, pos.y, size, size);
  }
  
  void update()
  {
      timeToMove ++;
      timeToLive --;
      
      if(timeToMove < 13 && size < 3 ||
          timeToMove < 45 && size < 5 && size > 3 
          || timeToMove < 39 && size > 5 && size < 8
          || timeToMove < 34 && size < 12 && size > 4
          || timeToMove < 30 && size > 12 && size < 20
          || timeToMove < 28 && size > 20 &&  size < 23 
          || timeToMove < 22 && size > 25
          || timeToMove < 17 && size > 25 && size < 33
          || timeToMove < 7 && size > 34 && size < 38 
          || timeToMove < 2 && size > 38)
      {
        force.add(PVector.mult(forward, power));
      }
      if(size > 5)
      {
        forward.x = (-sin(theta));
        forward.y = (+cos(theta));
        power = 200;
      }
      else
      {
        forward.x = (sin(theta));
        forward.y = (-cos(theta));
      }
      accel = PVector.div(force, mass);
      velocity.add(PVector.mult(accel, timeDelta));
      if(timeToMove > 45)
      {
        velocity.x = velocity.x *0.55;
        velocity.y = velocity.y * 0.55;
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