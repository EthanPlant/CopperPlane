class Button {
  public int nX, nY, nDx, nDy;
  String sFile;
  PImage img;
  
  Button( String _sFile, int _nX, int _nY) { // Button Constructor
    nX = _nX;
    nY = _nY;
    sFile = _sFile;
    img = loadImage(sFile);
  }

  public void update() { // Draws the button
    image(img, nX, nY);
  }
  public boolean isClicked() { //Checks if the button is clicked
    if (mouseX >=nX && mouseX <= nX+img.width && mouseY >=nY && mouseY<= nY+img.height) {
      return true;
    } else {
      return false;
    }
  }
}