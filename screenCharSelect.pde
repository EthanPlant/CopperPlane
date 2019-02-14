PImage imgBackground;
Button btnSupport, btnMerc, btnAssassin, btnMarksman, btnSniper, btnConstructor, btnTank;

public void screenCharSelect() {
  imgBackground = loadImage("CharSelSre1.bmp");
  btnSupport = new Button("supportport.bmp", 100, 200); 
  btnMerc = new Button("mercport.bmp", 380, 200);
  btnAssassin = new Button("assassinport.bmp", 660, 200);
  btnMarksman = new Button("markport.bmp", 940, 200);
  btnSniper = new Button("Snipr.bmp", 250, 480);
  btnConstructor = new Button("Constructor.bmp", 530, 480);
  btnTank = new Button("Tank.bmp", 810, 480);

  background(imgBackground); // Sets the background

  btnSupport.update(); // Draws the buttons
  btnMerc.update();
  btnAssassin.update();
  btnMarksman.update();
  btnSniper.update();
  btnConstructor.update();
  btnTank.update();
 

  if (btnSupport.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 0; // Sets the character to the one selected
      nScreen = 2; // Starts the game
    }
  }
  if (btnMerc.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 1;
      nScreen = 2;
    }
  }
  if (btnAssassin.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 2;
      nScreen = 2;
    }
  }
  if (btnMarksman.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 3;
      nScreen = 2;
    }
  }
  if (btnSniper.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 4;
      nScreen = 2;
    }
  }
  if (btnConstructor.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 5;
      nScreen = 2;
    }
  }
  if (btnTank.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar = 6;
      nScreen = 2;
    }
  }
}