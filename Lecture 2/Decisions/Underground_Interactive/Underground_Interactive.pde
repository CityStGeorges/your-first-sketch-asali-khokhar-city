int xPos;
int yPos;
int rectWidth = 130;
int rectHeight = 20;
int circleDiameter = 100;
float rectLeft;
float rectRight;
float rectTop;
float rectBottom;
color circleFill = color(255);
color rectFill = color(255);

void setup()
{
  size(200,300);
  background(#B9B9B9);
  rectMode(CENTER);
  xPos = int(random(rectWidth/2,width-rectWidth/2));
  yPos = int(random(circleDiameter/2,height-circleDiameter/2));
  rectLeft = xPos - rectWidth/2;
  rectRight = xPos + rectWidth/2;
  rectTop = yPos - rectHeight/2;
  rectBottom = yPos + rectHeight/2;
  println(rectLeft, rectRight, rectTop, rectBottom);
  println(xPos,yPos);
}

void draw()
{
  checkCursorPosition();
  fill(circleFill);
  circle(xPos,yPos,circleDiameter);
  fill(rectFill);
  rect(xPos,yPos,rectWidth,rectHeight);
}

boolean hoverOverRect (float left, float right, float top, float bottom)
{
  if (left < mouseX && mouseX < right)
    {
      if (top < mouseY && mouseY <bottom)
      {
        return true;
      }
    }
  return false;
}

boolean hoverOverCircle ()
{
  if (dist(mouseX,mouseY,xPos,yPos) < circleDiameter/2)
  {
    return true;
  }
  return false;
}

void checkCursorPosition ()
{
  // In rectangle?
  if (hoverOverRect(rectLeft, rectRight, rectTop, rectBottom))
  {
    // In circle?
    if (hoverOverCircle())
    {
      circleFill = color(255);
      rectFill = color(0,0,255); 
    }
    // Outside circle?
    if (!hoverOverCircle())
    {
      circleFill = color(255);
      rectFill = color(0,0,255); 
    }
  }
  // Out rectangle?
  if (!hoverOverRect(rectLeft, rectRight, rectTop, rectBottom))
  {
    // In circle?
    if (hoverOverCircle())
    {
      circleFill = color(255,0,0);
      rectFill = color(255);
    }
    // Outside circle?
    if (!hoverOverCircle())
    {
      circleFill = color(255);
      rectFill = color(255);
    }
  }
}
