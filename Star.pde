class Star //note that this class does NOT extend Floater
{
  private int myX, myY, mySize;
  public Star() {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
    mySize = (int)(Math.random() * 3 + 1);
  }
  public void show() {
    ellipse(myX, myY, mySize, mySize);
  }
}
