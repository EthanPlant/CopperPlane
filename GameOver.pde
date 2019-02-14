public void gameOver() {
  bSongStart = true;

  if (bSongStart) {
    apEnd.play(); // Starts the song
    bSongStart = false;
  }
  
  for(int i = 0; i < alBlue.size(); i++) {
    alBlue.remove(i);
  }
  
  for(int i = 0; i < alRed.size(); i++) {
    alRed.remove(i);
  }
  
  PImage imgWinner1, imgWinner2;
  Button btnreStart = new Button("startmenu.png", width/2-150, 300); // Restart button
  Button btnExit = new Button("exit.png", 1000, 700); // Exit button
  imgWinner1 = loadImage("gameover1.png");
  imgWinner2 = loadImage("gameover2.png");
  bGameSetup = true;
  imageMode(CORNER);
  if (nWinner == 1) { // Draws correct background based on winning player
    background(imgWinner1);
  }
  if (nWinner == 2) {
    background(imgWinner2);
  }
  btnreStart.update();
  btnExit.update();
  arbKeys[0] = false; // Sets all keys to false
  arbKeys[1] = false;
  arbKeys[2] = false;
  arbKeys[3] = false;
  arbKeys[4] = false;
  arbKeys[5] = false;
  arbKeys[6] = false;
  arbKeys[7] = false;
  arbKeys[8] = false;
  arbKeys[9] = false;

  if (mousePressed) { // Checks if start button is hit
    if (btnreStart.isClicked()) {
      nScreen = 0; // Switches to character select screen
      apEnd.pause();
      bSongStart = true;
    } else if (btnExit.isClicked()) {
      exit(); // Exits game
    }
  }
}