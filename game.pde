int nDx, nDy, nXStart, nYStart, nXStart2, nYStart2; // Various ints
boolean bShoot; // Shoot boolean
Building red, blue; // Buildings
HealthBar hbPlayer1, hbPlayer2; // Healthbars
ArrayList<Building> alRed = new ArrayList<Building>(); // ArrayLists for buildings
ArrayList<Building> alBlue = new ArrayList<Building>();

public void game() {
  if (bGameSetup) { //Runs the setup code once
    apStart.pause();
    if (nMap == 0) {
      alBlue.add(new Building("Build blue 1.png", 147, 221)); //Draws the buildings
      alBlue.add(new Building("Build blue 2.png", 426, 99));
      alBlue.add(new Building("Build blue 1.png", 665, 27));
      alBlue.add(new Building("Build blue 1.png", 623, 241));
      alBlue.add(new Building("Build blue 3.png", 864, 173));

      alRed.add(new Building("Build red 1.png", 105, 489));
      alRed.add(new Building("Build red 1.png", 332, 633));
      alRed.add(new Building("Build red 2.png", 475, 454));
      alRed.add(new Building("Build red 3.png", 744, 508));
      alRed.add(new Building("Build red 1.png", 972, 501));
    }
    
    if (nMap == 1) {
      imgBackground = loadImage("arena.png");
      alRed.add(new Building("Build red 1.png", 915, 350));
      alBlue.add(new Building("Build blue 3.png", 254, 344));
    }
  
    apBGM = minim.loadFile("Bat.mp3");

    if (nChar == 0) { // Renders the correct player image based on class selection
      plaPlayer1 = new Player("supportsprite.png", 100, 100, 170, 200, 3, nChar, 7);
    } else if (nChar == 1) {
      plaPlayer1 = new Player("mercsprite.png", 100, 100, 100, 200, 3, nChar, 10);
    } else if (nChar == 2) {
      plaPlayer1 = new Player("assassinsprite.png", 100, 100, 30, 20, 10, nChar, 50);
    } else if (nChar == 3) {
      plaPlayer1 = new Player("marksprite.png", 100, 100, 100, 750, 3, nChar, 10);
    } else if (nChar == 4) {
      plaPlayer1 = new Player("sniprsprite.png", 100, 100, 100, 1220, 3, nChar, 80);
    } else if (nChar == 5) {
      plaPlayer1 = new Player("construcsprite.png", 100, 100, 75, 50, 3, nChar, 0);
    } else if (nChar == 6) {
      plaPlayer1 = new Player("tanksprite.png", 100, 100, 500, 70, 3, nChar, 3);
    }

    if (nChar2 == 0) { // Renders the correct player image based on class selection
      plaPlayer2 = new Player("supportsprite.png", 1000, 700, 170, 200, 3, nChar2, 7);
    } else if (nChar2 == 1) {
      plaPlayer2 = new Player("mercsprite.png", 1000, 700, 100, 200, 3, nChar2, 10);
    } else if (nChar2 == 2) {
      plaPlayer2 = new Player("assassinsprite.png", 1000, 700, 30, 20, 10, nChar2, 50);
    } else if (nChar2 == 3) {
      plaPlayer2 = new Player("marksprite.png", 1000, 700, 100, 750, 3, nChar2, 10);
    } else if (nChar2 == 4) {
      plaPlayer2 = new Player("sniprsprite.png", 1000, 700, 100, 1220, 3, nChar2, 80);
    } else if (nChar2 == 5) {
      plaPlayer2 = new Player("construcsprite.png", 1000, 700, 75, 50, 3, nChar2, 0);
    } else if (nChar2 == 6) {
      plaPlayer2 = new Player("tanksprite.png", 1000, 700, 500, 70, 3, nChar2, 3);
    }

    hbPlayer1 = new HealthBar(plaPlayer1.nX, plaPlayer1.nY - 50, 100, plaPlayer1.fMaxHealth); // Draws healthbars for each player
    hbPlayer2 = new HealthBar(plaPlayer2.nX, plaPlayer2.nY - 50, 100, plaPlayer2.fMaxHealth);

    if (nChar == 5) {
      plaPlayer1.t = new Player("Turret.bmp", -1000, -1000, 100, 350, 0, 0, 10); // Makes turrets
      plaPlayer1.hbTurret = new HealthBar(-1000, -1000, 100, 100);
    }
    if (nChar2 == 5) {
      plaPlayer2.t =  new Player("Turret.bmp", -100, -100, 100, 350, 0, 0, 10);
      plaPlayer2.hbTurret = new HealthBar(-100, -100, 100, 100);
    }

    apBGM.loop();

    bGameSetup = false; // Ensures setup doesn't run more than once
  }
  if (nMap == 0) {
    background(#228B22); // Draws the background
  }

  if (nMap == 1) {
    background(imgBackground);
  }
  
  if(nMap == 2){
    background(#A9A9A9);
  }

  for (int i = 0; i < alBlue.size(); i++) { // Draws buildings
    Building buildBlue = alBlue.get(i);
    buildBlue.display();
  }
  for (int i = 0; i < alRed.size(); i++) {
    Building buildRed = alRed.get(i);
    buildRed.display();
  }

  for (int i = 0; i < alRed.size(); i++) { // Bullet-building collsion detection
    for (int j = 0; j < plaPlayer1.alBullets.size(); j++) {
      Bullet b = plaPlayer1.alBullets.get(j);
      Building buildRed = alRed.get(i);
      if (isBulletHit(b, buildRed)) {
        b.bShow = false;
      }
    }
  }

  for (int i = 0; i < alBlue.size(); i++) {
    for (int j = 0; j < plaPlayer1.alBullets.size(); j++) {
      Bullet b = plaPlayer1.alBullets.get(j);
      Building buildBlue = alBlue.get(i);
      if (isBulletHit(b, buildBlue)) {
        b.bShow = false;
      }
    }
  }

  for (int i = 0; i < alRed.size(); i++) { // Bullet-building collsion detection
    for (int j = 0; j < plaPlayer2.alBullets.size(); j++) {
      Bullet b = plaPlayer2.alBullets.get(j);
      Building buildRed = alRed.get(i);
      if (isBulletHit(b, buildRed)) {
        b.bShow = false;
      }
    }
  }

  for (int i = 0; i < alBlue.size(); i++) {
    for (int j = 0; j < plaPlayer2.alBullets.size(); j++) {
      Bullet b = plaPlayer2.alBullets.get(j);
      Building buildBlue = alBlue.get(i);
      if (isBulletHit(b, buildBlue)) {
        b.bShow = false;
      }
    }
  }

  if (keyPressed) {
    nXStart = plaPlayer1.nX;
    nYStart = plaPlayer1.nY;
    nXStart2 = plaPlayer2.nX;
    nYStart2 = plaPlayer2.nY;
    if (key == 'w' || key == 'W') { // Checks which keys are pressed
      arbKeys[0] = true;
    }
    if (key == 'a' | key == 'A') {
      arbKeys[1] = true;
    }
    if (key == 's' || key == 'S') {
      arbKeys[2] = true;
    }
    if (key == 'd' || key == 'D') {
      arbKeys[3] = true;
    }
    if (keyCode == UP) {
      arbKeys[4] = true;
    }
    if (keyCode == LEFT) {
      arbKeys[5] = true;
    }
    if (keyCode == DOWN) {
      arbKeys[6] = true;
    }
    if (keyCode == RIGHT) {
      arbKeys[7] = true;
    }
    if (key == 'e' || key == 'E') {
      arbKeys[8] = true;
    }
    if (key == '0') {
      arbKeys[9] = true;
    }
    if (arbKeys[0]) { // Moves player up
      if (plaPlayer1.nY > 0 + plaPlayer1.img.height / 2) { // Checks they haven't left the window
        plaPlayer1.nDeg = 270;
        plaPlayer1.update(0, -plaPlayer1.nSpeed);
      } else {
        plaPlayer1.nDeg = 270;
      }
    } else if (arbKeys[1]) { // Moves the player left
      if (plaPlayer1.nX > 0 + plaPlayer1.img.width / 2) { // Checks they haven't left the window\
        plaPlayer1.nDeg = 180;
        plaPlayer1.update(-plaPlayer1.nSpeed, 0);
      } else {
        plaPlayer1.nDeg = 180;
      }
    } else if (arbKeys[2]) { // Moves the player down
      if (plaPlayer1.nY < 800 - plaPlayer1.img.height / 2) { // Checks they haven't left the window
        plaPlayer1.nDeg = 90;
        plaPlayer1.update(0, plaPlayer1.nSpeed);
      } else {
        plaPlayer1.nDeg = 90;
      }
    } else if (arbKeys[3]) { // Moves the player right
      if (plaPlayer1.nX < 1220 - plaPlayer1.img.width / 2) { // Checks they haven't left the window
        plaPlayer1.nDeg = 0;
        plaPlayer1.update(plaPlayer1.nSpeed, 0);
      } else {
        plaPlayer1.nDeg = 0;
      }
    }
    if (arbKeys[4]) {
      if (plaPlayer2.nY > 0 + plaPlayer2.img.height / 2) {
        plaPlayer2.nDeg = 270;
        plaPlayer2.update(0, -plaPlayer2.nSpeed);
      } else {
        plaPlayer2.nDeg = 270;
      }
    } else if (arbKeys[5]) {
      if (plaPlayer2.nX > 0 + plaPlayer2.img.width) {
        plaPlayer2.nDeg = 180;
        plaPlayer2.update(-plaPlayer2.nSpeed, 0);
      } else {
        plaPlayer2.nDeg = 180;
      }
    } else if (arbKeys[6]) {
      if (plaPlayer2.nY < 800 - plaPlayer2.img.height) {
        plaPlayer2.nDeg = 90;
        plaPlayer2.update(0, plaPlayer2.nSpeed);
      } else {
        plaPlayer2.nDeg = 90;
      }
    } else if (arbKeys[7]) {
      if (plaPlayer2.nX < 1220 - plaPlayer2.img.width) {
        plaPlayer2.nDeg = 0;
        plaPlayer2.update(plaPlayer2.nSpeed, 0);
      } else {
        plaPlayer2.nDeg = 0;
      }
    }
    if (arbKeys[8]) {
      shoot(plaPlayer1);
    }
    if (arbKeys[9]) {
      shoot(plaPlayer2);
    }
  }

  plaPlayer1.display(); // Draws the player
  plaPlayer2.display();

  if (nChar == 5) { // Draws turrets
    if (plaPlayer1.t.fHealth > 0) {
      turretDisplay(plaPlayer1);
    }
  }
  if (nChar2 == 5) {
    if (plaPlayer2.t.fHealth > 0) {
      turretDisplay(plaPlayer2);
    }
  }

  if (nChar != 5) { // Draws bullets
    bulletDisplay(plaPlayer1);
  }
  if (nChar2 != 5) {
    bulletDisplay(plaPlayer2);
  }

  for (int i = 0; i < alBlue.size(); i++) { // Checks collision with buildings
    Building buildBlue = alBlue.get(i);
    if (isHit(plaPlayer1, buildBlue)) {
      plaPlayer1.nX = nXStart;
      plaPlayer1.nY = nYStart;
    }
  }

  for (int i = 0; i < alRed.size(); i++) {
    Building buildRed = alRed.get(i);
    if (isHit(plaPlayer1, buildRed)) {
      plaPlayer1.nX = nXStart;
      plaPlayer1.nY = nYStart;
    }
  }

  for (int i = 0; i < alBlue.size(); i++) {
    Building buildBlue = alBlue.get(i);
    if (isHit(plaPlayer2, buildBlue)) {
      plaPlayer2.nX = nXStart2;
      plaPlayer2.nY = nYStart2;
    }
  }

  for (int i = 0; i < alRed.size(); i++) {
    Building buildRed = alRed.get(i);
    if (isHit(plaPlayer2, buildRed)) {
      plaPlayer2.nX = nXStart2;
      plaPlayer2.nY = nYStart2;
    }
  }

  if (millis() - nNow >= nHealthDelay) { // Player bullet collision
    for (int i = 0; i < plaPlayer1.alBullets.size(); i++) {
      Bullet b = plaPlayer1.alBullets.get(i);
      if (isShot(b, plaPlayer2)) {
        plaPlayer2.fHealth -= plaPlayer1.nDamage;
        b.bShow = false;
      }
    }

    for (int i = 0; i < plaPlayer2.alBullets.size(); i++) {
      Bullet b = plaPlayer2.alBullets.get(i);
      if (isShot(b, plaPlayer1)) {
        plaPlayer1.fHealth -= plaPlayer2.nDamage;
        b.bShow = false;
      }
    }

    if (nChar2 == 5) {
      for (int i = 0; i < plaPlayer1.alBullets.size(); i++) {
        Bullet b = plaPlayer1.alBullets.get(i);
        if (isShot(b, plaPlayer2.t)) {
          plaPlayer2.t.fHealth -= 10;
          b.bShow = false;
        }
      }
    }

    if (nChar == 5) {
      for (int i = 0; i < plaPlayer2.alBullets.size(); i++) {
        Bullet b = plaPlayer2.alBullets.get(i);
        if (isShot(b, plaPlayer1.t)) {
          plaPlayer1.t.fHealth -= 10;
          b.bShow = false;
        }
      }
    }
  }

  hbPlayer1.update(plaPlayer1.nX - 50, plaPlayer1.nY - 50, plaPlayer1.fHealth); // Updates healthbars
  hbPlayer2.update(plaPlayer2.nX - 50, plaPlayer2.nY - 50, plaPlayer2.fHealth);

  hbPlayer1.display(); // Draws healthbars
  hbPlayer2.display();

  if (plaPlayer1.fHealth <= 0) {
    apBGM.pause();
    nScreen = 5;
    nWinner = 2;
  }
  if (plaPlayer2.fHealth <= 0) {
    apBGM.pause();
    nScreen = 5;
    nWinner = 1;
  }
}
boolean isHit(Player player, Building building) { // Determines if player has hit a building
  int nH1, nW1, nH2, nW2, nX1, nY1, nX2, nY2;
  nX1 = player.nX;
  nY1 = player.nY; 
  nX2 = building.nX;
  nY2 = building.nY;
  nH1 = player.img.height; 
  nW1 = player.img.width;
  nH2 = building.img.height;
  nW2 = building.img.width;
  if (
    ( ( (nX1 < nX2) && (nX1+nW1/2 > nX2) ) ||
    ( (nX1 > nX2) && (nX1-nW1/2 < nX2+nW2) ) )
    &&
    ( ( (nY1 < nY2) && (nY1+nH1/2 > nY2) ) ||
    ( (nY1 > nY2) && (nY1-nH1/2 < nY2+nH2) ) )
    )
    return (true) ;
  else
    return(false) ;
}

boolean isBulletHit(Bullet bullet, Building building) { // Determins if bullet has hit a building
  float fBulletX, fBulletY;
  int nBuildingX, nBuildingY, nW1, nH1, nW2, nH2;
  fBulletX = bullet.fX;
  fBulletY = bullet.fY;
  nBuildingX = building.nX;
  nBuildingY = building.nY;
  nH1 = bullet.nLength;
  nW1 = bullet.nWidth;
  nH2 = building.img.height;
  nW2 = building.img.width;
  if (
    ( ( (fBulletX < nBuildingX) && (fBulletX+nW1 > nBuildingX ) ) ||
    ( (fBulletX > nBuildingX) && (fBulletX < nBuildingX+nW2) ) )
    &&
    ( ( (fBulletY < nBuildingY) && (fBulletY+nH1 > nBuildingY ) ) ||
    ( (fBulletY > nBuildingY) && (fBulletY < nBuildingY+nH2 ) ) )
    )
    return (true);
  else
    return (false);
}

boolean isShot(Bullet bullet, Player player) { // Determines if player is shot
  float fBulletX, fBulletY;
  int nPlayerX, nPlayerY, nW1, nH1, nW2, nH2;
  fBulletX = bullet.fX;
  fBulletY = bullet.fY;
  nPlayerX = player.nX;
  nPlayerY = player.nY;
  nH1 = bullet.nLength;
  nW1 = bullet.nWidth;
  nH2 = player.img.height;
  nW2 = player.img.width;
  if (
    ( ( (nPlayerX < fBulletX) && (nPlayerX + nW2/2 > fBulletX) ) ||
    ( (nPlayerX > fBulletX) && (nPlayerX - nW2/2 < fBulletX + nW1) ) )
    &&
    ( ( (nPlayerY < fBulletY) && (nPlayerY+nH2/2 > fBulletY) ) ||
    ( (nPlayerY > fBulletY) && (nPlayerY-nH2/2 < fBulletY + nH1) ) )
    )
    return true;
  else
    return false;
}

void keyReleased() { // Sets keys to false if they're released
  if (key == 'w' || key == 'W') {
    arbKeys[0] = false;
  }
  if (key == 'a' | key == 'A') {
    arbKeys[1] = false;
  }
  if (key == 's' || key == 'S') {
    arbKeys[2] = false;
  }
  if (key == 'd' || key == 'D') {
    arbKeys[3] = false;
  }
  if (keyCode == UP) {
    arbKeys[4] = false;
  }
  if (keyCode == LEFT) {
    arbKeys[5] = false;
  }
  if (keyCode == DOWN) {
    arbKeys[6] = false;
  }
  if (keyCode == RIGHT) {
    arbKeys[7] = false;
  }
  if (key == 'e') {
    arbKeys[8] = false;
  }
  if (key == '0') {
    arbKeys[9] = false;
  }
}