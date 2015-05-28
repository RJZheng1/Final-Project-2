public class PacMan {
  private int x, y, time;
  private Paddle owner;
  private String direction;

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

  public void display() {
<<<<<<< HEAD
    fill(owner.getColor());
    arc(x, y, 20, 20, 0, TWO_PI);
<<<<<<< HEAD
    if (millis() >= time + 1000) {
=======
    if (millis() > time) {
>>>>>>> brian
      if (owner.getX() < 150) {
=======
    fill(owner.getColor());     
    float offset = pow((millis() - time)/50.0%3, 1.5) * PI/10;
    if (direction.equals("RIGHT")) {
      arc(x, y, 20, 20, offset, TWO_PI - offset);
    } else if (direction.equals("LEFT")) {
      arc(x, y, 20, 20, 0, PI - offset);
      arc(x, y, 20, 20, PI + offset, TWO_PI);
    } else if (direction.equals("UP")) {
      arc(x, y, 20, 20, 0, HALF_PI - offset);
      arc(x, y, 20, 20, HALF_PI + offset, TWO_PI);
    } else if (direction.equals("DOWN")) {
      arc(x, y, 20, 20, 0, 3*HALF_PI - offset);
      arc(x, y, 20, 20, 3*HALF_PI + offset, TWO_PI);
    }

    if (millis() >= time + 1000) {
      if (direction.equals("RIGHT")) {
>>>>>>> 94eb32c5d2d63bed58582068fb3ecdb6b7c404e3
        x += 2;
      } else if (direction.equals("LEFT")) {
        x -= 2;
      } else if (direction.equals("UP")) {
        y -= 2;
      } else if (direction.equals("DOWN")) {
        y += 2;
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

