class Wall extends GameObject
{
  float wallWidth;
  float wallHeight;
  
  Wall(float x, float y,float wallWidth, float wallHeight)
  {
    pos = new PVector(x,y);
    this.wallWidth = wallWidth;
    this.wallHeight = wallHeight;
  }
  
  void render()
  {
    pushMatrix();
    translate(0,0,+4);
    stroke(0);
    fill(0);
    rect(pos.x,pos.y,wallWidth,wallHeight);
    popMatrix();
  }
  
  void update()
  {
    
  }
}