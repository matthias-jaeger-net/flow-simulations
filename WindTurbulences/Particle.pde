/**
 * A single Particle, is defined by a vector of position, a velocity and and acceleration.
 */

public class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  boolean life = true;
  int radius = 3;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    acceleration = new PVector(0, 0);
    // Wind is blowing form left to right 
    velocity = new PVector(10, 0);
  }

  void follow() {
    // Is called every frame and looks at all the Forces in the field 
    for (Force f : forcefield.forces) {
      // Calculate the distance between this particle and all the forces
      float d = position.dist(f.position);
      // Only be affected by a close one
      if (d < forcefield.cellsize) {
        // Calculate a directional force vector from its rotatation angle
        PVector fo = PVector.fromAngle(f.angle);
        // Reduce the force quite a bit
        fo.mult(0.01);
        // Add the force to the velocity
        acceleration.add(fo);
      }
    }
  }

  void edges() {
    // Detects the edges of the window
    if (position.x > width) {
      life = false;
    } 
    if (position.y > height) {
      life = false;
    } else if (position.y < 0) {
      life = false;
    }
  }

  void update() {
    // Physics engine
    velocity.add(acceleration);
    position.add(velocity);
  }

  void render() {
    // Renders the Particle a a point
    pushMatrix();
    translate(position.x, position.y);
    //stroke(map(acceleration.mag(), 0, 10, 255, 0), 10, 100, 6);
    stroke(0);
    strokeWeight(radius);
    point(0, 0);
    popMatrix();
  }
}
