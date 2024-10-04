// -- Global variables are declared first

// ball position
float xPos;
float yPos;

// peg positions
float peg1X, peg1Y;
float peg2X, peg2Y;
float peg3X, peg3Y;

// ball velocity
float vx;
float vy;

// ball size
float radius;

// peg size
float pegRadius;

// is ball in play?
boolean inPlayMode;     // <-- boolean variable, can only hold values of TRUE and FALSE.

void setup()            // <-- Whatever commands we put in here will be executed once.
{
  size(500, 400);
  textSize(48);

  radius = 15;

  pegRadius = 10;

  peg1X = 250;
  peg1Y = 200;

  peg2X = 70;
  peg2Y = height - 24;

  peg3X = width - 24;
  peg3Y = 70;

  xPos = width - radius;
  yPos = height - radius;

  inPlayMode = false;   // <-- Initialise 'inPlayMode' to FALSE
}

// -- A new method
void mousePressed()
{
  if (inPlayMode)       // <-- Check whether this is TRUE, else change vx and vy, and set inPlayMode to TRUE
  {
    // -- do nothing, ball is already in play
  } else
  {
    vx = (mouseX - xPos) / 50;
    vy = (mouseY - yPos) / 50;
    inPlayMode = true;
  }
}

void draw()
{
  background(255);

  fill(255, 0, 0);
  stroke(0);

  // -- Draw the pegs
  drawPeg(peg1X, peg1Y);
  drawPeg(peg2X, peg2Y);
  drawPeg(peg3X, peg3Y);

  // -- Lots of decisions that define the game!
  if (inPlayMode)
  {
    moveBall();

    // -- Draw ball
    drawBall();
    
    bounceOffWalls();

    // -- Check collisions with pegs
    checkForPegCollision(peg1X, peg1Y);
    checkForPegCollision(peg2X, peg2Y);
    checkForPegCollision(peg3X, peg3Y);
  } else
  {
    // -- Draw ball
    drawBall();

    // -- Draw aiming line
    drawAimingLine();
  }
}

void drawAimingLine()
{
  stroke(0);
  line(xPos, yPos, mouseX, mouseY);
}

float checkForRebound(float pos, float vp, float max)
{
  if (pos - radius < 0 || pos + radius > max)
  {
    return -vp;
  }
  return vp;
}

void drawBall()
{
  noStroke();
  fill(0, 0, 255);
  circle(xPos, yPos, 2 * radius);
}

void checkForPegCollision(float pegX, float pegY)
{
  if (dist(xPos, yPos, pegX, pegY) < radius + pegRadius)
  {
    fill(0);
    textAlign(CENTER, CENTER);
    text("GAME OVER!", width/2, height/2);
    frameRate(0);
  }
}

float estimateVal(float a, float b)
{
  return (a - b)/50;
}

void drawPeg(float pegX, float pegY)
{
  circle(pegX, pegY, 2 * pegRadius);
}

void moveBall()
{
  xPos = xPos + vx;
  yPos = yPos + vy;
}

void bounceOffWalls()
{
    // -- Check rebounds against left and right walls
    vx = checkForRebound(xPos, vx, width);

    // -- Check rebounds against top and bottom walls
    vy = checkForRebound(yPos, vy, height);
}
