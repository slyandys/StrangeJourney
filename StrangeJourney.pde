/**
 *  Rescure the Princess
 *
 *  by Zheng Xia
 *
 *  This demo show a journey on rescuring a princess through some strange lands.
 *  NB will be show during the playing as well as the story..
 */

import fisica.*;

PImage princessImg;
FWorld world;
FPoly poly;

//main character
FCircle bola;

FBox boxButton;
FCircle circleButton;
FPoly polyButton;
FPoly polyPent;
FBlob polyPenta;

int screenNum = 0;
int health;
int dialog = 0;
int initTime = 0;

float bposX=0;
float bposY=0;

int trinum = 0;
int squnum = 0;
int cirnum = 0;

color buttonColor = #155AAD;
color hoverColor = #55AA11;
color bodyColor = #6E0595;

Boolean reflec = false;
Boolean timeflag = false;

void setup() {
  size(1000, 800);
  smooth();
  initTime = millis();

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 1000);
  world.setEdges();
  health = 100;
  //world.remove(world.left);
  //world.remove(world.right);
  //world.remove(world.top);
  world.setEdgesRestitution(0.5);

  //main character
  bola = new FCircle(40);

  princessImg = loadImage("Cage_peach_fake.png");

  bola.setPosition(width/3, 60);
  bposX = width/3;
  bposY = 60;
  bola.setDensity(0.1);
  bola.setFill(120, 120, 190);
  bola.setNoStroke();
  //world.add(bola);
}

void worldSetup()
{
  if (screenNum == 1) {
    initTime = millis();
    world.clear();
    world.remove(world.left);
    world.remove(world.right);
    world.add(world.left);
    world.add(world.top);
    world.add(world.bottom);
    //world.remove(world.right);
    bola.setPosition(bposX, bposY);
    world.add(bola);
  }
  if (screenNum == 2) {
    //Fisica.init(this);
    //world.setEdges();
    //dialog = 15;
    world.remove(world.left);
    world.remove(world.right);
    //world.add(world.right);
    //world.setEdges();
    //world.remove(world.right);
    //world.remove(world.top);

    boxButton = new FBox(40, 40);
    boxButton.setPosition(width/4, 100);
    boxButton.setStatic(true);
    boxButton.setFillColor(buttonColor);
    boxButton.setNoStroke();
    world.add(boxButton);

    //    circleButton = new FCircle(40);
    //    circleButton.setPosition(2*width/4, 100);
    //    circleButton.setStatic(true);
    //    circleButton.setFillColor(buttonColor);
    //    circleButton.setNoStroke();
    //    world.add(circleButton);

    //    polyButton = new FPoly();
    //    polyButton.vertex(20, 20);
    //    polyButton.vertex(-20, 20);
    //    polyButton.vertex(0, -20);
    //    polyButton.setPosition(3*width/4, 100);
    //    polyButton.setStatic(true);
    //    polyButton.setFillColor(buttonColor);
    //    polyButton.setNoStroke();
    //    world.add(polyButton);

    bola.setPosition(bposX, bposY);
    world.add(bola);

    if (polyPent != null)
    {
      world.remove(polyPent);
    }
  }
  if (screenNum == 3) {
    //Fisica.init(this);
    //world.setEdges();
    dialog = 20;
    world.clear();
    world.add(world.right);
    world.add(world.top);
    world.add(world.bottom);
    //world.setEdges();
    //world.remove(world.right);
    //world.setGravity(0, -1000);
    //world.remove(boxButton);


    //    polyButton = new FPoly();
    //    polyButton.vertex(20, 20);
    //    polyButton.vertex(-20, 20);
    //    polyButton.vertex(0, -20);
    //    polyButton.setPosition(3*width/4, 100);
    //    polyButton.setStatic(true);
    //    polyButton.setFillColor(buttonColor);
    //    polyButton.setNoStroke();
    //    world.add(polyButton);

    polyPent = new FPoly();
    polyPent.setName("pent");
    polyPent.vertex(20, 20);
    polyPent.vertex(45, 40);
    polyPent.vertex(95, 40);
    polyPent.vertex(120, 20);
    polyPent.vertex(108, 1);
    polyPent.setPosition(3*width/4, 100);
    polyPent.setStatic(true);
    polyPent.setFillColor(buttonColor);
    polyPent.setNoStroke();
    world.add(polyPent);

    //    polyPenta = new FBlob();
    //    polyPenta.setName("pent");
    //    polyPenta.vertex(20, 20);
    //    polyPenta.vertex(45, 40);
    //    polyPenta.vertex(95, 40);
    //    polyPenta.vertex(120, 20);
    //    polyPenta.vertex(108, 1);
    //    polyPenta.setPosition(3*width/4, 100);
    //    polyPenta.setStatic(true);
    //    polyPenta.setFillColor(buttonColor);
    //    polyPenta.setNoStroke();
    //    world.add(polyPenta);

    bola.setPosition(bposX, bposY);
    world.add(bola);
  }
}

