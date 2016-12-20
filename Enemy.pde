class Enemy extends Player
{
  int gunner;
  
  Enemy(float x, float y, float theta, float size, color c,int gunner)
  {
    if(gunner == 1)
    {
      power = 60;
    }
    else
    {
      power = 120;
    }
    
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
    this.gunner = gunner;
  }
  
  void render()
  {
    fill(0,255,0);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    if(gunner == 1)
    {
      fill(255,0,0);
    }
    else
    {
      fill(0,255,0);
    }
    stroke(255,0,0);
    ellipse(0, 0, size, size);
    if(gunner == 1)
    {
      line(0, 0, 0, size*1.5);
    }
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
    
    if (elapsed > toPass && random % 10 == 0 && gunner == 1)
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
  
}
}

void enemiesSpawn()
{
  if(frameCount % 120 == 0)
  {
    Enemy m = new Enemy(random(0,width), random(0,height), 0, 50, 255,((int)random(0,2)));
    gameObjects.add(m);
  }
}