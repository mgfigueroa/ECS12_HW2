float timer = 0;
int r = 750;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  timer += .05; //timer will be used for sin and cos functions. Gradually gets larger
  if (r > 150) r--; //Used for the radius of the middle circle. 
  int mag = 500;//For the size of the corner circles

  background( 0, 140 + abs(oscillation(true, 41, timer)), 185 + abs(oscillation(true, 70, timer)));//The oscillating blue background

  //This creates the four corner circles
  
  fill(102, 0, 204);
  ellipse(0, 0, oscillation(true, mag, timer), oscillation(true, mag, timer));
  ellipse(500, 500, oscillation(true, mag, timer), oscillation(true, mag, timer));
  ellipse(500, 0, oscillation(true, mag, timer), oscillation(true, mag, timer));
  ellipse(0, 500, oscillation(true, mag, timer), oscillation(true, mag, timer));

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
      fill(255, 0, 0);
      stroke(150, 0, 0);
      ellipse(250 + oscillation(true, 200, timer+radians(60*i) ), 250 + oscillation(false, 200, radians(timer+60*i)), oscillation(false, 50, timer), oscillation(false, 50, timer)); // Red circles
    } 
    else {//The other 3 circles
      fill(0, 0, 255);
      stroke(0, 0, 150);
      ellipse(250 + oscillation(true, 150, timer+radians(60*i) ), 250 + oscillation(false, 150, radians(timer+60*i)), oscillation(false, 100, timer), oscillation(false, 100, timer)); // Blue circles
    }
    

    
    
    
  }

  //The middle circle which goes in a circle around the outer middle ellipse
  strokeWeight(3);
  stroke(50,125,200);
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

