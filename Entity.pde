class Entity extends GameObject implements Biological
{
  PVector velocity;
  PVector accel;
  float mass = 5;
  int health;
  int ammo;
  PVector force;
  color c;
  float power = 400;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  Boolean spotted;
  
  void projectileCollision()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < size)
        {
          if(b instanceof Arrow && !(this instanceof Player))
          {
            health = -1;
          }
          else if(!(b instanceof Arrow))
          {
            if(this instanceof Player)
            {
              audio.playerShot.rewind();
              audio.playerShot.setGain(-10);
              audio.playerShot.play();
              health -= 10;
              player.bleed(b.theta);
              gameObjects.remove(b);
              
            }
            else
            {
              health -=34;
            }
          }
          
          if(this instanceof Enemy && !(b instanceof Arrow))
          {
            spotted = true;
            this.bleed(b.theta);
            gameObjects.remove(this);
          }
          else if(this instanceof Enemy && b instanceof Arrow)
          {
            this.bleed(-b.theta);
            gameObjects.remove(b);
          }
          
          if(!(this instanceof Player) && !(b instanceof Arrow))
          {
            
            gameObjects.remove(b);
          }
        }
      }
   }
  }
  
  void wallCollision()
  {
    for(int i = 0 ; i < gameObjects.size() ; i ++)
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
          text("Collision",width/2,height/2);
          velocity.mult(-1);
        }
      }
   }
  }
  
  void update()
  {
  
  }
  void render()
  {
  }
  
  void bleed(float theta)
  {
    for(int i = 0; i < 30; i++)
    {
      Blood blood = new Blood(pos.x, pos.y, theta);
      gameObjects.add(blood);
    }
    for(int i = 0; i < 4; i++)
    {
      Blood blood = new Blood(pos.x, pos.y, theta);
      blood.size = random(38, 45);
      blood.mass = 2;
      gameObjects.add(blood);
    }
  }
}