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
  Boolean darkness = false;
  
  Clock()
  {
    this.hrOne = 2;
    this.hrTwo = 3;
    this.minuteOne = 0;
    this.minuteTwo = 0;
    this.dayLight = 0;
    audioVol = -80;
  }
  
  void render()
  {
    noStroke();
    fill(0,dayLight);
    pushMatrix();
    translate(0,0,+4);
    if(darkness)
    {
      rect(player.pos.x - width, player.pos.y - height, width*2, height*2);
    }
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
    text("Day :  " + dayCount, player.pos.x - 100 , player.pos.y - height/2 + 100);
    text(hrOne +""+ hrTwo + "  :  " + minuteOne + minuteTwo , player.pos.x + width/2 - 250, player.pos.y - height/2 + 100);
    fill(#2002AA);   
    popMatrix();
  }
  
  void update()
  {
    if(frameCount % 7 == 0)
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
    
    if(hrTwo > 9  || (hrOne == 2 && hrTwo >= 4))
    {
      hrOne++;
      hrTwo = 0;
    }
    
    if(hrOne >= 3)
    {
      dayCount++;
      hrOne = 0;
      hrTwo = 0;
      spawn.traderArrival();
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
        darkness = true;
      }
        dayLight += .5;
        
        if(audioVol < -15)
        {
          audioVol += 0.05;
        }
    }
    else if(hrOne == 0 && hrTwo > 5 && dayLight > 0)
    {
      dayLight -=0.5;
      darkness = false;
      if(audioVol > -80)
      {
        audioVol -= 0.5;
      }
      audio.forestAmbience.setGain(-5);
    }
    
    if(playNightSong)
    {
      audio.nightSong.rewind();
      audio.nightSong.play();
      playNightSong = false;
    }
    
    if(hrTwo == 7)
    {
      audio.nightSong.setGain(-80);
      audio.nightSong.rewind();
      audio.nightSong.pause();
    }
  }
}