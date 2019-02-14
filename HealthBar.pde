class HealthBar {
  int nLength, nX, nY;
  float fDrawWidth, fHealth, fMaxHealth;
  color cColour;

  public HealthBar(int _nX, int _nY, int _nLength, float _fHealth) { // Healthbar constructor
    nX = _nX;
    nY = _nY;
    nLength = _nLength;
    fMaxHealth = _fHealth;
  }

  public void update(int _nX, int _nY, float _fHealth) { // Updates healthbar
    nX = _nX;
    nY = _nY;
    fHealth = _fHealth;
    fDrawWidth = (fHealth / fMaxHealth) * nLength;
  }

  public void display() { // Draws healthabr
    if (fHealth > 0) { 
      rectMode(CORNER);
      if (fHealth <= fMaxHealth / 4) {
        cColour = color(255, 0, 0, 200);
      } else if (fHealth <= fMaxHealth / 2) {
        cColour = color(255, 255, 0, 200);
      } else {
        cColour = color(0, 255, 0, 200);
      }

      fill(cColour);
      rect(nX, nY, fDrawWidth, 20);

      stroke(0);
      strokeWeight(5);
      noFill();
      rect(nX, nY, nLength, 20);
      
      textSize(16);
      fill(0);
      text(int(fHealth) + "/" + int(fMaxHealth), nX + 7, nY + 17);
    }
  }
}