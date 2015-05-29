import java.util.*;

private Paddle left, right;
private PacMan p;
private boolean keyUp, keyDown, keyLeft, keyRight, keyW, keyS, keyA, keyD;
private char[][] map;

public void setup() {
  size(800, 450);
  background(23, 32, 49);
  left = new Paddle(color(249, 187, 126), 75, 225);
  right = new Paddle(color(211, 105, 106), 725, 225);
  p = new PacMan(85, 225, left);
  map = new char[20][16];
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  map("map.txt");
}

public void keyPressed() {
  if (keyCode == 38) {
    keyUp = true;
  }
  if (keyCode == 40) {
    keyDown = true;
  }
  if (keyCode == 37) {
    keyLeft = true;
  }
  if (keyCode == 39) {
    keyRight = true;
  }
  if (keyCode == 87) {
    keyW = true;
  }
  if (keyCode == 83) {
    keyS = true;
  }
  if (keyCode == 65) {
    keyA = true;
  }
  if (keyCode == 68) {
    keyD = true;
  }
}

public void keyReleased() {
  if (keyCode == 38) {
    keyUp = false;
  }
  if (keyCode == 40) {
    keyDown = false;
  }
  if (keyCode == 37) {
    keyLeft = false;
  }
  if (keyCode == 39) {
    keyRight = false;
  }
  if (keyCode == 87) {
    keyW = false;
  }
  if (keyCode == 83) {
    keyS = false;
  }
  if (keyCode == 65) {
    keyA = false;
  }
  if (keyCode == 68) {
    keyD = false;
  }
}

public void move() {
  if (keyW && left.getY() >= 75) {
    left.move(0, -2);
  }
  if (keyS && left.getY() <= 375) {
    left.move(0, 2);
  }
  if (keyA && left.getX() >= 20) {
    left.move(-2, 0);
  }
  if (keyD && left.getX() <= 140) {
    left.move(2, 0);
  }
  if (keyUp && right.getY() >= 75) {
    right.move(0, -2);
  }
  if (keyDown && right.getY() <= 375) {
    right.move(0, 2);
  }
  if (keyLeft && right.getX() >= 660) {
    right.move(-2, 0);
  }
  if (keyRight && right.getX() <= 780) {
    right.move(2, 0);
  }
}

public void draw() {
  background(23, 32, 49);
  map("map.txt");
  left.display();
  right.display();
  p.display();
  move();
  if (p.getOwner() != left) {
    if (p.getX() - left.getX() <= 10 && p.getX() - left.getX() >= 0 && abs(p.getY() - left.getY()) <= 45) {
      p.setOwner(left);
    }
  } else if (p.getOwner() != right) {
    if (right.getX() - p.getX() <= 10 && right.getX() - p.getX() >= 0 && abs(p.getY() - right.getY()) <= 45) {
      p.setOwner(right);
    }
  }
  if (p.getX() >= 800) {
    p.setOwner(left);
  } else if (p.getX() <= 0) {
    p.setOwner(right);
  }
}

  public void map(String filename){
      int x = 210;
      int y = 75;
      Scanner scan = new Scanner(filename);
      String line = "";
      while(scan.hasNextLine()){
        line = scan.nextLine();
        for(int i=0;i<line.length();i++){
          if(line.substring(i,i+1).equals("#")){
            fill(153);
            rect(x,y,19,19);
          }else if(line.substring(i,i+1).equals(" ")){
            fill(153);
            ellipse(x,y,5,5);
          }
          x+=20;
        }
        y+=20;
      }
            
  }

