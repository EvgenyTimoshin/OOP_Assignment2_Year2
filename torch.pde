class Torch extends GameObject
{
  Boolean state;
  
  Torch()
  {
    pos = new PVector(player.pos.x, player.pos.y);
    theta = 0;
    state = false;
  }
  
  void render()
  {
    if(state)
    {
      pushMatrix();
      translate(pos.x,pos.y,+4);
      rotate(theta);
      fill(255,220);
      //noFill();
      noStroke();
      pushMatrix();
      if(player.gunEquipped == false)
      {
        rotate(3.14);
      }
      beginShape();
      vertex(0,0);
      curveVertex(500, 320);
      curveVertex(200, 400);
      curveVertex(100, 450);
      curveVertex(0,480);
      curveVertex(-100, 450);
      curveVertex(-200, 400);
      curveVertex(-500, 320);
      vertex(0,0);
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    }
  }
  
  void update()
  {
    pos.x = player.pos.x;
    pos.y = player.pos.y;
    theta = player.theta;
  }
}