class Clock extends GameObject
{
  PVector pos;
  int hrOne;
  int hrTwo;
  int minuteOne;
  int minuteTwo;
  float dayLight;
  float audioVol;
  Boolean playNightSong = false;
  int dayCount = 1;
  
  Clock()
  {
    this.hrOne = 1;
    this.hrTwo = 9;
    this.minuteOne = 0;
    this.minuteTwo = 0;
    this.dayLight = 0;
    audioVol = -80;
  }
  
  void render()
  {
    
    noStroke();
    GameObject go = gameObjects.get(0);
    Player p = (Player) go;
    fill(0,dayLight);
    pushMatrix();
    translate(0,0,+4);
    rect(p.pos.x - width/2, p.pos.y - height/2, width, height);
    popMatrix();
    
    pushMatrix();
    translate(0,0,+5);
    textFont(font, 80);
    if(hrOne == 2 || hrOne == 0 && hrTwo < 6)
    {
      fill(255,0,0);
    }
    else
    {
      fill(255);
    }
    text(hrOne +""+ hrTwo + "  :  " + minuteOne + minuteTwo , p.pos.x + width/2 - 250, p.pos.y - height/2 + 100);
    fill(#2002AA);
    text("Day :  " + dayCount, p.pos.x - 100 , p.pos.y - height/2 + 100);
    popMatrix();
  }
  
  void update()
  {
    if(frameCount % 5 == 0)
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
      dayCount++;
      hrOne = 0;
      hrTwo = 0;
    }
    
    if(hrOne == 1)
    {
      dayLight = 0;
    }
    else if(hrOne == 2 && dayLight < 240)
    {
      if(playNightSong == false && dayLight < 5)
      {
        playNightSong = true;
      }
        dayLight += 0.1;
        
        if(audioVol < -15)
        {
          audioVol += 0.05;
        }
    }
    else if(hrOne == 0 && hrTwo > 5 && dayLight > 0)
    {
      dayLight -=0.5;
      if(audioVol > -80)
      {
        audioVol -= 0.5;
      }
      forestAmbience.setGain(-5);
    }
    
    if(playNightSong)
    {
      nightSong.rewind();
      nightSong.play();
      playNightSong = false;
    }
    
    if(hrTwo == 7)
    {
      nightSong.setGain(-80);
      nightSong.rewind();
      nightSong.pause();
    }
    nightSong.setGain(audioVol);
  }
}