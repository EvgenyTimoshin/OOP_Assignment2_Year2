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
    this.health = 250;
    this.c = c;
    stuck = false;
    spotted = true;
    mass = 4.5;
    distanceFromPlayer = 201;
    fireRate = 2;
  }
  
  void render()
  {
    fill(0,0,255);
    rect(pos.x - size, pos.y - size*1.2,map(health,0,250,0,100),10);
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    stroke(0);
    strokeWeight(5);
    ellipse(0, 0, size, size);
    popMatrix();
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
      Bullet b = new Bullet(bp.x, bp.y, theta, 10, 4, 250);
      gameObjects.add(b);
    }
    
    //Display xp and 
    checkDeath();
   
   movement();
}
}//end class