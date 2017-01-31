class Cash extends GameObject
{
  Cash(float x, float y)
  {
    pos = new PVector(x,y);
    size = 40;
  }
  
  void render()
  {
     pushMatrix();
     translate(pos.x, pos.y, + 2);
     fill(0, 255, 50);
     rect(0, 0, size*2, size);
     popMatrix();
  }
  
  void update()
  {
    if (dist(player.pos.x, player.pos.y,pos.x,pos.y) < 90)
        {
          gameObjects.remove(this);
          player.money += 5;
        }
  }
}