class GUI extends GameObject
{
  float startAngle = HALF_PI;
  float endAngle = HALF_PI;
  float speedLevelUp = 0;
  float cameraLevelUp = 0;
  
  GUI(){};
  
  void render()
  {
  }
  void render(PVector pos, int ammo, int level, float health, int xp, float levelCap, 
              int arrowAmmo, int money,float multiplier, float multiplierTime, float maxMultiplierTime)
  {
      stroke(0);
      pushMatrix();
      translate(0,0,+6);
      fill(255, 0, 0);
      rect(pos.x - width/2 + 20, pos.y - height/2 + 50,map(health,0,100,0,300),60); // health bar
      fill(0);
      textSize(60);
      text("Cashhh: " + money, pos.x - width/2 + 20, pos.y - height/2 + 200);
      fill(#FF0011);
      
      text("A M M O :  " + ammo ,pos.x + width/2 - 300, pos.y + height/2 - 80 );//ammo
      fill(#DAE300);
      textSize(60);
      text("lvl: " + level ,pos.x - 50, pos.y + height/2 - 70);
      rect(pos.x - width/2 + 50, pos.y + height/2 - 50,map(xp,0,levelCap,0,width-100),20); /// xp bar

      endAngle = map(multiplierTime,0,maxMultiplierTime,HALF_PI,6.47);
      arc(pos.x + width/2 - 80, pos.y , 120, 120, startAngle, endAngle);
      fill(255);
      ellipse(pos.x + width/2 - 80, pos.y , 73, 73);
      fill(0);
      textSize(33);
      text("X " + String.format("%.1f", multiplier),pos.x + width/2 - 105, pos.y + 8);      
      popMatrix();
      
      pushMatrix();
      translate(0,0,+5);
      textSize(50);
      fill(#584834);
      text("ARROWS :  " + arrowAmmo ,pos.x + width/2 - 300, pos.y + height/2 - 130 );
      popMatrix();
      
      update();
      
  }
  
  void update()
  {
    if(speedLevelUp > 0)
    {
      showSpeedLevelUp();
    }
    
    if(cameraLevelUp > 0)
    {
      showCameraLvlUp();
    }
    
    speedLevelUp--;
    cameraLevelUp--;
    
    clock.render();
    clock.update();
  }
  
  void showSpeedLevelUp()
  {
    println("funnc");
    pushMatrix();
    fill(255, 0 ,0);
    translate(player.pos.x - 200, player.pos.y - 100,+6);
    textSize(70);
    text("Speed Leveled Up!!", 0,0);
    println("ss");
    popMatrix();
  }
  
  void showCameraLvlUp()
  {
    println("funnc");
    pushMatrix();
    fill(255, 0 , 0);
    translate(player.pos.x - 200, player.pos.y - 100,+6);
    textSize(70);
    text("Vision Leveled Up!!", 0,0);
    println("ss");
    popMatrix();
  }
  
  void speedLvl()
  {
    speedLevelUp = 210;
  }
  
  void cameraLvl()
  {
    cameraLevelUp = 210;
  }
}