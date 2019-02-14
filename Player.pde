class Player {
  public int nX, nY, nDx, nDy, nDeg, nRange, nSpeed, nClass, nDamage;
  public float fHealth, fMaxHealth;
  public ArrayList<Bullet> alBullets = new ArrayList<Bullet>();
  Player t;
  HealthBar hbTurret;
  String sFile;
  PImage img;

  Player(String _sFile, int _nX, int _nY, float _fMaxHealth, int _nRange, int _nSpeed, int _nClass, int _nDamage) { // Player constructor
    nX = _nX;
    nY = _nY;
    fMaxHealth = _fMaxHealth;
    fHealth = fMaxHealth;
    nRange = _nRange;
    nSpeed = _nSpeed;
    nClass = _nClass;
    nDamage = _nDamage;
    sFile = _sFile;
    img = loadImage(sFile);
  }

  public void update(int _nDx, int _nDy) { // Player movement
    nDx = _nDx;
    nDy = _nDy;
    nX += nDx;
    nY += nDy;
  }

  public void display() { // Draws the player
    imageMode(CENTER);
    pushMatrix();
    translate(nX, nY);
    rotate(radians(nDeg));
    image(img, 0, 0);
    popMatrix();
  }
}