void draw() {
  background(255);
  //  println("the world number is: "+screenNum);
  println("the dialog # is: " + dialog);
  if (health <= 0)
  {
    screenNum = 4;
  }
  if (screenNum == 4)
  {
    GameOver();
  }


  if (screenNum == 0)
  {
    displays();
  }
  else 
  {
    world.step();
    world.draw(this);

    if (screenNum == 1)
    {
      //health = 1;
      image(princessImg, 600, 0);
      scenStart();
      if(health == 1 && dialog >= 30)
      {
        SceneEnding();
      }
    }

    if (screenNum == 2)
    {
      SceneTheHits();
      generation();
      //     pushStyle();
      displaysItemState();
      //     popStyle();
      reflec = false;
      if (frameCount % 12 == 0)
        world.setGravity(0, random(-1000, 1000));
    }

    // Draw the polygon while
    // while it is being created
    // and hasn't been added to the
    // world yet

    if (screenNum == 3)
    {
      SceneThing();
      if(timeflag)
      {
        SceneOver();
      }

      if (poly != null) {
        poly.draw(this);
      }

      if (reflec == false)
      {
        bola.setVelocity(health, 0);
        if (bola.getX() >= 975 )
          reflec = true;
      }
      else {
        bola.setVelocity(-health, 0);
      }
    }
    //Scene change
    //Screen 1 to Screen 2
    if (bola.getX() > 1000 && screenNum == 1)
    {
      screenNum = 2;
      bposX=bposX-990;//bposY
      worldSetup();
    }

    //Screen 2 to Screen 3
    if (bola.getX() > 1000 && screenNum == 2)
    {
      screenNum = 3;
      bposX=bposX-990;
      worldSetup();
    }

    //Screen 2 to Screen 1
    if (bola.getX() < 0 && screenNum == 2)
    {
      screenNum = 1;
      bposX=bposX+990;
      worldSetup();
    }

    //Screen 3 to Screen 2
    if (bola.getX() < 0 && screenNum == 3)
    {
      screenNum = 2;
      bposX=bposX+990;
      worldSetup();
    }
  }
}


void generation() {
  if (frameCount % 8 == 0) {
    FBox myBox = new FBox(40, 40);
    myBox.setPosition(width/4, 200);
    myBox.setRotation(random(TWO_PI));
    myBox.setVelocity(random(TWO_PI), random(TWO_PI));
    //myBox.setVelocity(0, 200);
    myBox.setFillColor(bodyColor);
    myBox.setNoStroke();
    world.add(myBox);
  }
}

void contactStarted(FContact c) {
  if (screenNum == 2 || screenNum == 3) {
    FBody ball = null;
    if (c.getBody1() == bola) {
      ball = c.getBody2();
    }
    else if (c.getBody2() == bola) {
      ball = c.getBody1();
    }



    //    if(ball.getX()==809 && ball.getY() == 353)
    //    {
    //      world.remove(polyPent);
    //    }

    if (ball == null) {
      return;
    }
    if (ball == bola || ball == world.bottom || ball == world.top || ball == world.right ) {
      return;
    }

    println("eliminate ball # are: "+ ball);
    if (screenNum == 3) {
      println("The nameeeeeeeee:" + ball.getName());
      if (ball.getName() == null)
      {
        return;
      }
      else if (ball.getName().equals("pent"))
      {
        //println("shit");
        timeflag = true;
      }
    }
    //println("the ball2 is: "+ ball2);
    ball.setFill(30, 190, 200);
    //ball.removeFromWorld();
    health--;
    world.remove(ball);
  }
}


void mousePressed() {
  if (screenNum == 3)
  {  

    if (world.getBody(mouseX, mouseY) != null) {
      //world.remove(poly);
      //    world.remove(bola);
      return;
    }

    poly = new FPoly();
    poly.setStrokeWeight(3);
    poly.setFill(120, 30, 90);
    poly.setDensity(0);
    poly.setRestitution(0.5);
    poly.vertex(mouseX, mouseY);
  }
  else if (screenNum == 2)
  {
    FBody pressed = world.getBody(mouseX, mouseY);
    if (pressed == boxButton) {
      FBox myBox = new FBox(40, 40);
      myBox.setPosition(width/4, 200);
      myBox.setRotation(random(TWO_PI));
      myBox.setVelocity(0, 200);
      myBox.setFillColor(bodyColor);
      myBox.setNoStroke();
      world.add(myBox);
    } 
    //    else if (pressed == circleButton) {
    //      FCircle myCircle = new FCircle(40);
    //      myCircle.setPosition(2*width/4, 200);
    //      myCircle.setRotation(random(TWO_PI));
    //      myCircle.setVelocity(0, 200);
    //      myCircle.setFillColor(bodyColor);
    //      myCircle.setNoStroke();
    //      world.add(myCircle);
    //    } 
    //    else if (pressed == polyButton) {
    //      FPoly myPoly = new FPoly();
    //      myPoly.vertex(20, 20);
    //      myPoly.vertex(-20, 20);
    //      myPoly.vertex(0, -20);
    //      myPoly.setPosition(3*width/4, 200);
    //      myPoly.setRotation(random(TWO_PI));
    //      myPoly.setVelocity(0, 200);
    //      myPoly.setFillColor(bodyColor);
    //      myPoly.setNoStroke();
    //      world.add(myPoly);
    //    }
  }
}

void mouseDragged() {
  if (poly!=null) {
    poly.vertex(mouseX, mouseY);
  }
}

void mouseReleased() {
  if (poly!=null) {
    world.add(poly);
    poly = null;
  }
}


void mouseMoved() {
  if (screenNum == 3) {
    FBody hovered = world.getBody(mouseX, mouseY);
    //println("I'm moving:" + hovered);
  }

  if (screenNum == 2) {
    FBody hovered = world.getBody(mouseX, mouseY);
    if (hovered == boxButton) {//      || hovered == circleButton || hovered == polyButton
      hovered.setFillColor(hoverColor);
    } 
    else {
      boxButton.setFillColor(buttonColor);
      //circleButton.setFillColor(buttonColor);
      //polyButton.setFillColor(buttonColor);
    }
  }
}

