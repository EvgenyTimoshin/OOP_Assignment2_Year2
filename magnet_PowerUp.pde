class Magnet extends GameObject
{
  Magnet(float x, float y)
  {
    pos = new PVector(x, y);
    theta = 0;
  }
  
  void render()
  {
    noFill();
    stroke(255, 0 ,0);
    strokeWeight(20);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
      arc(0, 0, 65, 100, 0, 3.15);
      fill(255);
      stroke(255);
      strokeWeight(5);
      pushMatrix();
        translate(0,0,+1);
        rect(0+20,0,20,15);
        rect(0-40,0,20,15);
      popMatrix();
    popMatrix();
    
    
  }
  
  void update()
  {
    theta += 0.1f;
    
    if(dist(player.pos.x, player.pos.y, pos.x, pos.y) < 90)
    {
      gameObjects.remove(this);
      player.pickUpMagnet();
    }
  }
}