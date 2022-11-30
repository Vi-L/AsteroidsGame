Spaceship player = new Spaceship();
Star[] stars = new Star[250];
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();

boolean wPressed, aPressed, dPressed, shiftPressed = false;
int numAsteroids = 15;

public void setup() 
{
  size(750, 750);
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < numAsteroids; i++) {
    asteroidList.add(new Asteroid());
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
    asteroidList = new ArrayList<Asteroid>();
  }
  
  for (int i = 0; i < asteroidList.size(); i++) {
    Asteroid asteroidi = asteroidList.get(i);
    asteroidi.move();
    asteroidi.show();
    
    if ( dist((float)player.getCenterX(), (float)player.getCenterY(),
              (float)asteroidi.getCenterX(), (float)asteroidi.getCenterY()) < 8 * asteroidi.getSize() ) {
      asteroidList.remove(i);
      numAsteroids--;
      i--; // avoid ArrayList trap?
    }
  }
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
    for (int i = 0; i < numAsteroids; i++) {
      asteroidList.add(new Asteroid());
    }
  }
}
