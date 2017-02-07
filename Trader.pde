class Trader extends GameObject
{
  Boolean trading;
  int fireRateCostMult;
  
  Trader(float x, float y)
  {
    pos = new PVector(x, y);
    trading = false;
    fireRateCostMult = 1;
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
        text("Press Space to Trade",player.pos.x - 140, player.pos.y + 110);
      }
      
      if(checkKey(' '))
      {
        trading = true;
      }
    }
    
    if(trading)
    {
      pushMatrix();
        translate(0,0,+7);
        tradeMenu();
      popMatrix();
    }
  }
  
  void tradeMenu()
  {
    player.controlling = false;
    PVector base = new PVector(player.pos.x - 300, player.pos.y - 300);
    
    pushMatrix();
    translate(base.x, base.y,+6);
    rect(0,0, 600 , 600);
    
    //top left
    fill(0);
    rect(0,0, 300, 300);
    fill(255);
    textSize(40);
    text("Press 1", 105, 110);
    text("Buy Gun Ammo", 55, 150);
    text("Cost: 10", 95, 200);
    if(checkKey('1'))
    {
      if(player.money >= 10)
      {
        player.money -= 10;
        player.ammo += 30;
      }
    }
    
    //top right
    fill(255,0,0);
    rect(300,0,300,300);
    fill(255);
    textSize(40);
    text("Press 2",400, 110);
    text("Buy Arrows", 370, 150);
    text("Cost : 20", 395, 200);
    if(checkKey('2'))
    {
      if(player.money >= 30)
      {
        player.money -= 30;
        player.arrowAmmo += 15;
      }
    }
    
    //bottom left
    fill(255,0,255);
    rect(0, 300, 300, 300);
    fill(255);
    text("Press 3", 100, 410);
    text("Increase Fire Rate", 35, 450);
    text("Cost: " + fireRateCostMult*100, 80, 490);
    if(checkKey('3'))
    {
      if(player.money >= fireRateCostMult * 100)
      {
        fireRateCostMult++;
        player.money  -= fireRateCostMult * 200;
        player.fireRate += 1;
      }
    }
    
    //bottom right
    fill(0,0,255);
    rect(300, 300, 300,300);
    fill(255);
    text("Press 4 to Exit",340,450);
    if(checkKey('4'))
    {
      trading = false;
      player.controlling = true;
    }
    
    popMatrix(); 
  }
}