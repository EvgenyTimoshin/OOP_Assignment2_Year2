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
      noStroke();
      pushMatrix();
      translate(pos.x,pos.y,+5);
      rotate(theta);
      fill(255,50);
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
      curveVertex(350, 500);
      curveVertex(200, 550);
      curveVertex(0,570);
      curveVertex(-200, 550);
      curveVertex(-350, 500);
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