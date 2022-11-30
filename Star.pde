class Star //note that this class does NOT extend Floater
{
  private int myX, myY, mySize;
  public Star() {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    mySize = (int)(Math.random() * 3 + 1);
  }
  public void show() {
    fill(255, 255, 0);
    stroke(255, 255, 0);
    ellipse(myX, myY, mySize, mySize);
  }
}
