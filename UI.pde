class GUI extends GameObject
{
  float startAngle = HALF_PI;
  float endAngle = HALF_PI;
  
  GUI(){};
  
  void render()
  {
  }
  void render(PVector pos, int ammo, int level, int health, int xp, float levelCap, int arrowAmmo, int money,float multiplier, float multiplierTime, float maxMultiplierTime)
  {
    pushMatrix();
      translate(0,0,+5);
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
  }
  
  void update()
  {
    
  }
}