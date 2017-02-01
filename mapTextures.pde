void mapTextures()
{
  rect(-width*3,  -height*3, width*7, height*6);
  
  for(int j = -height*3; j < height*3; j+= 500)
  {
    for(int i = -width*3; i < width*4; i +=500)
    {
    image(background,i,j);
  }
  }
  
}