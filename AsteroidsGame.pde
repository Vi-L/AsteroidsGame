Spaceship player;
Star[] stars = new Star[250];
Asteroid test = new Asteroid();

boolean wPressed, aPressed, dPressed, shiftPressed = false;

public void setup() 
{
  size(750, 750);
  player = new Spaceship();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  player.move();
  player.show();
  
  if (wPressed) player.accelerate(0.05);
  if (aPressed) player.turn(-5);
  if (dPressed) player.turn(5);
  if (shiftPressed) {
    player.hyperspace();
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
  }
  test.move();
  test.show();
}
public void keyPressed() {
  if (key == 'w' || key == 'W') {
    wPressed = true;
  }
  if (key == 'a' || key == 'A') {
    aPressed = true;
  }
  if (key == 'd' || key == 'D') {
    dPressed = true;
  }
  if (keyCode == SHIFT) {
    shiftPressed = true;
  }
}

public void keyReleased() {
  if (key == 'w' || key == 'W') {
    wPressed = false;
  }
  if (key == 'a' || key == 'A') {
    aPressed = false;
  }
  if (key == 'd' || key == 'D') {
    dPressed = false;
  }
  if (keyCode == SHIFT) {
    shiftPressed = false;
  }
}
