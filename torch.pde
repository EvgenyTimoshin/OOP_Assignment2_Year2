class Torch extends GameObject
{
  Boolean state;
  
  Torch()
  {
    Player p = (Player) gameObjects.get(0);
    pos = new PVector(p.pos.x,p.pos.y);
    theta = 0;
    state = false;
  }
  
  void render()
  {
    if(state)
    {
      Player p = (Player)gameObjects.get(0);
      pushMatrix();
      translate(pos.x,pos.y,+4);
      rotate(theta);
      fill(255,220);
      //noFill();
      noStroke();
      pushMatrix();
      if(p.gunEquipped == false)
      {
        rotate(3.14);
      }
      beginShape();
      vertex(0,0);
      curveVertex(300, 320);
      curveVertex(200, 400);
      curveVertex(100, 450);
      curveVertex(0,480);
      curveVertex(-100, 450);
      curveVertex(-200, 400);
      curveVertex(-300, 320);
      vertex(0,0);
      endShape(CLOSE);
      popMatrix();
      popMatrix();
    }
  }
  
  void update()
  {
    Player p = (Player) gameObjects.get(0);
    pos.x = p.pos.x;
    pos.y = p.pos.y;
    theta = p.theta;
  }
}