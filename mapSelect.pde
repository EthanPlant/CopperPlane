void mapSelect() {
  imgBackground = loadImage("mapsel.png");
  Button btnVillage = new Button("Villagebutton.png", 215, 310);
  Button btnArena = new Button("Arenabutton.png",  520, 310);
  Button btnMoon = new Button("Moonbutton.png", 825, 310);
  
  background(imgBackground);
  
  btnVillage.update();
  btnArena.update();
  btnMoon.update();
  
  if(btnVillage.isClicked()) {
    if(mousePressed) {
      nMap = 0;
      nScreen = 3;
    }
  }
  if(btnArena.isClicked()) {
    if(mousePressed) {
      nMap = 1;
      nScreen = 3;
    }
  }
  if(btnMoon.isClicked()) {
    if(mousePressed) {
      nMap = 2;
      nScreen = 3;
    }
  }
}