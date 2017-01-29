class GunEnemy extends Enemy
{
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  GunEnemy(float x, float y, float theta, float size, color c)
  { 
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    accel = new PVector(0,0);
    velocity = new PVector(0,0);
    force = new PVector(0, 0);
    this.theta = theta;
    this.size = size;
    this.health = 100;
    this.c = c;
    health = 100;
    stuck = false;
    spotted = false;
    mass = 2;
    distanceFromPlayer = 201;
  }
  
  void render()
  {
    fill(255,0,0);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    //stroke(255,0,0);
    stroke(0);
    ellipse(0, 0, size, size);
    
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
  }
  
  void update()
  {
    //spot enemy
    {
      
      theta = -atan2(player.pos.x - pos.x, player.pos.y - pos.y);
      
      if(dist(pos.x,pos.y,player.pos.x,player.pos.y) < 400)//check if player is close to enemy
      {
        spotted = true;
      }
    }
    
    forward.x = -sin(theta);
    forward.y = cos(theta);
    
    
    if(spotted == true)//movee enemy towards player if spotted
    {
      force.add(PVector.mult(forward, power));
    }
    
    //Used to move enemy towards player
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
    
    float random;
    random = (int)random(0,10);
    
    if (elapsed > toPass && random % 10 == 0 && spotted == true)//fire a bullet
    {
      forward.x = sin(theta);
      forward.y = -cos(theta);
      PVector bp = PVector.sub(pos, PVector.mult(forward, size + 5));
      Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 160);
      gameObjects.add(b);
    }
    
    //Display xp and 
    if(health < 0)
    {
      audio.death.rewind();
      audio.death.setGain(-10);
      audio.death.play();
      gameObjects.remove(this);
      player.xp += 10;
      player.showXp(4);
    }
    
   collisionCheck();//calls the superClass collision checking
}
}//end class

void gunEnemySpawn()
{
  if(frameCount % 200 == 0)
  {
    {
      for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
      {
        int x = (int)random(0,width);
        int y = (int)random(0,height);
        GunEnemy m = new GunEnemy(x, y, 0, 50, 255);
        
        GameObject go = gameObjects.get(i);
        if (go instanceof Wall)
        {
          Wall wall = (Wall) go;
          if ((wall.pos.x + wall.wallWidth) < (x - 150 )
              || (wall.pos.x) > (x + 150)
              || (wall.pos.y + wall.wallHeight) < (y - 150)
              || (wall.pos.y) > (y + 150))
          {
           gameObjects.add(m);
           break;
          }
        }
      }
      
    }
  }
}