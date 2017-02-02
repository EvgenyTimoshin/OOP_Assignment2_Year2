abstract class GameObject
{
  PVector pos;
  PVector forward;
  float size;
  float theta;
  
  GameObject()
  {
    //default constructor for Super class
  }
  
  abstract void render();
  
  abstract void update();
}