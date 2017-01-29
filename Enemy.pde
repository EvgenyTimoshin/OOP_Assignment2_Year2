class Enemy extends Entity
{
  Boolean stuck;
  Boolean spotted;
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
  }
}