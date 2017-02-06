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

void ammoSpawn()
{
  float angle = random(0,10);
  float x = cos(angle) * 700 + player.pos.x;
  float y = sin(angle) * 700 + player.pos.y;
  
  if(frameCount % 320 == 0)
  {
    Ammo i = new Ammo(x, y, random(10, 40));
    gameObjects.add(i);
  }
}