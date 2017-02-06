class Player extends Entity
{
  float cameraZoom;
  Boolean playerWallCollision = false;
  int level;
  int xp;
  Boolean showXp;
  float displayCounter;
  int enemyTypeKilled;
  float textS;
  float levelCap;
  int skillPoints;
  int killCount;
  color gunC;
  Boolean gunEquipped;
  Boolean bowEquipped;
  Boolean torchEquipped;
  int arrowAmmo;
  Boolean controlling;
  int money;
  Boolean someKeyPressed = false;
  float multiplier;
  float multiplierTime;
  float maxMultiplierTime;
  Boolean multiplierEnabled = false;
  Boolean magnet = false;
  float magnetTimer = 0;
  
  Player()
  {};
  
  Player(float x, float y, float theta, float size, color c)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    this.health = 100;
    this.ammo = 1000;
    this.c = c;
    cameraZoom = 30;
    level = 1;
    xp = 0;
    displayCounter = 60;
    enemyTypeKilled = 0;
    textS = 0;
    levelCap = 100;
    skillPoints = 0;
    killCount = 0;
    gunEquipped = true;
    bowEquipped = false;
    torchEquipped = false;
    arrowAmmo = 15;
    controlling = true;
    money = 50;
    fireRate = 4;
    power = 350;
    mass = 1;
    multiplier = 1.0f;
    multiplierTime = 0;
    maxMultiplierTime = 400;
  }
  
  void render()
  {
    clock.render();
    clock.update();
    ui.render(pos,ammo,level,health,xp,levelCap,arrowAmmo,money,multiplier,multiplierTime,maxMultiplierTime,killCount,magnetTimer);
    strokeWeight(5);
    pushMatrix();
    translate(pos.x, pos.y,+5);
    rotate(theta);
    fill(c);
    stroke(0);
    if(gunEquipped)
    {
      stroke(#FFE37E);
      strokeWeight(14);
      line(+45, +47, 0, +90);
      line(-45, +47, 0, +90);
      stroke(0);
      strokeWeight(13);
      line(0, +90, 0, +140);
      strokeWeight(5);
    }
    rect(-50,0,45,45);
    rect(5,0,45,45);
    fill(255,0,0);
    pushMatrix();
    translate(0, 0, +1);
    ellipse(0,+20,60,60);
    popMatrix();
    
    
    popMatrix();
  }
  
  Boolean north()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {  
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2)
            && (wall.pos.x) <= (this.pos.x + size * 0.5)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5 - 2)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5))
        {
          stopMovement();
          text("Collision NORTH",width/2, height/2);
          return false;
        }
      }
   }
   return true;
  }
  
  Boolean south()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {  
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2)
            && (wall.pos.x) <= (this.pos.x + size * 0.5)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5 + 2))
        {
          stopMovement();
          text("Collision SOUTH",width/2, height/2);
          return false;
        }
      }
   }
   return true;
  }
  
  Boolean west()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {  
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2 - 2)
            && (wall.pos.x) <= (this.pos.x + size * 0.5)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5))
        {
          stopMovement();
          text("Collision WEST",width/2, height/2);
          return false;
        }
      }
   }
   return true;
  }
  
  Boolean east()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {  
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2)
            && (wall.pos.x) <= (this.pos.x + size * 0.5 + 2)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5))
        {
          stopMovement();
          text("Collision EAST",width/2, height/2);
          return false;
        }
      }
   }
   return true;
  }
  
  void update()
  {
    fireRate = 2 * multiplier;
    
    if(level % 100 == 0)
    {
      level = 0;
    }
    
    someKeyPressed = false;
    
    if(controlling)
    {
    
      forward.x = 0;
      forward.y = -1;
      theta = (-atan2(mouseX  - width/2, mouseY - height/2));
      
      if (checkKey('w'))
      {
        someKeyPressed = true;
        if(north())
        {
          force.add(PVector.mult(forward, power));
          playerWallCollision = false;
        }
      }
      if (checkKey('s'))
      {
        someKeyPressed = true;
        if(south())
        {
          force.add(PVector.mult(forward, -power));
          playerWallCollision = false;
        }
      }
      if (checkKey('a'))  
      {
        someKeyPressed = true;
        if(west())
        {
          forward.x = sin(HALF_PI);
          forward.y = -cos(HALF_PI);
          force.add(PVector.mult(forward, -power));
          playerWallCollision = false;
        }
      }
      if (checkKey('d'))
      {
        someKeyPressed = true;
        if(east())
        {
          forward.x = sin(HALF_PI);
          forward.y = -cos(HALF_PI);
          force.add(PVector.mult(forward, power));
          playerWallCollision = false;
        }
      }
      
      if (checkKey('t'))
      {
        if(torchEquipped == false)
        {
          torchEquipped = true;
        }
        else
        {
          torchEquipped = false;
        }
      }
  
      if(bowEquipped)
       {
          bow.update();
          bow.render();
       }
       
    }//end Controlling
          
    if(checkKey ('r'))
    {
       if(bowEquipped)
       {
         bowEquipped = false;
         gunEquipped = true;
       }
       else
       {
         bowEquipped = true;
         gunEquipped = false;
       }
    }
      
      if(torchEquipped)
      {
        torch.render();
        torch.update();
      }
      toPass = 1.0 / fireRate;
      
      if (mousePressed && elapsed > toPass && ammo > 0 && gunEquipped == true)
      {
        audio.gunShot.rewind();
        audio.gunShot.setGain(-5);
        audio.gunShot.play();
        forward.x = sin(theta);
        forward.y = -cos(theta);
        
        if(multiplier < 3.5)
        {
          PVector bp = PVector.sub(pos, PVector.mult(forward, size*2));
          Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 600);
          gameObjects.add(b);
        }
        else
        {
          PVector bp = PVector.sub(pos, PVector.mult(forward, size*2));
          Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 600);
          gameObjects.add(b);
          bp = PVector.sub(pos, PVector.mult(forward, size*2));
          b = new Bullet(bp.x, bp.y, theta - 0.3, 10, 4, 600);
          gameObjects.add(b);
          bp = PVector.sub(pos, PVector.mult(forward, size*2));
          b = new Bullet(bp.x, bp.y, theta + 0.3, 10, 4, 600);
          gameObjects.add(b);
        }
        elapsed = 0;
        if(gunEquipped)
        {
          ammo--;
        }
        else
        {
          arrowAmmo--;
        }
      }
      
    if(playerWallCollision == false)
    {
      accel = PVector.div(force, mass);
      velocity.add(PVector.mult(accel, timeDelta));
      if(someKeyPressed == false)
      {
        velocity.x = velocity.x *0.80;
        velocity.y = velocity.y * 0.80;
      }
      pos.add(PVector.mult(velocity, timeDelta));
      force.x = force.y = 0;
      velocity.mult(0.99f);
      elapsed += timeDelta;
    }//end collision
    
    if(health < 0)
    {
      String score = str(killCount) + ' ' + year() +  ' ' + month() + ' ' + day() + ' ' + hour() + ' ' + minute();
      String[] list = split(score,' ');
      saveStrings("data/highscore.txt",list);
      gameObjects.remove(this);
    }
      
    for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition with ammo pickups
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Ammo)
      {
        Ammo item = (Ammo) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < size)
        {
          ammo += size/5;
          gameObjects.remove(item);
        }
      }
   }
   
   if(xp > levelCap)
   {
     xp = 0;
     level++;
     if(level % 3 == 0)
     {
       ui.speedLvl();
       mass -= 0.3;
     }
     
     levelCap = levelCap * 1.5;
     
     if(level % 5 == 0)
     {
       ui.cameraLvl();
       cameraZoom -= 0.3;
     }
     audio.levelUp.rewind();
     audio.levelUp.play();
     textSize(50);
   }
   
   camera(pos.x, pos.y, (height/2.0) / tan(PI*cameraZoom / 180.0 ), pos.x, pos.y, 0, 0, 1, 0);
   
   if(health < 25)
   {
     audio.heartBeat.play();
   }
   
   projectileCollision();
   wallCollision();
   
   if(multiplierEnabled && multiplierTime > 0)
   {
      if(multiplierTime > maxMultiplierTime)
      {
        multiplier += 0.5;
        maxMultiplierTime *= 1.2;
        multiplierTime = 100;
      }
   }
   else
   {
     multiplierEnabled = false;
     multiplier = 1;
   }
   
   if(multiplierTime > 0)
   {
     multiplierTime -= 0.5 * multiplier;
   }
   
   if(magnet && magnetTimer > 0)
   {
     magnetTimer--;
   }
   else
   {
     magnet = false;
   }
   
  }//end update
  
  ////////////////////////////////////////////////
  
  void showXp(int enemyType)
  {
    showXp = true;
    displayCounter = 60;
    this.enemyTypeKilled = enemyType;
    killCount++;
  }
  
  void stopMovement()
  {
    playerWallCollision = true;
    velocity.mult(0);
  }//end sopMovement
  
  void killStreak()
  {
    multiplierEnabled = true;
    multiplierTime += 120;
  }
  
  void pickUpMagnet()
  {
    magnet = true;
    magnetTimer += 3000;
  }
}