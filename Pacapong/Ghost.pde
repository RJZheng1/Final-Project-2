public class Ghost {
  private int x, y, time, speed;
  private String direction;
  private boolean weak, dead;

  public Ghost(int x, int y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
    speed = 1;
  }

  public int getX() {
    return x;
  }

  public int getY() {
    return y;
  }

  public String getDirection() {
    return direction;
  }

  public void setDirection(String direction) {
    this.direction = direction;
  }

  public void makeWeak() {
    weak = true;
    time = millis();
    if ((x - 166) % speed != 0) {
      x -= (x - 166) % speed;
    }
    if ((y - 50) % speed != 0) {
      y -= (y - 50) % speed;
    }
  }

  public boolean isWeak() {
    return weak || dead;
  }

  public boolean kill() {
    if (dead != true) {
      dead = true;
      return true;
    } else {
      return false;
    }
  }

  public void display() {
    if (millis() - time >= 2000) {
      weak = false;
      speed = 2;
      if ((x - 166) % speed != 0) {
        x -= (x - 166) % speed;
      }
      if ((y - 50) % speed != 0) {
        y -= (y - 50) % speed;
      }
    }
    if (!dead) {
      if ((millis()/100)%2 == 0) {
        if (!weak) {
          image(loadImage("ghost1normal.png"), x, y);
        } else {
          image(loadImage("ghost1weak.png"), x, y);
        }
      } else {
        if (!weak) {
          image(loadImage("ghost2normal.png"), x, y);
        } else {
          image(loadImage("ghost2weak.png"), x, y);
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
    }
  }
}

