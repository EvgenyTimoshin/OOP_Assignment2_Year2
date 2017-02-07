class GameState
{
  GameState()
  {}
  
    void gameRunning()
    {
      //frameRate(80);
      background(255);
      stroke(255,0,0);
      mapTextures();
      noFill();
      pushMatrix();
      translate(0,0,+5);
      rect(-width*2,-height*2,width*4,height*4);
      popMatrix();
      fill(255);
      
      spawn.update();
      
      for (int i = gameObjects.size() - 1 ; i >= 0  ; i --)
      {
        GameObject go = gameObjects.get(i); 
        go.update();
        go.render();    
      }  
      globalInput();
      println(frameRate);
    }
  
  void mainMenu()
  {
    background(0);
    stroke(255, 0 , 0);
    rect(width/2-200, height/2 , 400, 250);
    fill(0, 255, 0 );
    textSize(40);
    text("SURVIVE",width/2 - 80,height/2 + 140);
    
    fill(255, 0, 0);
    textSize(70);
    text("HIGHSCORE", width/2 - 195, height/2 - 400);
    fill(#53D322);
    text(highscore[0], width/2 - 35, height/2 - 300);
    textSize(20);
    text("Date : " + highscore[1] + " / " + highscore[2] + " / " + highscore[3], width/2 - 80, height/2 - 250);
    text("Time : "  + highscore[4] + " : " + highscore[5], width/2 - 60, height/2 - 220);
    
    fill(#D3D322);
    textSize(30);
    text(" W, A, S, D to move \n R to swtich Weapon \n T to toggle torch \n Mouse to Aim + Shoot",30, 900);
    
    if(mouseX < width/2 + 200 && mouseX > width/2 - 200
       && mouseY > height/2 && mouseY < height/2  + 250)
    {
         fill(255, 0 , 0);
         
         if(mousePressed)
         {
           gameState = 2;
         }
    }
    else
    {
      fill(0);
    }
  }
  
  void gameOver()
  {
    pushMatrix();
    translate(player.pos.x - width/2,player.pos.y - height/2,+5);
    background(0);
    fill(255, 0, 0);
    textSize(70);
    text("SCORE", width/2 - 123, height/2 - 400);
    fill(#53D322);
    text(player.killCount, width/2 - 30, height/2 - 300);
    textSize(20);
    text("Date : " + day() + " / " + month() + " / " + year(), width/2 - 90, height/2 - 100);
    text("Time : "  + hour() + " : " + minute(), width/2 - 70, height/2 );
    
    if(mouseX < width/2 + 100 && mouseX > width/2 - 150 && mouseY > height/2 + 100 && mouseY < height/2 + 300)
    {
      if(mousePressed)
      {
        gameObjects.clear();
        setup();
        gameState = 2;
      }
       pushMatrix();
        translate(0,0,+10);
        textSize(27);
        text("Click outside to quit",width/2 - 130, height/2 + 200);
      popMatrix();
      
      fill(255, 0 ,0 );
    }
    else
    {
      
      fill(255);
      pushMatrix();
        translate(0,0,+10);
        textSize(50);
        text("Start Again",width/2 - 130, height/2 + 200);
      popMatrix();
      fill(0);
      if(mousePressed)
      {
        exit();
      }
    }
    stroke(255,0,0);
    rect(width/2 - 150, height/2 + 100, 300, 200);
    popMatrix();
  }
}