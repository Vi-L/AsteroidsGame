Spaceship player = new Spaceship();
Star[] stars = new Star[250];
ArrayList<Asteroid> asteroidList = new ArrayList<Asteroid>();
ArrayList<Bullet> bulletList = new ArrayList<Bullet>();

boolean wPressed, aPressed, dPressed, shiftPressed, spacePressed = false;
final static int spacebarDebounce = 15;
int spacebarTimer = 0;
int numAsteroids = 15;

int playerLives = 3;
int playerHyperspaces = 3;
int playerScore = 0;

public void setup() 
{
  /* fill stars and asteroids list*/
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
  for (int i = 1; i < playerLives+1; i++) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    textSize(14);
    text("Lives:", 10, 20);
    bezier(30+i*30, 30, 10+i*30, 5, 20+i*30, 35, 30+i*30, 50); // draw a heart
    bezier(30+i*30, 30, 50+i*30, 5, 40+i*30, 35, 30+i*30, 50);
  }
  
  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
  
  player.move();
  player.show();
  
  if (playerLives <= 0) {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    textSize(28);
    text("Game Over", width/2 - 50, height/2);
    textSize(24);
    text("Refresh to play again!", width/2 - 100, height/2 + 30);
    return;
  }
  
  /* handle player input*/
  if (wPressed) player.accelerate(0.05);
  if (aPressed) player.turn(-5);
  if (dPressed) player.turn(5);
  if (spacePressed && spacebarTimer >= spacebarDebounce) { 
    bulletList.add(new Bullet(player));
    spacebarTimer = 0;
  } else {
    spacebarTimer++;
  }
  if (shiftPressed) {
    player.hyperspace();
    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
    asteroidList = new ArrayList<Asteroid>();
  }
  
  /* handle asteroid collision with player*/
  for (int i = 0; i < asteroidList.size(); i++) {
    Asteroid asteroidi = asteroidList.get(i);
    asteroidi.move();
    asteroidi.show();
    
    if ( dist((float)player.getCenterX(), (float)player.getCenterY(),
              (float)asteroidi.getCenterX(), (float)asteroidi.getCenterY()) < asteroidi.getCollisionThreshold() ) { // dist function requires floats
      asteroidList.remove(i);
      numAsteroids--;
      playerLives--;
      i--; // avoid ArrayList skipping trap
    }
  }
  
  /* handle bullet collision with asteroids*/
  for (int i = 0; i < bulletList.size(); i++) {
    Bullet bulleti = bulletList.get(i);
    bulleti.move();
    bulleti.show();
    
    if (bulleti.isOutOfBounds()) {
      bulletList.remove(i);
      i--;  // ArrayList trap
    }
    
    for (int j = 0; j < asteroidList.size(); j++) {
      Asteroid asteroidj = asteroidList.get(j);
      if (dist( (float)bulleti.getCenterX(), (float)bulleti.getCenterY(),
                 (float)asteroidj.getCenterX(), (float)asteroidj.getCenterY()) < asteroidj.getCollisionThreshold()) {
        playerScore += (int)(asteroidj.getSize() * 100);
        asteroidList.remove(j);
        numAsteroids--;
        j--; // ArrayList trap
        
        bulletList.remove(i);
        i--; // ArrayList trap
      }
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
  if (key == ' ') {
    spacePressed = true;
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
    for (int i = 0; i < numAsteroids; i++) { // make new asteroids after hyperspace "animation" is done
      asteroidList.add(new Asteroid());
    }
  }
  if (key == ' ') {
    spacePressed = false;
  }
}
