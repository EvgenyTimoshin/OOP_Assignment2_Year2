class Gun extends GameObject
{
  float fireRate = 2;
  float theta;
  
  Gun()
  {
    theta = 0;
    pos = new PVector(random(0,width), random(0,height));
  }
  
  void update()
  {
    theta += 0.01;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y,+4);
    rotate(theta);
    stroke(255, 255, 0);
    noFill();
    fill(0);
    noStroke();
    rect(0, 0, 30, 4);
    rect(0, 0, 8, 15);
    fill(#454D21);
    rect(2, 8, 4, 6);
    popMatrix();
  }
}