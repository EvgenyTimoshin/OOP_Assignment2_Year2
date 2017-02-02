class Cash extends GameObject
{
  Boolean grow = true;
  int timeToLive;
  
  Cash(float x, float y)
  {
    pos = new PVector(x,y);
    size = 40;
    theta = 0;
    timeToLive = 600;
  }
  
  void render()
  {
     pushMatrix();
     translate(pos.x, pos.y, + 2);
     rotate(theta);
     fill(#FFCE08);
     ellipse(0, 0, size, size);
     fill(#FFF708);
     ellipse(0,0,size/1.3,size/1.3);
     fill(0, 255, 0);
     textSize(20);
     pushMatrix();
     translate(0,0);
     rotate(theta);
     text("S",0,+5);
     popMatrix();
     popMatrix();
  }
  
  void update()
  {
    if(size < 60 && grow)
    {
      size += 0.5;
    }
    else
    {
      grow = false;
    }
    
    if(grow == false && size > 40)
    {
      size-=0.5;
    }
   
    theta += 0.05f;
    if (dist(player.pos.x, player.pos.y,pos.x,pos.y) < 90)
        {
          gameObjects.remove(this);
          player.money += 5;
        }
     timeToLive--;
        
     if(timeToLive < 0)
     {
       gameObjects.remove(this);
     }
  }
}