class Asteroid extends Floater {
  private double mySpinSpeed;
  public Asteroid() {
    mySpinSpeed = Math.random() * 4 + 1;
    corners = 4;
    xCorners = new int[]{12, 8, -4, -10}; 
    yCorners = new int[]{12, -2, -8, 16}; 
    myColor = color(255, 255, 255);
    myCenterX = Math.random() * 750; // 750 is width and height
    myCenterY = Math.random() * 750;
    myXspeed = Math.random() * 4 + 1;
    myYspeed = Math.random() * 4 + 1;
    myPointDirection = Math.random() * 2 * Math.PI;
  }
  
  public void move() {
    super.move();
    turn(mySpinSpeed);
  }
  
  public double getCenterX() {
    return myCenterX;
  }
  public double getCenterY() {
    return myCenterY;
  }
}
