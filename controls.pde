public void controls() {
  Button btnBack = new Button("backbtn.png", 822, 324); // Back button
  imgBackground = loadImage("ctrlScreen.png");

  background(imgBackground);
  btnBack.update();

  if (mousePressed) { // Checks if start button is hit
    if (btnBack.isClicked()) {
      nScreen = 0; // Switches to Start
    }
  }
}