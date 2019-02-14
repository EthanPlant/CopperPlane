int nTurretCD = 1000;

void shoot(Player player) {
  if (frameCount%15 == 0) {
    if (player.nClass == 2) {
      if (player.nDeg == 0) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, player.img.height, 5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apAssassin.play();
        apAssassin.rewind();
      } else if (player.nDeg == 90) {
        Bullet b = new Bullet(player.nX, player.nY, 0, player.img.width, 5, 0, 5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apAssassin.play();
        apAssassin.rewind();
      } else if (player.nDeg == 180) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, player.img.height, -5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apAssassin.play();
        apAssassin.rewind();
      } else if (player.nDeg == 270) {
        Bullet b = new Bullet(player.nX, player.nY, 0, player.img.width, 5, 0, -5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apAssassin.play();
        apAssassin.rewind();
      }
    }
    if (player.nClass == 3) { // Draws correct bullet based on class
      if (player.nDeg == 0) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 20, 0, 9, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apMarksman.play();
        apMarksman.rewind();
      } else if (player.nDeg == 90) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 0, 20, 0, 9);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apMarksman.play();
        apMarksman.rewind();
      } else if (player.nDeg == 180) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 20, 0, -9, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apMarksman.play();
        apMarksman.rewind();
      } else if (player.nDeg == 270) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 0, 20, 0, -9);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apMarksman.play();
        apMarksman.rewind();
      }
    }
    if (player.nClass == 5) {
      if (millis() - nNow >= nTurretCD) {
        if (player.nDeg == 0) {
          player.t = new Player("Turret.bmp", player.nX + 50, player.nY, 50, 350, 0, 0, 10);
          player.t.nDeg = player.nDeg;
          player.t.nDx = 3;
          player.hbTurret = new HealthBar(player.t.nX, player.t.nY - 50, 100, player.t.fMaxHealth);
          nNow = millis();
          bTShoot = true;
          apTurret.play();
          apTurret.rewind();
        } else if (player.nDeg == 90) {
          player.t = new Player("Turret.bmp", player.nX, player.nY + 50, 50, 350, 0, 0, 10);
          player.t.nDeg = player.nDeg;
          player.t.nDy = 3;
          player.hbTurret = new HealthBar(player.t.nX, player.t.nY - 50, 100, player.t.fMaxHealth);
          nNow = millis();
          bTShoot = true;
          apTurret.play();
          apTurret.rewind();
        } else if (player.nDeg == 180) {
          player.t = new Player("Turret.bmp", player.nX-50, player.nY, 50, 350, 0, 0, 10);
          player.t.nDeg = player.nDeg;
          player.t.nDx = -3;
          player.hbTurret = new HealthBar(player.t.nX, player.t.nY - 50, 100, player.t.fMaxHealth);
          nNow = millis();
          bTShoot = true;
          apTurret.play();
          apTurret.rewind();
        } else if (player.nDeg == 270) {
          player.t = new Player("Turret.bmp", player.nX, player.nY - 50, 50, 350, 0, 0, 10);
          player.t.nDeg = player.nDeg;
          player.t.nDy = -3;
          player.hbTurret = new HealthBar(player.t.nX, player.t.nY - 50, 100, player.t.fMaxHealth);
          nNow = millis();
          bTShoot = true;
          apTurret.play();
          apTurret.rewind();
        }
      }
    } else if (player.nClass != 4 && player.nClass != 3 && player.nClass != 2 && player.nClass != 5) {
      if (player.nDeg == 0) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        if (player.nClass == 0) {
          apSupp.play();
          apSupp.rewind();
        }
        if (player.nClass == 1) {
          apMerc.play();
          apMerc.rewind();
        }
        if (player.nClass == 6) {
          apTank.play();
          apTank.rewind();
        }
      } else if (player.nDeg == 90) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 0, 5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        if (player.nClass == 0) {
          apSupp.play();
          apSupp.rewind();
        }
        if (player.nClass == 1) {
          apMerc.play();
          apMerc.rewind();
        }
        if (player.nClass == 6) {
          apTank.play();
          apTank.rewind();
        }
      } else if (player.nDeg == 180) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, -5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        if (player.nClass == 0) {
          apSupp.play();
          apSupp.rewind();
        }
        if (player.nClass == 1) {
          apMerc.play();
          apMerc.rewind();
        }
        if (player.nClass == 6) {
          apTank.play();
          apTank.rewind();
        }
      } else if (player.nDeg == 270) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 0, -5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        if (player.nClass == 0) {
          apSupp.play();
          apSupp.rewind();
        }
        if (player.nClass == 1) {
          apMerc.play();
          apMerc.rewind();
        }
        if (player.nClass == 6) {
          apTank.play();
          apTank.rewind();
        }
      }
    }
  }

  if (frameCount%5 == 0) {
    if (player.nClass == 6) {
      if (player.nDeg == 0) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apTank.play();
        apTank.rewind();
      } else if (player.nDeg == 90) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 0, 5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apTank.play();
        apTank.rewind();
      } else if (player.nDeg == 180) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, -5, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apTank.play();
        apTank.rewind();
      } else if (player.nDeg == 270) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 5, 5, 0, -5);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apTank.play();
        apTank.rewind();
      }
    }
  }

  if (frameCount%90 == 0) {
    if (player.nClass == 4) {
      if (player.nDeg == 0) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 10, 3, 7, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apSniper.play();
        apSniper.rewind();
      } else if (player.nDeg == 90) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 3, 10, 0, 7);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apSniper.play();
        apSniper.rewind();
      } else if (player.nDeg == 180) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 10, 3, -7, 0);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apSniper.play();
        apSniper.rewind();
      } else if (player.nDeg == 270) {
        Bullet b = new Bullet(player.nX, player.nY, 0, 3, 10, 0, -7);
        player.alBullets.add(b);
        bShoot = true;
        b.bShow = true;
        apSniper.play();
        apSniper.rewind();
      }
    }
  }
}

void bulletDisplay(Player player) {
  for (int i = 0; i < player.alBullets.size(); i++) {
    Bullet b = player.alBullets.get(i);
    if (b.bShow == true) {
      if (dist(player.nX, player.nY, b.fX, b.fY) < player.nRange) {
        b.update();
        b.display();
      } else {
        b.bShow = false;
      }
    } else {
      player.alBullets.remove(b);
    }
  }
}

void turretDisplay(Player player) {
  player.t.display();
  player.hbTurret.update(player.t.nX- 50, player.t.nY - 50, player.t.fHealth);
  player.hbTurret.display();

  if (frameCount%15 == 0) {
    if (dist(player.t.nX, player.t.nY, player.nX, player.nY) <= player.t.nRange) {
      Bullet b = new Bullet(player.t.nX, player.t.nY, 0, 3, 3, player.t.nDx, player.t.nDy);
      player.alBullets.add(b);
      apTShoot.play();
      apTShoot.rewind();
      b.bShow = true;
    }
  }

  for (int i = 0; i < player.alBullets.size(); i++) {
    Bullet b = player.alBullets.get(i);
    if (b.bShow == true) {
      if (dist(b.fX, b.fY, player.t.nX, player.t.nY) < player.t.nRange) {
        b.update();
        b.display();
      } else {
        b.bShow = false;
      }
    } else {
      player.alBullets.remove(b);
    }
  }
}