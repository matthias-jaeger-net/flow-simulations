/**
 * A single Force object is defined by a vector of position and an angle of rotation.
 * The position stays the same, while the angle is calculated and changes over time.
 */

public class Force {
  PVector position;
  float angle;

  Force(float x, float y) {
    // Is called, when a Force is added in the field. 
    // Creating a PVector object with the given coordinates.
    position = new PVector(x, y);
  }

  void update() {
    // Is called every frame and calculates the angle, based on the distance to the mouse location.
    float x1 = position.x;
    float y1 = position.y;
    float x2 = mouseX;
    float y2 = mouseY;

    // Calculate the distance between both
    float d = dist(x1, y1, x2, y2);

    // Calculate maximum distance
    float maximum = sqrt(pow(width, 2) + pow(height, 2));

    // Map the angle, ranging from 0 to TAU (360 deg) to the distance
    angle = map(d, 0, maximum, 0, TAU);
  }

  void render() {
    // Is called every frame and renders a white line in the correct position and the correct angle.
    pushMatrix();
    translate(position.x, position.y);
    rotate(angle);
    strokeWeight(1);
    line(0, 0, forcefield.cellsize/2, 0);
    popMatrix();
  }
}
