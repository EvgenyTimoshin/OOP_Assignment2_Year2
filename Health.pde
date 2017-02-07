class Health extends GameObject
{
  Health(float x, float y)
  {
    pos = new PVector(x, y);
    theta = 0;
  }
  
  void render()
  {
    pushMatrix();
      noStroke();
      translate(pos.x, pos.y,+4);
      rotate(theta);
      fill(255,0,0);
      ellipse(0, 0, 70, 70);
      fill(255);
      rect(-25,-7,50,15);
      rotate(radians(90));
      rect(-25,-7,50,15);
      //rect(0,0,20,70);
    popMatrix();
  }
  
  void update()
  {
    theta += 0.01f;
    if(player.magnet || dist(player.pos.x,player.pos.y,pos.x,pos.y) < 180)
    {
      pos.lerp(player.pos, 0.09);
    }
  }
}