class Asteroid extends Floater {
  private double mySpinSpeed, mySize;
  public Asteroid() {
    mySize = Math.random() * 2 + 1.5;
    mySpinSpeed = Math.random() * 5 + 1;
    if (Math.random() >= 0.5) mySpinSpeed = -mySpinSpeed; // randomly positive or negative, this way -1 <= mySpinSpeed or mySpinSpeed >= 1
    corners = 4;
    xCorners = new int[]{(int)(6*mySize), (int)(4*mySize), (int)(-2*mySize), (int)(-5*mySize)}; // scale asteroid based on mySize
    yCorners = new int[]{(int)(6*mySize), (int)(-1*mySize), (int)(-4*mySize), (int)(8*mySize)};
    myColor = color(255);
    myCenterX = Math.random() * 750; // 750 is width and height
    myCenterY = Math.random() * 750;
    myXspeed = Math.random() * 4 + 1;
    myYspeed = Math.random() * 4 + 1;
    if (Math.random() >= 0.5) myXspeed = -myXspeed; // same as above, this prevents speed from being too low
    if (Math.random() >= 0.5) myYspeed = -myYspeed; // but still has random positive/negative speeds
    myPointDirection = Math.random() * 360; 
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
  public double getSize() {
    return mySize;
  }
}
