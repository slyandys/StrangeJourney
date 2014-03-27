//KeyPressed control
void keyPressed() {
  if (key == BACKSPACE) {
    FBody hovered = world.getBody(mouseX, mouseY);
    if ( hovered != null  ) {//&& hovered.isStatic() == false
      world.remove(hovered);
    }
  }
  else if (key == ENTER) {
    screenNum = 1;
    setup();
    worldSetup();
  }
  else if (key == ' ')
  {
    screenNum = 2;
    setup();
  }
  else if (key == 'a')
  {
    bposX = bola.getX();//-5;
    bposY = bola.getY();
    bola.setVelocity(-200, 0);
    //bola.setPosition(bposX,bposY);
    println("bolaXY = ("+bola.getX()+","+bola.getY()+")");
  }
  else if (key == 'd')
  {
    bposX = bola.getX();//+5;
    bposY = bola.getY();
    bola.setVelocity(200, 0);
    //bola.setPosition(bposX,bposY);
    println("bolaXY = ("+bola.getX()+","+bola.getY()+")");
  }
  else if (key == 'w')
  {
    bposX = bola.getX();
    bposY = bola.getY();
    bola.setVelocity(0, 800);
    println("bolaXY = ("+bola.getX()+","+bola.getY()+")");
  }
  else if (key == 'r')
  {
    screenNum = 1;
    timeflag = false;
    setup();
    worldSetup();
  }
  else {
    try {
      saveFrame("screenshot.png");
    } 
    catch (Exception e) {
    }
  }
}
