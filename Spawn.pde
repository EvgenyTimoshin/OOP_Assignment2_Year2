class Spawn
{
  int spawnCount = 170;
  Boolean military = false;
  Boolean trading = false;
  int tradingTimer;
  int militaryInvasionTimer = 1800;
  
  Spawn()
  {
  }
  
  void update()
  {
    ammoSpawn();
    
    if(trading)
    {
      trader.render();
      trader.update();
    }
    else if(frameCount % 6000 == 0)
    {
      military = true;
    }
    
    if(trading && tradingTimer > 0)
    {
      military = false;
      trader.render();
      trader.update();
      tradingTimer--;
      fill(0, 0, 255);
      textSize(60);
      text("Trade Time Left : " + tradingTimer/60, player.pos.x - 250, player.pos.y - 350);
    }
    else
    {
      trading = false;
    }
    
    if(military && militaryInvasionTimer > 0)
    {
      fill(0, 255, 0);
      textSize(60);
      text("MILITARY INVASION SURVIVE", player.pos.x - 260, player.pos.y - 350);
      militaryInvasionTimer--;
    }
    else
    {
      military = false;
      militaryInvasionTimer = (int) random(800, 2000);
    }
    
    if(frameCount % 3600 == 0)
    {
      spawnCount *= 0.8;
    }
  
    if(!military && !trading)
    {
      zombieSpawn();
    }
    else if(military)
    {
      gunEnemySpawn();
    }
  }
  
   void zombieSpawn()
  {
  
    if(frameCount % spawnCount == 0)
    {
      float angle = random(0,10);
      float horde = random(0,100);
      
      if(horde < 8)
      {
        spawnHorde(angle);
      }
      else
      {
        float x = cos(angle) * 1200 + player.pos.x;
        float y = sin(angle) * 1200 + player.pos.y;
        Zombie m = new Zombie(x, y, 0, random(30,70), 255);
        gameObjects.add(m);
      }
    }
  }

  void spawnHorde(float angle)
  {
      float count = random(10, 20);
        
      for(int i = 0; i < count; i++)
      {
        float x = cos(angle) * 1200 + player.pos.x;
        float y = sin(angle) * 1200 + player.pos.y;
        Zombie m = new Zombie(x, y, 0, random(30,70), 255);
        gameObjects.add(m);
        angle += 0.2;
      }
  }
  
  void gunEnemySpawn()
  {
    if(frameCount % 180 == 0)
    {
      float angle = random(0,10);
      
      float x = cos(angle) * 1200 + player.pos.x;
      float y = sin(angle) * 1200 + player.pos.y;
      
      GunEnemy g = new GunEnemy(x, y, 0, 50, 255);
      gameObjects.add(g);
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
  
  void traderArrival()
  {
    float angle = random(0,10);
    float x = cos(angle) * 700 + player.pos.x;
    float y = sin(angle) * 700 + player.pos.y;
    trader = new Trader(x , y);
    trading = true;
    tradingTimer = 1200;
    military = false;
  }
  
}//end class