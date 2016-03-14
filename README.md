Maze Generator
=============

Very simple maze generator using a backtracting algorythm inspired by
* http://weblog.jamisbuck.org/2010/12/27/maze-generation-recursive-backtracking
* https://rosettacode.org/wiki/Maze_generation#Ruby

Once generated a maze can be saved/loaed to/from a database.
I aimed at decoupling cell/grid concerns by providing a Cell API rather then juggling with arrays an index in a ```Maze``` and a ```MazeSolver``` class

I did not get around doing the solver class but i would have use the cannonical breadth first search algortthm.

The main challenge were:
* testing randomly initialised objects.
* storing the state of the cells and grid such that it is easy to serialize and deserialize the maze between each requests, hence the use of bitmasking to store connections between cells
