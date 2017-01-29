class Arrow extends Bullet
{
  Arrow(float x, float y, float theta, float size, float timeToLive, float speed)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.theta = theta;
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
    this.speed = speed;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, +4);
    fill(255);
    rotate(theta);
    stroke(#553000);
    strokeWeight(2);
    line(0, - size, 0, 20);
    fill(#818181);
    stroke(#818181);
    triangle(0, - size-6, 6, -size, -6, -size);
    strokeWeight(1);
    popMatrix();
  }
  
  void update() // Overrides the method in the base class
  {
    forward.x = +sin(theta);
    forward.y = -cos(theta);
    
    pos.add(PVector.mult(PVector.mult(forward, speed), timeDelta));
    
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }
    bulletWallCollision();
  }
}