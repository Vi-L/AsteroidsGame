class Spaceship extends Floater  
{   
    public Spaceship() {
      corners = 12;
      xCorners = new int[]{11, 7, 3, -6, -4, -6, -6, -4, -6, 3, 7, 11}; 
      yCorners = new int[]{1, 1, 2, 10, 2, 3, -3, -2, -10, -2, -1, -1}; 
      myColor = color(128);
      myCenterX = 750/2; // 750 is width and height
      myCenterY = 750/2;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    
    public void move() {
      super.move();
      if (myXspeed > 20) myXspeed = 20; //limit max speed
      if (myXspeed < -20) myXSpeed = -20;
      if (myYspeed > 20) myYspeed = 20;
      if (myYspeed < -20) myYspeed = -20;
    }
    
    public void hyperspace() {
      myCenterX = (int)(Math.random() * 750);
      myCenterY = (int)(Math.random() * 750);
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random() * 360;
    }
    
    public double getCenterX() {
      return myCenterX;
    }
    public double getCenterY() {
      return myCenterY;
    }
}
