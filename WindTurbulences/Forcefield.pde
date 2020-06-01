/**
 * A Forcefield creates, updates and renders individual Force objects.
 * The forces are organized as a regular grid, defined by a given cellsize.
 * 
 * It uses an ArrayList to store references of single Force objects,
 * and has a run() method, calling the required methods for each Force 
 * in the list. 
 */

public class Forcefield {
  ArrayList<Force> forces;
  int cellsize;

  Forcefield(int c) {
    // Make a empty list of objects of the the type <Force> 
    forces = new ArrayList<Force>();

    // Store the given size in a variable called cell
    cellsize = c;

    // Create the grid
    int rows = width / cellsize;
    int cols = height / cellsize;

    for (int a = 0; a < rows; a++) {
      for (int b = 0; b < cols; b++) {
        float x = a * cellsize;
        float y = b * cellsize;
        // After the position is calculated 
        // a new force is  added to the list
        forces.add(new Force(x, y));
      }
    }
  }

  void run() {
    // For all Force objects in the list of forces call the methods update() and render()
    for (Force f : forces) {
      f.update();
      f.render();
    }
  }
}