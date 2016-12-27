class Clock extends GameObject
{
  PVector pos;
  int hrOne;
  int hrTwo;
  int minuteOne;
  int minuteTwo;
  
  Clock()
  {
    this.hrOne = 1;
    this.hrTwo = 2;
    this.minuteOne = 0;
    this.minuteTwo = 0;
  }
  
  void render()
  {

    noStroke();
    GameObject go = gameObjects.get(0);
    Player p = (Player) go;
    fill(0,160);
    noFill();
    pushMatrix();
    translate(0,0,+3);
    rect(p.pos.x - width/2, p.pos.y - height/2, width, height);
    textFont(font, 80);
    fill(255);
    text(hrOne +""+ hrTwo + "  :  " + minuteOne + minuteTwo , p.pos.x + width/2 - 250, p.pos.y - height/2 + 100);
    popMatrix();
  }
  
  void update()
  {
    if(frameCount % 25 == 0)
    {
      minuteTwo++;
    }
    
    if(minuteTwo > 9)
    {
      minuteTwo = 0;
      minuteOne++;
    }
    
    if(minuteOne > 5)
    {
      hrTwo++;
      minuteOne = 0;
      minuteTwo = 0;
    }
    
    if(hrTwo > 9  || (hrOne == 2 && hrTwo > 4))
    {
      hrOne++;
      hrTwo = 0;
    }
    
    if(hrOne >= 3)
    {
      hrOne = 0;
      hrTwo = 0;
    }
  }
}