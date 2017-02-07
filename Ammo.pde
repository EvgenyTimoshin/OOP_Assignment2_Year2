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
    pushMatrix();
    noStroke();
    translate(pos.x,pos.y);
    rotate(theta);
    fill(#5D3909);
    rect(0,0,50,35);
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