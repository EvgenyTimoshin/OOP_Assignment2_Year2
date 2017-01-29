class GUI extends GameObject
{
  GUI(){};
  
  void render(PVector pos, int ammo, int level, int health, int xp, float levelCap, int arrowAmmo)
  {
    pushMatrix();
      translate(0,0,+5);
      fill(255, 0, 0);
      rect(pos.x - width/2 + 20, pos.y - height/2 + 50,map(health,0,100,0,300),60); // health bar
      textSize(60);
      fill(#FF0011);
      
      text("A M M O :  " + ammo ,pos.x + width/2 - 300, pos.y + height/2 - 80 );//ammo
      fill(#DAE300);
      textSize(60);
      text("lvl: " + level ,pos.x - 50, pos.y + height/2 - 70);
      rect(pos.x - width/2 + 50, pos.y + height/2 - 50,map(xp,0,levelCap,0,width-100),20); /// xp bar
      popMatrix();
      
      pushMatrix();
      translate(0,0,+5);
      textSize(50);
      fill(#584834);
      text("ARROWS :  " + arrowAmmo ,pos.x + width/2 - 300, pos.y + height/2 - 130 );
      popMatrix();
  }
}