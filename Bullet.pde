class Bullet {
  int nLength, nWidth;
  final int nDx, nDy;
  public float fX, fY;
  public boolean bShow;
  color cColour;

  Bullet(float _fX, float _fY, color _c, int _nLength, int _nWidth, int _nDx, int _nDy) { // Bullet Constructor
    fX = _fX;
    fY = _fY;
    nDx = _nDx;
    nDy = _nDy;
    cColour = _c;
    nLength = _nLength;
    nWidth = _nWidth;
  }

  public void update() { // Updates bullet location
    fX += nDx;
    fY += nDy;
  }

  public void display() { // Displays bullet
    fill(cColour);
    ellipse(fX, fY, nLength, nWidth);
  }
}