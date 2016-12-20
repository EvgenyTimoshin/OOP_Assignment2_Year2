class Ammo extends GameObject
{
  float theta;
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
  }
  
}

void ammoSpawn()
{
  if(frameCount % 320 == 0)
  {
    Ammo i = new Ammo(random(0,width), random(0,height), random(10, 40));
    gameObjects.add(i);
  }
}