/**
 * A ParticleSystem creates, updates and renders individual Particle objects.
 * 
 * It uses an ArrayList to store references of single Particle objects,
 * and has a run() method, calling the required methods for each particle 
 * in the list. Here is a better exapmle, explaining the concepts: 
 * https://processing.org/examples/simpleparticlesystem.html
 */

public class ParticleSystem {

  ArrayList<Particle> particles;

  ParticleSystem(int ammount) {
    // Make a empty list of objects of the the type <Particle> 
    particles = new ArrayList<Particle>();

    // Add particles to the list, based on the given ammount
    for (int n = 0; n < ammount; n++) {
      particles.add(new Particle(random(-500, 0), random(height)));
    }
  }
 
  void run() {
    // Updates and renders each particle in the list 
    for (int i = particles.size() - 1; i >= 0; i--) {

      // For a single Particle part in the list of particles
      Particle part = particles.get(i);

      // Follow the forces in the field
      part.follow();
      // Check if the particle is on the screen
      part.edges();
      // Update the position
      part.update();
      // And render it on stage
      part.render();

      // Unless it is dead
      if (part.life == false) {
        // Then remove it from the list
        particles.remove(i);
        // And add a new particle instead (left outside of the screen)
        particles.add(new Particle(random(-500, 0), random(height)));
      }
    }
  }
}