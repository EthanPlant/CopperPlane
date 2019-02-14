public void startMenu() {
  Button btnStart = new Button("start.png", width/2-150, 300);
  Button btnControls = new Button("controls.png", width/2-150, 500);
  Button btnExit = new Button("exit.png", 1000, 700);
  imgBackground = loadImage("startScreen.png");
  bSongStart = true;

  if (bSongStart) {
    apStart.play();
    bSongStart = false;
  }

  background(imgBackground);

  btnStart.update();
  btnControls.update();
  btnExit.update();

  if (mousePressed) { // Checks if start button is hit
    if (btnStart.isClicked()) {
      nScreen = 1; // Switches to character select screen
    } else if (btnControls.isClicked()) {
      nScreen = 4;
    } else if (btnExit.isClicked()) {
      exit();
    }
  }
}