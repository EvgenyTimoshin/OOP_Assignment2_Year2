class Trader extends GameObject
{
  Boolean trading;
  
  Trader(float x, float y)
  {
    pos = new PVector(x, y);
    trading = false;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y, + 4);
    text("Trader Here!!!", - 90, - 90);
    ellipse(0, 0, 100, 100);
    popMatrix();
  }
  
  void update()
  {
    if(dist(pos.x, pos.y, player.pos.x, player.pos.y) < 250)
    {
      if(!trading)
      {
        text("Press Space to Trade",player.pos.x - 120, player.pos.y + 110);
      }
      
      if(checkKey(' '))
      {
        trading = true;
      }
    }
    
    if(trading)
    {
      tradeMenu();
      player.controlling = false;
    }
  }
  
  void tradeMenu()
  {
    pushMatrix();
    translate(player.pos.x - 300, player.pos.y - 300,+6);
    rect(0,0, 600 , 600);
    
    //top left
    fill(0);
    rect(0,0, 300, 300);
    fill(255);
    textSize(40);
    text("Buy Gun Ammo", 55, 150);
    
    //top right
    fill(255,0,0);
    rect(300,0,300,300);
    fill(255);
    textSize(40);
    text("Buy Arrows", 370, 150);
    
    //bottom left
    fill(255,0,255);
    rect(0, 300, 300, 300);
    fill(255);
    text("Increase Fire Rate", 35, 450);
    
    //bottom right
    fill(0,0,255);
    rect(300, 300, 300,300);
    fill(255);
    text("Exit",410,450);
    
    popMatrix();
    
  }
}