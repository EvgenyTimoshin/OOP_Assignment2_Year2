class GunEnemy extends Player
{
  
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
    this.ammo = 100;
    this.c = c;
    health = 100;
  }
  
  void render()
  {
    fill(0,255,0);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(255,0,0);
    ellipse(0, 0, size, size);
    
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
  }
  
  void update()
  {
    if(gameObjects.get(0) instanceof Player)
    {
      Player p = (Player)gameObjects.get(0);
      theta = -atan2(p.pos.x - pos.x, p.pos.y - pos.y);
    }
    
    forward.x = -sin(theta);
    forward.y = cos(theta);
    
    force.add(PVector.mult(forward, power));
    
    accel = PVector.div(force, mass);
    velocity.add(PVector.mult(accel, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    velocity.mult(0.99f);
    elapsed += timeDelta;
    
    float random;
    random = (int)random(0,10);
    
    if (elapsed > toPass && random % 10 == 0)
    {
      forward.x = sin(theta);
      forward.y = -cos(theta);
      PVector bp = PVector.sub(pos, PVector.mult(forward, size*1.5));
      Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4);
      gameObjects.add(b);
      elapsed = 0;
      ammo--;
    }
    
    
    if(health < 0)
    {
      gameObjects.remove(this);
      score++;
    }
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < size)
        {
          health -=34;
          gameObjects.remove(b);
        }
      }
   }
   
   for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2 - 1)
            && (wall.pos.x) <= (this.pos.x + size * 0.5 + 1)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5 - 1)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5 + 1))
        {
          forward.x = sin(HALF_PI);
          forward.y = -cos(HALF_PI);
          text("Collision",width/2,height/2);
          velocity.mult(-1);
        }
      }
   }
  
}
}

void enemiesSpawn()
{
  if(frameCount % 120 == 0)
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
        if ((wall.pos.x + wall.wallWidth) < (x - 100 )
            || (wall.pos.x) > (x + 100)
            && (wall.pos.y + wall.wallHeight) > (y - 100)
            || (wall.pos.y) < (y + 100))
        {
         gameObjects.add(m);
         break;
        }
      }
   }
    
  }
}