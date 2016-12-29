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
    translate(pos.x, pos.y);
    fill(255);
    rotate(theta);
    fill(255,0,0);
    stroke(255,0,0);
    strokeWeight(2);
    line(0, - size, 0, 20);
    noFill();
    triangle(0, - size+20, 20, -size, -20, -size);
    strokeWeight(1);
    popMatrix();
  }
}