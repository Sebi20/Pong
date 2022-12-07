//If the player hits the ball with the paddle, they will earn a point
//However, if the ball misses the paddle then the players loses a point

int paddleYpos = 560; // The position of the paddle in the y-direction

int score = 0;       // Keeps track of the player's score
int lives = 10;      // Keeps track of the player's life
int rad = 30;        // Width of the ball
float xpos, ypos;    // Starting position of ball    
                     

float xSpeedOfBall = 2.8;  // Speed of the ball
float ySpeedOfBall = 2.2;  // Speed of the ball

int xDirectionOfBall = 1;  // Direction the ball is going in the X position
int yDirectionOfBall = 1;  // Direction the ball is going in the Y position

void setup(){
  size(600, 600);
  xpos = width/2;
  ypos = height/2;
  
}

void draw(){
  background(152,190,100);
  text("Score: ", 520, 10);
  text(score, 555, 10);
  
  text("Lives: ", 10, 10);
  text(lives, 40, 10);
  rect(mouseX, paddleYpos, 100, 10);
  
   // Update the position of the shape
  xpos = xpos + ( xSpeedOfBall * xDirectionOfBall );
  ypos = ypos + ( ySpeedOfBall * yDirectionOfBall );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width - 15 || xpos < rad) {
    xDirectionOfBall *= -1;
  }
  if (ypos > height - 10 || ypos < rad) {
    yDirectionOfBall *= -1;
  }
  
  //If tghe ball hits the bottom, decrement a life. 
  if(ypos > height - 10){
    //yDirectionOfBall *= -1;
    lives--;
  }
  
  //Checks if the ball hits the paddle
  if(xpos >= mouseX && xpos <= mouseX+100 && ypos > 550 && ypos < 555){
    yDirectionOfBall *= -1;
    score++;      //The score increments when the hits the paddle
    
    //The ball gets faster when it hits the paddle
    ySpeedOfBall += 0.5;
    xSpeedOfBall += 0.5;
  }
  
  
  if(lives == 0){
    xSpeedOfBall = 0;
    ySpeedOfBall = 0;
  }
   
   System.out.println("ypos: " + ypos + " xpos: " + xpos);
  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}
