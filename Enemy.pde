class Enemy extends Entity
{
  Boolean stuck;
  float distanceFromPlayer;
  
  void render(){};
  
  void update(){};
   
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
    
    projectileCollision();
    wallCollision();
    
    if(dist(player.pos.x , player.pos.y, pos.x, pos.y) < size*1.6)
    {
      audio.bite.rewind();
      audio.bite.play();
      velocity.mult(-1.5);
      player.health -= 5;
    }
  }
  
  void checkDeath()
  {
    if(health < 0)
    {
      audio.death.rewind();
      audio.death.setGain(-10);
      audio.death.play();
      gameObjects.remove(this);
      Cash c = new Cash(pos.x, pos.y);
      gameObjects.add(c);
      player.showXp(4);
      player.killStreak();
      player.xp += 10;
    }
  }
}