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
    health = size * 1.8;
    stuck = false;
    spotted = true;
    mass = size/4;
    distanceFromPlayer = 201;
  }
  
  void render()
  {
    fill(0,255,0,map(health,0,100,0,255));
    stroke(255,0,0);
    strokeWeight(4);
    rect(pos.x - size*1.2, pos.y - size*1.8,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    //stroke(255,0,0);
    stroke(0);
    strokeWeight(5);
    ellipse(0, 0, size, size);
    pushMatrix();
    translate(0,0,-1);
     stroke(0);
    strokeWeight(5);
    rect(-30,0,20,size);
    rect(10,0,20,size);
    popMatrix();
    
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
  }
  
  void update()
  {
    checkDeath();
    
   //calls inherited methods
   movement();
  }//end udpate method
  
}//end class


void zombieSpawn()
{
  
  if(frameCount % 200 == 0)
  {
    float angle = random(0,10);
    
    float x = cos(angle) * 1200 + player.pos.x;
    float y = sin(angle) * 1200 + player.pos.y;
    
    Zombie m = new Zombie(x, y, 0, random(30,70), 255);
    gameObjects.add(m);
  }
}