class Player extends Entity implements Wound
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
  Boolean torch;
  int arrowAmmo;
  
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
    torch = false;
    arrowAmmo = 15;
  }
  
  void render()
  {
    if(cameraZoom == 30)
    {
      pushMatrix();
      translate(0,0,+5);
      fill(255, 0, 0);
      rect(pos.x - width/2 + 20, pos.y - height/2 + 50,map(health,0,100,0,300),60); // health bar
      textSize(60);
      fill(#FF0011);
      
      text("A M M O :  " + ammo ,pos.x + width/2 - 300, pos.y + height/2 - 80 );//ammo
      fill(#DAE300);
      textSize(60);
      text("lvl: " + level ,pos.x - 50, pos.y + height/2 - 70);
      rect(pos.x - width/2 + 50, pos.y + height/2 - 50,map(xp,0,levelCap,0,width-100),20); /// xp bar
      popMatrix();
      
      pushMatrix();
      translate(0,0,+5);
      textSize(50);
      fill(#584834);
      text("ARROWS :  " + arrowAmmo ,pos.x + width/2 - 300, pos.y + height/2 - 130 );
      popMatrix();
    }
    
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    fill(c);
    stroke(c);
    ellipse(0, 0, size, size);
    if(gunEquipped)
    {
      line(0, 0, 0, size*1.5);
    }
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
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
    forward.x = 0;
    forward.y = -1;
    theta = (-atan2(mouseX  - width/2, mouseY - height/2));
    
    if(level % 100 == 0)
    {
      level = 0;
    }
    
      if (checkKey('w'))
      {
        if(north())
        {
          force.add(PVector.mult(forward, power));
          playerWallCollision = false;
        }
      }
      if (checkKey('s'))
      {
        if(south())
        {
          force.add(PVector.mult(forward, -power));
          playerWallCollision = false;
        }
      }
      if (checkKey('a'))  
      {
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
        if(torch == false)
        {
          torch = true;
        }
        else
        {
          torch = false;
        }
      }
      if (checkKey('1'))
      {
        cameraZoom = 30;
      }
      if (checkKey('2'))
      {
        cameraZoom = 23;
      }
      if (checkKey('3'))
      {
        cameraZoom = 16;
      }
      if (checkKey('4'))
      {
        this.pos.x = width/2;
        this.pos.y = height/2;
      }
      
      if (mousePressed && elapsed > toPass && ammo > 0 && gunEquipped == true)
      {
        audio.gunShot.rewind();
        audio.gunShot.setGain(-5);
        audio.gunShot.play();
        forward.x = sin(theta);
        forward.y = -cos(theta);
        PVector bp = PVector.sub(pos, PVector.mult(forward, size*1.5));
        Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 300);
        gameObjects.add(b);
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
      pos.add(PVector.mult(velocity, timeDelta));
      force.x = force.y = 0;
      velocity.mult(0.99f);
      elapsed += timeDelta;
    }//end collision
    
    if(health < 0)
    {
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
     levelCap = levelCap * 1.5;
     level++;
     audio.levelUp.rewind();
     //levelUp.setGain(-10);
     audio.levelUp.play();
     textSize(50);
   }
   
   camera(pos.x, pos.y, (height/2.0) / tan(PI*cameraZoom / 180.0 ), pos.x, pos.y, 0, 0, 1, 0);
    
   displayXp();
   
   
   if(health < 25)
   {
     audio.heartBeat.play();
   }
   else
   {
     //heartBeat.pause();
     //heartBeat.rewind();
   }
  
   if(bowEquipped)
   {
     bow.update();
     bow.render();
   }
   else
   {
     //gun render
   }
   
   projectileCollision();
   wallCollision();
   
  }//end update
  
  ////////////////////////////////////////////////
  
  void showXp(int enemyType)
  {
    showXp = true;
    displayCounter = 60;
    this.enemyTypeKilled = enemyType;
    killCount++;
  }
  
  void displayXp()
  {
    if(enemyTypeKilled == 4 && showXp && displayCounter > -1)
    {
      displayCounter--;
      textS+=1;
      textSize(textS);
      fill(#ECF502);
      pushMatrix();
      translate(0,0,+4);
      text("40xp",pos.x - size / 2 - 20, pos.y + size*2);
      popMatrix();
    }
    
    if(displayCounter < 0)
    {
      textS = 0;
      displayCounter = 60;
      showXp = false;
    }
  }
  
  void stopMovement()
  {
    playerWallCollision = true;
    velocity.mult(0);
  }//end sopMovement
  
  void bleed()
  {
    
  }

}