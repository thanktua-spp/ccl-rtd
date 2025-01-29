Ordinary Differential Equation
==============================

Ordinary Differential Equations (ODEs) are equations that relate a function to its derivatives. In simpler terms, they describe how a quantity changes with respect to another. These equations are fundamental in various fields of science and engineering, from physics and biology to economics and finance.   

Key Concepts:
    1. Independent Variable: The variable that the function depends on (often denoted by x or t).   
    2. Dependent Variable: The function itself (often denoted by y).
    3. Derivative: The rate of change of the dependent variable with respect to the independent variable.   
    
Why are ODEs important?
    ODEs provide a powerful framework for modeling real-world phenomena. 

They can help us understand:   
    * Growth and Decay: Population growth, radioactive decay, and chemical reactions.
    * Motion: The movement of objects under the influence of forces (Newton's laws of motion).   
    * Electrical Circuits: The flow of current and voltage in circuits.   
    * Heat Transfer: The distribution of heat in a material.   
    
Types of ODEs:
    * First-Order ODEs: Involve only the first derivative of the function.
    * Higher-Order ODEs: Involve second, third, or higher-order derivatives.   
    * Linear ODEs: Have terms containing only linear combination of the function and its derivatives.   
    * Nonlinear ODEs: Have terms containing nonlinear combination of the function and its derivatives.
    
Solving ODEs:
    Methods for solving ODE falls into two broad categories:
    
    Analytical Methods:
        - Separation of Variables: For certain first-order ODEs.   
        - Integrating Factors: For linear first-order ODEs.   
        - Laplace Transforms: For linear ODEs. 
  
    Numerical Methods: 
        For complex ODEs that cannot be solved analytically.
    
Visualizing Solutions:
    Solutions to ODEs can often be visualized as curves or trajectories 
    in the plane, providing insights into the behavior of the system 
    being modeled.

   



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

      CCL-maths Implementation

      .. code-block:: C#

         // import libraries
         using System;
         using CypherCrescent.MathematicsLibrary;
         using static System.Math;

         // define the function
         ColVec fun(ColVec x)
         {
             double[] res;
             double x1 = x[0], x2 = x[1], x3 = x[2];
             res = [3 * x1 - Cos(x2 * x3) - 0.5,
                    x1*x1 - 81*Pow(x2 + 0.1, 2) + Sin(x3) + 1.06,
                    Exp(-x1 * x2) + 20 * x3 + (10 * PI - 3) / 3];
             return res;
         };
            
         // set initial guess
         double[] x0 = [0.1, 0.1, -0.1];
         
         // call the solver
         ColVec x = Solvers.FSolve(fun, x0);

         // display the result
         Console.WriteLine(x);

         # Output: 
            0.5000
            0.0000
           -0.5236

   .. tab:: Python

      Python Implementation

      .. code-block:: python

         import numpy as np
         from scipy.optimize import fsolve

         # define function
         def func(x):
             x1 = x[0]; x2 = x[1]; x3 = x[2]; pi = np.pi;
             return [3 * x1 - np.cos(x2 * x3) - 0.5,
                     x1*x1 - 81*(x2 + 0.1)**2 + np.sin(x3) + 1.06,
                     np.exp(-x1 * x2) + 20 * x3 + (10 * pi - 3) / 3]


         # set inigial guess
         x0 = [0.1, 0.1, -0.1]

         # call the solver
         x = fsolve(func, x0)
            
         # display the result
         print(x)

         # Output: 
         [ 5.00000000e-01  1.38102142e-13 -5.23598776e-01]

   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         f = @(x)[3*x(1) - cos(x(2)*x(2)) - 1/2;
                  x(1)^2 - 81*(x(2)+0.1)^2 + sin(x(3)) + 1.06;
                  exp(x(1)*x(2)) + 20*x(3) + (10*pi-3)/3];
         
         % set initial guess
         x0 = [0.1; 0.1; -0.1];

         % call the solver
         x = fsolve(f, x0);

         % display the result
         disp(x);

         # Output: 

             0.5000
             0.0000
            -0.5236


.. figure:: images/github-template.png
   :width: 80%
   :align: center
   :alt: GitHub template for the tutorial

   GitHub template for the tutorial