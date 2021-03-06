class Bow extends GameObject implements Weapon
{
  Boolean holding;
  float stretchDist;
  float prevMouseX;
  Boolean shoot;
  
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
    strokeWeight(5);
    pushMatrix();
    translate(pos.x, pos.y,+5);
    rotate(theta);
    stroke(#584834);
    noFill();
    pushMatrix();
    rotate(3.14);
    arc(0, 0, 120, 70, 0, 3.15);
    popMatrix();
    
    if(mousePressed)
    {
      strokeWeight(2);
      stroke(#A59A8C);
      pushMatrix();
      translate(0,0, +4);
      line(60, 0, 0,stretchDist);
      line( - 60, 0, 0,stretchDist);
      stroke(#483B29);
      line(0, stretchDist - 70, 0 , stretchDist);
      fill(#BCB9B4);
      triangle(0,stretchDist - 90, -6, stretchDist - 70, 6, stretchDist - 70);
      popMatrix();
    }
    else if(stretchDist > 0)
    {
      stroke(#A59A8C);
      strokeWeight(2);
      line(60, 0, prevMouseX,stretchDist);
      line( - 60, 0, prevMouseX,stretchDist);
    }
    popMatrix();
    strokeWeight(5);
  }
  
  void update()
  {
    pos.x = player.pos.x;
    pos.y = player.pos.y;
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
      if(shoot == true)
      {
         shoot(); 
      }
      stretchDist-=20f;
    }
    
  }
  
  void shoot()
  {
    forward.x = sin(theta);
    forward.y = -cos(theta);
    PVector bp = PVector.sub(pos, PVector.mult(forward, stretchDist));
    Bullet b = new Arrow(bp.x, bp.y, theta, 70, 4, stretchDist * 4);
    gameObjects.add(b);
    shoot = false;
    player.arrowAmmo--;
    audio.bowFired.rewind();
    audio.bowFired.play();
  }
  
  void reload()
  {
    
  }
}