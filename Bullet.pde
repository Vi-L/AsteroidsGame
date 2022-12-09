class Bullet extends Floater {
  public Bullet(Spaceship ship) {
    myCenterX = ship.getCenterX();
    myCenterY = ship.getCenterY();
    myXspeed = ship.getXspeed();
    myYspeed = ship.getYspeed();
    myPointDirection = ship.getPointDirection();
    
    accelerate(6);
  }
  
  public void show() {
    fill(255);
    stroke(255);
    ellipse((float)myCenterX, (float)myCenterY, 3, 3);
  }

  public boolean isOutOfBounds() {
    return myCenterX <= 0 || myCenterX >= width || myCenterY <= 0 || myCenterY >= height;
  }
  
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
}
