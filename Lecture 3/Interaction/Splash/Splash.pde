void setup()
{
  size(1000,1000);
  background(255);
  noStroke();
}

void draw()
{
  fill(120 + (mouseX*0.2),45,130 + (mouseY*0.2), 50);
  circle(mouseX, mouseY, 20);
}
