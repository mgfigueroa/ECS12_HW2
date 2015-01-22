float timer = 0;
int r = 750;
Square array[] = new Square[10];
Square rear[] = new Square[250];

private class Square {
  private int len;
  private int myStroke;
  private int x;
  private int xr;
  public int y;
  private int yl;
  private int xMove;
  private int yMove;
  private color fillColor;
  private color strokeColor;
  private boolean existence;

  public Square(int side, int stk) {
    len = side;
    myStroke = stk;
    //strokeColor = color(random(255),random(255),random(255));
    //fillColor = color(random(255),random(255),random(255)); 
    strokeColor = color(184, 134, 11);
    fillColor = color(255, 255, 0);
    x = int(random(-150, 150)) + width/2;
    y = int(random(-150, 150)) + (height/2) - 100;
    while (xMove == 0 && yMove == 0) { // Don't want a stand still square
      xMove = int(random(-3.9, 3.9));
      yMove = int(random(-3.9, 3.9));
    }
  }


  public Square(int side, int stk, boolean existstooverload) {
    len = side;
    myStroke = stk;
    strokeColor = color(25, 25, 112);
    fillColor = color(102, 0, 204);
    x = int(random(0, 500));
    y = int(random(-500, -15));
    xMove = 0; // No x movement
    yMove = int(random(1, 5.9));
  }


  private void render() {
    //LEFT SIDE
    if (x <= 0) {
      xMove = -xMove;
    } 
    //BOTTOM SIDE
    if ( (y >= (height-len-myStroke)) ) {
      yMove = -yMove;
    }
    //RIGHT SIDE
    if (x >= (width-len)) {
      xMove = -xMove;
    } 
    //TOP SIDE
    if (y <= 0) {
      yMove = -yMove;
    }
    x += xMove;
    y += yMove;
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(myStroke);
    rect(x, y, len, len);
  }
  private void backRender() {
    y += yMove;
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(myStroke);
    rect(x, y, len, len);
}
}


void setup() {
  size(500, 500);
  background(0);
  // for (int i = 0; i < 4; i++) {
  // array[i] = new Square();
  //}
}

void draw() {




  timer += .05; //timer will be used for sin and cos functions. Gradually gets larger
  if (r > 150) r--; //Used for the radius of the middle circle. 
  int mag = 500;//For the size of the corner circles

  background( 0, 140 + abs(oscillation(true, 41, timer)), 185 + abs(oscillation(true, 70, timer)));//The oscillating blue background


for(int i = 0; i < 250; i++){
  if(rear[i] == null) rear[i] = new Square(10, 2, true);
  if(rear[i].y > 520) rear[i] = new Square(10, 2, true);
  rear[i].backRender();
}



  for (int i = 0; i < 10; i++) {
    //if (array[i].existence = false) {
    if (array[i] == null) {
      array[i] = new Square(20, 3);
    }
    array[i].render();
  }

  //Red lines connecting red circles
  stroke(150, 0, 0);
  line(250 + oscillation(true, 200, timer+radians(60*2) ), 
  250 + oscillation(false, 200, radians(timer+60*2)), 
  250 + oscillation(true, 200, timer+radians(60*4) ), 
  250 + oscillation(false, 200, radians(timer+60*4)) );

  line(250 + oscillation(true, 200, timer+radians(60*2) ), 
  250 + oscillation(false, 200, radians(timer+60*2)), 
  250 + oscillation(true, 200, timer+radians(60*6) ), 
  250 + oscillation(false, 200, radians(timer+60*6)) );

  line(250 + oscillation(true, 200, timer+radians(60*6) ), 
  250 + oscillation(false, 200, radians(timer+60*6)), 
  250 + oscillation(true, 200, timer+radians(60*4) ), 
  250 + oscillation(false, 200, radians(timer+60*4)) );

  //Blue lines connecting blue circles
  stroke(0, 0, 150);
  line(250 + oscillation(true, 150, timer+radians(60) ), 
  250 + oscillation(false, 150, radians(timer+60)), 
  250 + oscillation(true, 150, timer+radians(60*3) ), 
  250 + oscillation(false, 150, radians(timer+60*3)) );

  line(250 + oscillation(true, 150, timer+radians(60) ), 
  250 + oscillation(false, 150, radians(timer+60)), 
  250 + oscillation(true, 150, timer+radians(60*5) ), 
  250 + oscillation(false, 150, radians(timer+60*5)) );

  line(250 + oscillation(true, 150, timer+radians(60*3) ), 
  250 + oscillation(false, 150, radians(timer+60*3)), 
  250 + oscillation(true, 150, timer+radians(60*5) ), 
  250 + oscillation(false, 150, radians(timer+60*5)) );


  //For loop will make 6 circles
  for (int i = 1; i < 7; i+= 1) {

    if (i % 2 == 0) {//Different settings for 3 out of the 6 circles (color, size, etc)
      fill(220, 0, 0);
      stroke(150, 0, 0);
      ellipse(250 + oscillation(true, 200, timer+radians(60*i) ), 250 + oscillation(false, 200, radians(timer+60*i)), oscillation(false, 50, timer), oscillation(false, 50, timer)); // Red circles
    } else {//The other 3 circles
      fill(0, 0, 255);
      stroke(0, 0, 150);
      ellipse(250 + oscillation(true, 150, timer+radians(60*i) ), 250 + oscillation(false, 150, radians(timer+60*i)), oscillation(false, 100, timer), oscillation(false, 100, timer)); // Blue circles
    }
  }

  //The middle circle which goes in a circle around the outer middle ellipse
  strokeWeight(3);
  stroke(50, 125, 200);
  pushMatrix();
  fill(255, 65);
  translate(250, 250);
  ellipse(oscillation(true, 50, timer), oscillation(false, 50, timer ), oscillation(true, 50, timer), oscillation(false, 50, timer ));
  popMatrix();

  //The outer ellipse in the middle
  pushMatrix();
  translate(250, 250);
  rotate(radians(timer*150));
  fill(r, (-1) * r + 250);
  ellipse(0, 0, 150, r);
  popMatrix();
}


float oscillation(boolean sin, int magnitude, float timer) {
  if (sin) return magnitude * sin(timer);
  else return magnitude * cos(timer);
}// Return the sin or cos function based on user choice and a given magnitude. 

