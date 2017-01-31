class Zombie extends Enemy
{
  Zombie(float x, float y, float theta, float size, color c)
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
    mass = 1.4;
    distanceFromPlayer = 201;
  }
  
  void render()
  {
    fill(0,255,0);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    //stroke(255,0,0);
    stroke(0);
    ellipse(0, 0, size, size);
    pushMatrix();
    translate(0,0,-1);
    rect(-30,0,20,40);
    rect(10,0,20,40);
    popMatrix();
    
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
  }
  
  void update()
  {
    if(health < 0)
    {
      audio.death.rewind();
      audio.death.setGain(-10);
      audio.death.play();
      gameObjects.remove(this);
      Cash c = new Cash(pos.x, pos.y);
      gameObjects.add(c);
      player.xp += 10;
      player.showXp(4);
    }
    
   //calls inherited methods
   movement();
  }//end udpate method
}//end class


void zombieSpawn()
{
  if(frameCount % 200 == 0)
  {
    {
      for(int i = 0 ; i < gameObjects.size() ; i ++)//Checks for collition between PLayer and wall
      {
        int x = (int)random(0,width);
        int y = (int)random(0,height);
        Zombie m = new Zombie(x, y, 0, 50, 255);
        
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