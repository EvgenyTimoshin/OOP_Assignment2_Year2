class Bow extends GameObject
{
  Boolean holding;
  float stretchDist;
  float prevMouseX;
  Boolean shoot;
  float theta;
  
  Bow()
  {
    pos = new PVector(width/2, height/2);
    size = 100;
    theta = 0;
    forward = new PVector(0, -1);
    shoot = false;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    stroke(255);
    strokeWeight(10);
    noFill();
    pushMatrix();
    rotate(3.14);
    arc(0, 0, 200, 100, 0, PIE);
    popMatrix();
    
    if(mousePressed)
    {
      strokeWeight(2);
      line(100, 0, 0,stretchDist);
      line( - 100, 0, 0,stretchDist);
    }
    else if(stretchDist > 0)
    {
      strokeWeight(2);
      line(100, 0, prevMouseX,stretchDist);
      line( - 100, 0, prevMouseX,stretchDist);
    }
    popMatrix();    
  }
  
  void update()
  {
    GameObject go = gameObjects.get(0);
    Player p = (Player) go;
    
    pos.x = p.pos.x;
    pos.y = p.pos.y;
    forward.x = 0;
    forward.y = -1;
    theta = (-atan2(mouseX  - width/2, mouseY - height/2));
    
    if(mousePressed)
    {
      holding = true;
      shoot = true;
      prevMouseX = 0;
      stretchDist = dist(mouseX, mouseY,width/2,height/2);
    }
    else if(stretchDist > 0)
    {
      forward.x = sin(theta);
      forward.y = -cos(theta);
      PVector bp = PVector.sub(pos, PVector.mult(forward, stretchDist));
      println(bp);
      if(shoot == true)
      {
        Bullet b = new Arrow(bp.x, bp.y, theta, 70, 4, stretchDist * 2);
        gameObjects.add(b);
        shoot = false;
      }
      stretchDist-=20f;
    }
  }
}