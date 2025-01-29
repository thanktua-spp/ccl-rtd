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

   



First Order ODE
---------------
Consider :math: `y' = 2(a - t)y^2`

.. math:: \frac{dy}{dt} = 2(a - t)y^2;
.. math:: a = 0.25; y_0 = 15.9; t = [0, 1]

.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using CypherCrescent.MathematicsLibrary;
         using static MathsChart.Chart;

         // define the ODE
         double a = 0.25;
         double dydt(double t, double y) => 2 * (a - t) * y * y;

         // set initial condition
         double y0 = 15.9;

         // set time span
         double[] t_span = [0, 1] 

         // solve ODE 
         Ode.Result result = Ode.Ode23(dydt, y0, t_span);

         // plot the result
         var plt = Plot(result.X, result.Y, "-o");
         plt.XLabel = "t";
         plt.YLabel = "y";
         plt.Title = "Solving-with-CCLMath-Ode23";
         plt.SaveFig("Solving-with-CCLMath-Ode23.png");
         plt.Show();

      .. figure:: images/Solving-with-CCLMath-Ode23.png
         :align: center
         :alt: Solving-with-CCLMath-Ode23.png
     

   .. tab:: Python

      Python Implementation

      .. code-block:: python

         import numpy as np
         from scipy.integrate import solve_ivp
         import matplotlib.pyplot as plt
         
         # define function
         def dydt(t, y):
           a = 0.25
           return 2 * (a - t) * y **2;
         
         
         # set initial condition
         y0 = [15.9]
         
         # set time span
         t_span = [0, 1] 
         
         # call the solver
         sol = solve_ivp(dydt, t_span, y0)
                     
         # display the result
         plt.plot(sol.t, sol.y[0],  marker='o', linestyle='-')
         plt.xlabel('Time (t)')
         plt.ylabel('y(t)')
         plt.title('Solving-with-Python-Ode23')
         plt.savefig('Solving-with-Python-Ode23.png') 
         plt.show()

      .. figure:: images/Solving-with-Python-Ode23.png
         :align: center
         :alt: Solving-with-Python-Ode23.png


   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         a = 0.25;
         dydt = @(t,y) 2*(a - t)*y^2;
         
         % set initial condition
         y0 = 15.9;
         
         % set time span
         t_span = [0, 1];
         
         % call the solver
         [T, Y] = ode23(dydt, t_span, y0);
         
         % display the result
         plot(T, Y, '-o');
         xlabel('t')
         ylabel('y')
         title('Solving-with-Matlab-Ode23')
         saveas(gcf, 'Solving-with-Matlab-Ode23', 'png')

      .. figure:: images/Solving-with-Matlab-Ode23.png
         :align: center
         :alt: Solving-with-Matlab-Ode23.png

Second Order ODE
---------------
The mathematical model of a simple harmonic oscilator (SHO) results in a second order differential equation:

.. math:: \frac{d^2y}{dt^2} = -4y
.. math:: y_0 = 0; y'_0 = 5; t = [0, 10];

To solve this, we first transform the problem into a system of first order differential equations:

Let

.. math:: v = \frac{dy}{dt}
hence

.. math:: \frac{dv}{dt} = -4y
.. math:: y_0 = 0; v_0 = 5; 
Now we have 2 equations

.. math:: \frac{dy}{dt} = v
.. math:: \frac{dv}{dt} = -4y
.. math:: y_0 = 0; v_0 = 5; 


.. tabs::

   .. tab:: CCL-Math
      CCL-Math Implementation

      .. code-block:: C#
         
         // import libraries
         using CypherCrescent.MathematicsLibrary;
         using static MathsChart.Chart;

         // define the ODE
         ColVec dzdt(double t, ColVec z) 
         {
            double y = z[0], v = z[1];
            double[] dz = [v, -4*y];
            return dz;
         }

         // set initial condition
         double[] z0 = [0, 5];

         // set time span
         double[] t_span = [0, 10];

         // solve ODE 
         Ode.Result result = Ode.Ode45(dzdt, z0, t_span);

         // plot the result
         var plt = Plot(result.X, result.Y, "-o");
         plt.XLabel = "t";
         plt.YLabel = "y";
         plt.Title = "Solving-SHO-with-CCLMath-Ode45";
         plt.Legend = new() { labels = ["y_1", "y_2"], alignment = "lowerright" };
         plt.SaveFig("Solving-SHO-with-CCLMath-Ode45.png");
         plt.Show();

      .. figure:: images/Solving-SHO-with-CCLMath-Ode45.png
         :align: center
         :alt: Solving-SHO-with-CCLMath-Ode45.png
     

   .. tab:: Python

      Python Implementation

      .. code-block:: python

         

      
   .. tab:: Matlab

      Matlab Implementation

      .. code-block:: matlab

         % define the function handle
         dzdt = @(t,z) [z(2); -4*z(1)];
         
         % set initial condition
         z0 = [0, 5];

         % set time span
         t_span = [0, 10];
         
         % call the solver
         [T, Z] = ode45(dzdt, t_span, z0);
         
         % display the result
         plot(T, Z, '-o');
         xlabel('t')
         ylabel('y')
         title('Solving-SHO-with-Matlab-Ode45')
         saveas(gcf, 'Solving-SHO-with-Matlab-Ode45', 'png')

      .. figure:: images/Solving-SHO-with-Matlab-Ode45.png
         :align: center
         :alt: Solving-SHO-with-Matlab-Ode45.png