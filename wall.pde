class Wall extends GameObject
{
  float wallWidth;
  float wallHeight;
  
  Wall(float x, float y,float wallWidth, float wallHeight)
  {
    pos = new PVector(x,y);
    this.wallWidth = wallWidth;
    this.wallHeight = wallHeight;
  }
  
  void render()
  {
    stroke(0);
    fill(0);
    rect(pos.x,pos.y,wallWidth,wallHeight);
  }
  
  void update()
  {
    
  }
}

void createBuilding(float x, float y, float wallL, float wallW)
{
  Wall wall = new Wall(x, y, wallL, wallW);
  Wall wall2 = new Wall(x + wallL, y, wallW, wallL);
  Wall wall3 = new Wall(x , y , wallW, wallL);
  Wall wall4 = new Wall(x , y + wallL,  wallL/3, wallW);
  Wall wall5  = new Wall((x + wallL + wallW) - wallL/3, y + wallL, wallL/3, wallW);
  gameObjects.add(wall);
  gameObjects.add(wall2);
  gameObjects.add(wall3);
  gameObjects.add(wall4);
  gameObjects.add(wall5);
}

void drawBuildingFloor()
{
   for(int i = 0; i < 1080; i += 350)
   {
    fill(100);
    rect(i , 300, 300, 300);
   }
}