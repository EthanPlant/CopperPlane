// © Sam Cooper & Ethan Plant 2017
// http://reddit.com/r/yasuomains
// Bada boom, bada beeny, your fettuccine is now completey

import ddf.minim.*;

int nScreen, nChar, nChar2, nWinner, nMap; // nScreen controls the screen shown, nChar holds the current character the player's using
boolean bGameSetup = true; // Starts game
boolean bSongStart = true; // Starts song
// Determines if the game is first rendering or not
Player plaPlayer1, plaPlayer2; // Player Characters
boolean[] arbKeys = new boolean[10]; // Multikeys bois
int nNow, nHealthDelay; // Delay timers
boolean bTShoot; // Turret shoot boolean
Minim minim; // Sound
AudioPlayer apStart, apBGM, apSniper, apEnd, apSupp, apMerc, apMarksman, apAssassin, apTank, apTShoot, apTurret;

void setup() {
  size(1220, 800); // Sets window size
  frame.requestFocus(); //Auto focuses
  nNow = millis();
  nHealthDelay = 2000;

  minim = new Minim(this); //Sound
  apStart = minim.loadFile("Start.mp3");
  apEnd = minim.loadFile("End.mp3");
  apSniper = minim.loadFile("Sniper.mp3");
  apSupp = minim.loadFile("supp.mp3");
  apMerc = minim.loadFile("Merc.mp3");
  apMarksman = minim.loadFile("Marksman.mp3");
  apAssassin = minim.loadFile("assassin.mp3");
  apTank = minim.loadFile("tank.mp3");
  apTShoot = minim.loadFile("tshoot.mp3");
  apTurret = minim.loadFile("turret.mp3");
}

void draw() {
  if (nScreen == 0) {
    startMenu(); // Draws the start menu
    delay(100);
  }
  if (nScreen == 1) {
    screenCharSelect(); // Draws the character select menu
    delay(100);
  } else if (nScreen == 2) {
    screenCharSelect2(); // Draws Player 2 Select
  }
  if (nScreen == 3) {
    game(); // Draws the games
  }
  if (nScreen == 4) {
    controls(); // Draws control screen
  }
  if (nScreen == 5) {
    gameOver(); // Draws game over screen
  }
  if(nScreen == 6) {
    mapSelect();
  }
}