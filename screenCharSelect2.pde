PImage imgBackground2;
Button btnSupport2, btnMerc2, btnAssassin2, btnMarksman2, btnSniper2, btnConstructor2, btnTank2;

public void screenCharSelect2() {
  imgBackground2 = loadImage("CharSelSre2.png");
  btnSupport2 = new Button("supportport.bmp", 100, 200); 
  btnMerc2 = new Button("mercport.bmp", 380, 200);
  btnAssassin2 = new Button("assassinport.bmp", 660, 200);
  btnMarksman2 = new Button("markport.bmp", 940, 200);
  btnSniper2 = new Button("Snipr.bmp", 250, 480);
  btnConstructor2 = new Button("Constructor.bmp", 530, 480);
  btnTank2 = new Button("Tank.bmp", 810, 480);

  background(imgBackground2); // Sets the background

  btnSupport2.update(); // Draws the buttons
  btnMerc2.update();
  btnAssassin2.update();
  btnMarksman2.update();
  btnSniper2.update();
  btnConstructor2.update();
  btnTank2.update();

  if (btnSupport2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 0; // Sets the character to the one selected
      nScreen = 6; // Starts the game
    }
  }
  if (btnMerc2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 1;
      nScreen = 6;
    }
  }
  if (btnAssassin2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 2;
      nScreen = 6;
    }
  }
  if (btnMarksman2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 3;
      nScreen = 6;
    }
  }
  if (btnSniper2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 4;
      nScreen = 6;
    }
  }
  if (btnConstructor2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 5;
      nScreen = 6;
    }
  }
  if (btnTank2.isClicked()) {
    if (mousePressed) { // Checks if a button is presed 
      nChar2 = 6;
      nScreen = 6;
    }
  }
}