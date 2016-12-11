class Bullet extends GameObject
{
  float theta;
  float size;
  float speed = 400;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, - size / 2, 0, size / 2);
    popMatrix();
  }
  
  void update() // Overrides the method in the base class
  {
    forward.x = -sin(theta);
    forward.y = +cos(theta);
    
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
    
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }
    
  }
}