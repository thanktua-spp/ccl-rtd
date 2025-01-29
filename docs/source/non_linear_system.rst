Non Linear System
=================

.. _installation:

Equation
------------

.. math:: 3x_1 - \cos(x_2 x_3) - \frac{1}{2} = 0
.. math:: x_1^2 - 81(x_2+0.1)^2 + \sin(x_3) + 1.06 = 0
.. math:: e^{x_1x_2} + 20x_3 + \frac{10\pi-3}{3} = 0
.. math:: x = [0.1, 0.1, -0.1]^T


Code for the Solution
----------

You can use tabs to display code in multiple languages. For example:

.. tabs::

   .. tab:: CCL-Maths

      This is how to write code in CCL-Maths.

      .. code-block:: C#

         // import libraries
         using CypherCrescent.MathematicsLibrary;
         using System;
         using static System.Math;
         using static MathsChart.Chart;

         // define the lambda function handle
         ColVec fun(ColVec x)
         {
             double[] res;
             double x1 = x[0], x2 = x[1], x3 = x[2];
             res = [3 * x1 - Cos(x2 * x3) - 0.5,
                    x1*x1 - 81*Pow(x2 + 0.1, 2) + Sin(x3) + 1.06,
                    Exp(x1 * x3) + 20 * x3 + (10 * PI - 3) / 3];
             return res;
         };
            
         // set initial guess
         double[] x0 = [0.1, 0.1, -0.1];
         
         // call the solver
         var x = Solvers.FSolve(fun, x0);

         # Output: 
                     0.5000
                     0.0000
                    -0.5236

   .. tab:: Python

      This is how to write code in Python.

      .. code-block:: python

         import lumache
         lumache.get_random_ingredients()
         # Output: ['shells', 'gorgonzola', 'parsley']

   .. tab:: Matlab

      .. code-block:: matlab

         % define the function handle
         f = @(x)[3*x(1) - cos(x(2)*x(2)) - 1/2;
                  x(1)^2 - 81(x(2)+0.1)^2 + sin(x(3)) + 1.06;
                  e^(x(1)*x(2)) + 20*x(3) + (10*pi-3)/3];
         
         % set initial guess
         x0 = [0.1; 0.1; -0.1];

         % call the solver
         x = fsolve(f, x0);