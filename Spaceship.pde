class Spaceship extends Floater  
{   
    public Spaceship() {
      corners = 4;
      xCorners = new int[]{-8, 16, -8, -2}; // default for now
      yCorners = new int[]{-8, 0, 8, 0}; // make cooler later?
      myColor = color(255, 255, 255);
      myCenterX = 250;
      myCenterY = 250;
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0;
    }
}
