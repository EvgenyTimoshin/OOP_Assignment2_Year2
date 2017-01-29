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
}