class Entity extends GameObject
{
  PVector velocity;
  PVector accel;
  float mass = 1;
  int health;
  int ammo;
  PVector force;
  color c;
  float power = 200;
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
            }
            else
            {
              health -=34;
            }
          }
          if(this instanceof Enemy)
          {
            spotted = true;
          }
          
          if(!(this instanceof Player) && !(b instanceof Arrow) )
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
}