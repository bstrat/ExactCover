ExactCover
==========

A implementation of [Algorithm X](http://en.wikipedia.org/wiki/Knuth%27s_Algorithm_X) 
in [CoffeeScript](http://coffeescript.org/) - heavily inspired by
[Ali Assaf's Python implementation](http://www.cs.mcgill.ca/~aassaf9/python/algorithm_x.html).

The project also contains a [Sudoku](http://en.wikipedia.org/wiki/Sudoku) solver and a class for solving
a specific problem on [Web Sudoku](http://websudoku.com).
For example to solve the first "Hard" problem on the command line you can:

    cake -i 1 -l Hard websudoku

If you have [jasmine-node](https://github.com/mhevery/jasmine-node) available in your [Node](http://nodejs.org)
installation you are able to run the [Jasmine](http://pivotal.github.io/jasmine) specs using:

    cake jasmine
