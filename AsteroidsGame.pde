Spaceship player;
Star[] stars = new Star[250];
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
  
  if (keyPressed) keyPressed(); // makes the turning more smooth for now, TODO: use booleans to do smoother controls (check github page for info)
}
public void keyPressed() {
  if (key == 'w' || key == 'W') {
    player.accelerate(0.1);
  }
  if (key == 'a' || key == 'A') {
    player.turn(-4);
  }
  if (key == 'd' || key == 'D') {
    player.turn(4);
  }
}
