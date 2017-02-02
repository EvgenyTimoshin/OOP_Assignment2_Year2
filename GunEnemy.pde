class GunEnemy extends Enemy
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
    this.c = c;
    health = 100;
    stuck = false;
    spotted = false;
    mass = 18;
    distanceFromPlayer = 201;
    fireRate = 10;
  }
  
  void render()
  {
    fill(0,0,255);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,100,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    //stroke(255,0,0);
    stroke(0);
    ellipse(0, 0, size, size);
    popMatrix();
    //rect(pos.x + width/2 - 40, pos.y + height/2 - 40, map(ammo,0,100,0,50), 5);
  }
  
  void update()
  {
    float random;
    random = (int)random(0,40);
    
    if (elapsed > toPass && random % 40 == 0 && spotted == true)//fire a bullet
    {
      forward.x = sin(theta);
      forward.y = -cos(theta);
      PVector bp = PVector.sub(pos, PVector.mult(forward, size + 5));
      Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 160);
      gameObjects.add(b);
    }
    
    //Display xp and 
    checkDeath();
   
   movement();
}
}//end class

void gunEnemySpawn()
{
  if(frameCount % 60 == 0)
  {
    float angle = random(0,10);
    
    float x = cos(angle) * 1200 + player.pos.x;
    float y = sin(angle) * 1200 + player.pos.y;
    
    GunEnemy g = new GunEnemy(x, y, 0, 50, 255);
    gameObjects.add(g);
  }
}