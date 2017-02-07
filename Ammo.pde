class Ammo extends GameObject
{
  String type;
  
  Ammo(float x, float y, float size)
  {
    this.pos = new PVector(x,y);
    this.size = size;
    theta = random(0, 3.14);
  }
  
  void render()
  {
    fill(random(255), random(255), random(255));
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    triangle(0 , 0, size, -size, -size, -size);
    popMatrix();
  }
  
  void update()
  {
    theta += 0.01f;
    
    if(player.magnet || dist(player.pos.x,player.pos.y,pos.x,pos.y) < 180)
    {
      pos.lerp(player.pos, 0.09);
    }
  }
}