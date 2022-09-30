// Sound Files
import processing.sound.*;
SoundFile Alarm;
SoundFile CallOff;

PFont braille;
PFont arial;
boolean clickUp = false;
boolean clickDown = false;
boolean call = false;
int doorStatus = 0;
int currentFloor = 1;
int time = millis();

void setup() {
  // Creates the interface and its color, touch screen, and braille for each button.
  size(800, 1100);
  background(128);
  rect(100, 100, 600, 775);
  
  braille = createFont("BRAILLE.ttf", 35);
  fill(0);
  textFont(braille);
  textSize(60);

  text("$2", 10, 380);
  text("1", 50, 550);
  text("$B", 10, 680);
  textSize(40);
  
  // Braille did not have the full word in the original elevator, so I kept it that
  // way for mine for consistency.
  text("ope", 250, 935);
  text("close", 425, 935);
  text("alar", 18, 1025);
  text("phon", 655, 1025);
  
  // Sound for the alarm and call button
  Alarm = new SoundFile(this, "arcadeAlarm.mp3");
  CallOff = new SoundFile(this, "callOff.mp3");
  
  
  // Default text
  arial = createFont("arial.ttf", 40);
  textFont(arial);
}

void draw() {
  // Print mouse position; debugging
  // println(mouseX + " : " + mouseY);
  
  // This section creates the text and buttons for the interface.
  textSize(50);
  fill(0);
  text("Welcome to Holden Hall!", 130, 200);
  textSize(40);
  text("Please make a selection.", 180, 250);
  textSize(20);
  text("Current Floor: ", 375, 300);
  fill(255, 51, 51);
  
  // Shows current floor
  if (currentFloor == 1) {
    fill(255);
    rect(505, 280, 25, 25);
    fill(255, 51, 51);
    text(currentFloor, 512, 300);
  }
  else if (currentFloor == 2) {
    fill(255);
    rect(505, 280, 25, 25);
    fill(255, 51, 51);
    text(currentFloor, 512, 300);
  }
  else {
    fill(255);
    rect(505, 280, 25, 25);
    fill(255, 51, 51);
    text("B", 512, 300);
  }
  
  textSize(40);
  fill(186, 219, 255); // Light blue color
  strokeWeight(2);
  rect(200, 290, 100, 100, 10); // 2 Button
  rect(200, 440, 100, 100, 10); // 1 Button
  rect(200, 590, 100, 100, 10); // B Button
  fill(0, 204, 0); // Green color
  rect(250, 740, 100, 100, 10); // Door Open Button
  fill(255, 51, 51); // Red color
  rect(450, 740, 100, 100, 10); // Door Close Button
  fill(255, 255, 51); // Yellow color
  circle(200, 1000, 100); // Alarm button
  circle(590, 1000, 100); // Phone Button
  fill(255); // White Color
  
  // Flash the call received display when call button is pushed.
  int passedMillis = millis() - time;
  if (call == true) {
    if(passedMillis >= 215) {
      time = millis();
      fill(255, 51, 51);
    }
    else {
      fill(255);
    }
  }
  
  circle(450, 1000, 100); // Call received display
  
  // This section creates the number for the 2nd floor button.
  fill(0);
  textSize(50);
  text("2", 238, 360);
  
  // This section creates a star for the 1st floor button.
    push();
    translate(250, 495); // Center of the star
    fill(255, 255, 51);
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    scale(0.9);
    endShape(CLOSE);
    pop();

    text("1", 235, 510);
    text("B", 235, 655);
    textSize(30);
    text("Door", 268, 775);
    text("Open", 265, 815);
    text("Door", 470, 775);
    text("Close", 465, 815);
    textSize(20);
    
    // Controls door status.
    text("Door Status:", 110, 775);
    if(doorStatus == 0) {
      fill(255);
      rect(110, 800, 100, 25);
      fill(255, 51, 51);
      text("CLOSED", 120, 820);
    }
    else {
      fill(255);
      rect(110, 800, 100, 25);
      fill(0, 204, 0);
      text("OPEN", 135, 820);
    }
    
    // int passedSecs = millis();
    //if (clickUp == true) {
    //  fill(255, 51, 51);
    //  translate(425, 300);
    //  scale(0.5);
    //  triangle(120, 300, 232, 80, 344, 300);
    //  if(passedSecs >= 6000) {
    //    // time = millis();
    //    fill(255);
    //    translate(425, 300);
    //    scale(0.5);
    //    triangle(120, 300, 232, 80, 344, 300);
    //    passedSecs = 0;
    //    clickUp = false;
    //  }
    //}
    
    // int passedSecs = millis();
    // Up arrow
    push();
    if (clickUp == true) {
      fill(255, 55, 51);
    }
    else {
      fill (255);
    }
    translate(425, 300);
    scale(0.5);
    triangle(120, 300, 232, 80, 344, 300);
    pop();
    
    // Down arrow
    push();
    if (clickDown == true) {
      fill(255, 55, 51);
    }
    else {
      fill(255);
    }
    translate(657, 675);
    rotate(PI);
    scale(0.5);
    triangle(120, 300, 232, 80, 344, 300);
    pop();
    
    textSize(25);
    fill(255, 0, 0); // Bright red color
    text("ALARM", 158, 1010);
    text("PHONE", 545, 1010);
    fill(0);
    textSize(10);
    text("CALL RECEIVED", 410, 990);
    text("WHEN FLASHING", 405, 1010);
    textSize(30);
    // rect(540, 950, 100, 100);
}

