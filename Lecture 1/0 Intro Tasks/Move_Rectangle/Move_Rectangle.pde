// Move Rectangle Task
// The rectangle height and width can now be adjusted :>
int rectangle_width = 120;
int rectangle_height = 80;

void setup()
{
  size(400, 300);
  fill(203, 118, 122);
}

void draw()
{
  background(255, 236, 149); // Moving background into draw causes it to be redrawn every frame making only one rectangle visible at a time!
  rect(mouseX - rectangle_width/2, mouseY - rectangle_height/2, rectangle_width, rectangle_height); // I adjusted the variables so that the cursor moves the center of the rectangle - feels more intuitive!
}
