color leafColour, trunkColour;
float treeScale = 0.4;
float layer = 0;

void setup()
{
  size(800, 500);
  noStroke();
  frameRate(1);
}

void draw()
{
  layer=0;
  background(157, 238, 247);   // Sky
  fill(156, 245, 170);         // Ground.
  rect(0, height/2, width, height/2);

  for (float yPos=height/2; yPos<height; yPos+=layer*20)
  {
    layer += 1;
    for (float xPos=layer*8; xPos<width; xPos+=10+(layer*15))
    {
      drawTree(xPos, yPos, layer/5, layer);
    }
  }
}

// Draws a single tree at the given position.
void drawTree(float treeX, float treeY, float scale, float layer)
{
  fill(95,57,26-layer*2);
  rect(treeX, treeY, 20*scale, 70*scale);
  fill(82-layer*4,120+layer*5,117-layer*4, 255-layer);
  ellipse(treeX+10*scale, treeY-30*scale, 70*scale, 90*scale);
}
