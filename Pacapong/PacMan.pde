public class PacMan {
  private int x, y, time, speed;
  private Paddle owner;
  private String direction, lastCommand;

  public PacMan(int x, int y, Paddle owner) {
    this.x = x;
    this.y = y;
    this.owner = owner;
    if (owner.getX() < 150) {
      direction = "RIGHT";
    } else if (owner.getX() > 650) {
      direction = "LEFT";
    }
    time = millis();
    speed = 3;
    lastCommand = new String();
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public Paddle getOwner() {
    return owner;
  }

  public void setOwner(Paddle owner) {
    this.owner = owner;
    time = millis();
    if (owner.getX() < 150) {
      direction = "RIGHT";
    } else if (owner.getX() > 650) {
      direction = "LEFT";
    }
  }

  public String getDirection() {
    return direction;
  }

  public void setLast(String last) {
    lastCommand = last;
  }

  public String getLast() {
    return lastCommand;
  }

  public void setDirection(String dir) {
    if (millis() >= time + 1000 && millis() <= 60000) {
      direction = dir;
    }
  }

  public void display() {
    fill(owner.getColor());

    float offset = (int)((millis() - time) / 50.0 % 4);
    if (offset == 1 || offset == 3) {
      offset = PI/6;
    } else if (offset == 2) {
      offset = PI/3;
    }

    if (direction.equals("RIGHT")) {
      arc(x, y, 16, 16, offset, TWO_PI - offset);
    } else if (direction.equals("LEFT")) {
      arc(x, y, 16, 16, 0, PI - offset);
      arc(x, y, 16, 16, PI + offset, TWO_PI);
    } else if (direction.equals("UP")) {
      arc(x, y, 16, 16, 0, 3*HALF_PI - offset);
      arc(x, y, 16, 16, 3*HALF_PI + offset, TWO_PI);
    } else if (direction.equals("DOWN")) {
      arc(x, y, 16, 16, 0, HALF_PI - offset);
      arc(x, y, 16, 16, HALF_PI + offset, TWO_PI);
    }

    if (millis() >= time + 1000) {
      if ((x < 166 || x > 634) && (y - 50) % 18 != 0) {
        if ((y - 68) % 36 < 18) {
          y -= (y - 68) % 36;
        } else {
          y += 36 - (y - 68) % 36;
        }
        if ((x - 166) % speed != 0) {
          x -= (x - 166) % speed;
        }
      }

      if (millis() <= 60000) {
        if (direction.equals("RIGHT")) {
          x += speed;
        } else if (direction.equals("LEFT")) {
          x -= speed;
        } else if (direction.equals("UP")) {
          y -= speed;
        } else if (direction.equals("DOWN")) {
          y += speed;
        }
      }
    } else {
      if (owner.getX() < 150) {
        x = owner.getX() + 10;
      } else if (owner.getX() > 650) {
        x = owner.getX() - 10;
      }
      y = owner.getY();
    }
  }
}

