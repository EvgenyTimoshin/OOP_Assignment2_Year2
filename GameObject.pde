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
  
  void render(){};
  
  void update(){};
}