class Bow extends GameObject
{
  Boolean holding;
  float stretchDist;
  float prevMouseX;
  Boolean shoot;
  int arrowAmmo;
  
  Bow()
  {
    pos = new PVector(width/2, height/2);
    size = 100;
    theta = 0;
    forward = new PVector(0, -1);
    shoot = false;
    arrowAmmo = 15;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y,+4);
    rotate(theta);
    stroke(#584834);
    strokeWeight(10);
    noFill();
    pushMatrix();
    rotate(3.14);
    arc(0, 0, 120, 70, 0, 3.15);
    strokeWeight(2);
    popMatrix();
    
    
    if(mousePressed)
    {
      strokeWeight(2);
      stroke(#A59A8C);
      line(60, 0, 0,stretchDist);
      line( - 60, 0, 0,stretchDist);
    }
    else if(stretchDist > 0)
    {
      stroke(#A59A8C);
      strokeWeight(2);
      line(60, 0, prevMouseX,stretchDist);
      line( - 60, 0, prevMouseX,stretchDist);
    }
    popMatrix();    
    
    pushMatrix();
    translate(0,0,+5);
    textSize(50);
    fill(#584834);
    text("ARROWS :  " + arrowAmmo ,pos.x + width/2 - 300, pos.y + height/2 - 130 );
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
      stretchDist = map(dist(mouseX, mouseY,width/2,height/2),0,500,0,200);
    }
    else if(stretchDist > 0)
    {
      forward.x = sin(theta);
      forward.y = -cos(theta);
      PVector bp = PVector.sub(pos, PVector.mult(forward, stretchDist));
      println(bp);
      if(shoot == true)
      {
        Bullet b = new Arrow(bp.x, bp.y, theta, 70, 4, stretchDist * 4);
        gameObjects.add(b);
        shoot = false;
        arrowAmmo--;
        bowFired.rewind();
        bowFired.play();
      }
      stretchDist-=20f;
    }
  }
}