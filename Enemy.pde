class Enemy extends GameObject
{
  Boolean stuck;
  Boolean spotted;
  float distanceFromPlayer;
  PVector accel;
  PVector velocity;
  PVector force;
  int health;
  color c;
  float mass;
  float power = 200;
  float fireRate = 2;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  void render(){};
  
  void update(){};
  
  void collisionCheck(){
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Bullet)
      {
        Bullet b = (Bullet) go;
        if (dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < size)
        {
          if(b instanceof Arrow)
          {
            health = -1;
          }
          else
          {
            health -=34;
          }
          spotted = true;
          gameObjects.remove(b);
        }
      }
   }
   
   //Checks for collition between enemy and wall
   for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Wall)
      {
        Wall wall = (Wall) go;
        if ((wall.pos.x + wall.wallWidth) >= (this.pos.x - size/2 - 2)
            && (wall.pos.x) <= (this.pos.x + size * 0.5 + 2)
            && (wall.pos.y + wall.wallHeight) >= (this.pos.y - size * 0.5 - 2)
            && (wall.pos.y) <= (this.pos.y + this.size * 0.5 + 2))
        {
          text("Collision",width/2,height/2);
          velocity.mult(-1);
        }
      }
   }
  
  }
  
  void movement()
  { 
      theta = -atan2(player.pos.x - pos.x, player.pos.y - pos.y);
      
      if(dist(pos.x,pos.y,player.pos.x,player.pos.y) < 400)//check if player is close to enemy
      {
        spotted = true;
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
  }
}