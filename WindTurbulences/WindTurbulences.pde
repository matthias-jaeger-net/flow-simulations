/**
 * 
 * WindTurbulences | Copyright (C) 2018 Matthias Jäger - http://matthias-jaeger.net
 * 
 * A basic simulation, where particles are pushed by forces, creating 
 * graphical, wind-linke patterns on the screen. This program uses two classes 
 * representing the ideas of a field of forces and a system of particles.
 * 
 * MIT License: https://opensource.org/licenses/MIT
 * Tutorial by Daniel Shiffmann: https://www.youtube.com/watch?v=XXEK3UEDDIg
 */

Forcefield forcefield;
ParticleSystem particlesystem;

void setup() {
  // Define rendering size 
  size(900, 600);

  //fullScreen();
  
  // A 10 px sized grid of forces
  forcefield = new Forcefield(100);

  // A particlesystem with 6500 particles
  particlesystem = new ParticleSystem(6500);
}

void draw() {
  // Clear background with a nice color
  // background(120, 30, 255);
  background(255);
  
  // Run systems
  forcefield.run();
  particlesystem.run();
}
