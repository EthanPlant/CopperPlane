class Building {
  public int nX, nY;
  String sFile;
  PImage img;

  Building(String _sFile, int _nX, int _nY) { // Building constructor
    nX = _nX;
    nY = _nY;
    sFile = _sFile;
    img = loadImage(sFile);
  }

  public void display() { // Displays building
    imageMode(CORNER);
    image(img, nX, nY);
  }
}