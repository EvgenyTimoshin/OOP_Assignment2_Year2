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
    textSize(35);
    fill(255);
    GameObject go = gameObjects.get(0);
    Player p = (Player) go;
    text(hrOne +""+ hrTwo + "  :  " + minuteOne + minuteTwo , p.pos.x + width/2 - 200, p.pos.y - height/2 + 100);
  }
  
  void update()
  {
    if(frameCount % 2 == 0)
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