boolean isMouseOver(int x, int y, int w, int h) {
  if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    return true;
  }
  return false;
}

void mouseClicked() {
  // User MUST CLOSE THE DOOR before moving floors
  if (doorStatus == 0) {
    // Highlight 2nd floor if not already there
    if(isMouseOver(200, 290, 100, 100) == true && currentFloor < 2) {
      clickUp = true;
      currentFloor = 2;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    // On 2nd floor, can't go further up
    else if(isMouseOver(200, 290, 100, 100) == true && currentFloor == 2) {
      clickUp = false;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    
    // User is on 1st floor by default
    if(isMouseOver(200, 440, 100, 100) == true && currentFloor == 2) {
      clickDown = true;
      currentFloor = 1;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    // Already on 1st floor, do not move.
    else if(isMouseOver(200, 440, 100, 100) == true && currentFloor == 1) {
      clickUp = false;
      clickDown = false;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    // Move to 1st floor from basement.
    else if(isMouseOver(200, 440, 100, 100) == true && currentFloor == 0) {
      clickUp = true;
      currentFloor = 1;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    
    // Basement Button
    if(isMouseOver(200, 590, 100, 100) == true && currentFloor > 0) {
      clickDown = true;
      currentFloor = 0;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
    // Can't go down further than basement level
    else if(isMouseOver(200, 590, 100, 100) == true && currentFloor == 0) {
      clickDown = false;
      fill(255);
      strokeWeight(0);
      rect(430, 460, 260, 50);
    }
  }
  
  else if (isMouseOver(200, 290, 100, 100) == true || isMouseOver(200, 440, 100, 100) == true || isMouseOver(200, 590, 100, 100) == true){
    textSize(14);
    text("Door must be closed before proceeding.", 430, 490);
  }
  
  // Alarm button sound
  if (isMouseOver(150, 950, 100, 100) == true) {
    if(!Alarm.isPlaying()) {
      Alarm.play();
    }
  }
   
  // Call button sound and effect
  if(isMouseOver(540, 950, 100, 100) == true && call == false) {
    call = true;
    if(!Alarm.isPlaying()) {
      Alarm.play();
    }
  }
  
  else if (isMouseOver(540, 950, 100, 100) == true && call == true) {
    call = false;
    CallOff.play();
  }
  
  // Door Open Button
  if(isMouseOver(250, 740, 100, 100) == true && doorStatus == 0) {
    doorStatus = 1;
  }
  
  // Door Close Button
  if(isMouseOver(450, 740, 100, 100) == true && doorStatus == 1) {
    doorStatus = 0;
  }
}
