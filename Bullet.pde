class Bullet extends GameObject
{
  float theta;
  float size;
  float speed;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive, float speed)
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
    translate(pos.x, pos.y,+4);
    rotate(theta);
    fill(255,0,0);
    stroke(255,0,0);
    strokeWeight(7);
    line(0, - size / 2, 0, size / 2);
    strokeWeight(1);
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
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x)
            && (wall.pos.x) <= (this.pos.x)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y)
            && (wall.pos.y) <= (this.pos.y))
        {
          gameObjects.remove(this);
        }
      }
   }
    
  }
  
}