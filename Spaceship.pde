class Spaceship extends Floater  
{   
    public Spaceship() {
      corners = 12;
      xCorners = new int[]{11, 7, 3, -6, -4, -6, -6, -4, -6, 3, 7, 11};
      yCorners = new int[]{1, 1, 2, 10, 2, 3, -3, -2, -10, -2, -1, -1}; 
      myColor = color(255, 255, 255);
      myCenterX = 250;
      myCenterY = 250;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
    
    public void hyperspace() {
      myCenterX = (int)(Math.random() * width);
      myCenterY = (int)(Math.random() * height);
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = Math.random() * 360;
    }
}
