

Integrators::
   Description:  Performs numerical evaluation of definite integration of functions


   Trapz::
      Description:  Performs numerical integration using Trapezoidal method


   CumTrapz::
      Description:  Performs cummulative integratio of y over x


   Trapz::
      Description:  Performs numerical interation of a function using trapezoidal method


   Trapz::
      Description:  Performs numerical interation of a complex function using trapezoidal method


   Simps::
      Description:  Performs numerical integration using Simpson's method


   Simps::
      Description:  Performs numerical interation of a function using Simpson's method


   Simps::
      Description:  Performs numerical interation of a complex function using Simpson's method


   Simps38::
      Description:  Performs numerical integration using Simpson's 3-8 method


   Simps38::
      Description:  Performs numerical interation of a function using Simpson's 3-8 method


   Simps38::
      Description:  Performs numerical interation of a complex function using Simpson's 3-8 method


   GaussLeg::
      Description:  Computes the definite integral of a function using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x) = x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} x^2 \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double> f = (x) => x * x;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = GaussLeg(f, x_1, x_2);
             // Print the result
             Console.WriteLine($"The integral of x^2 is approximately: {integral}");


   GaussLeg2::
      Description:  Computes the definite double integral of a function over a rectangular region using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y) = x * y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2} x y \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double> f = (x, y) => x * y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the lower bound of y
             double y_1 = 1;
             // Set the upper bound of y
             double y_2 = 2;
             // Calculate the integral
             double integral = GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral of x*y is approximately: {integral}");


   GaussLeg2::
      Description:  Computes the definite double integral of a function over a region where the y-bounds are defined by a function and a constant, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from x^2 to 2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2} x y \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double> f = (x, y) => x * y;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the upper bound of y
             double y_2 = 2;
             // Calculate the integral
             double integral = GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral is approximately: {integral}");


   GaussLeg2::
      Description:  Computes the definite double integral of a function over a region where the y-bounds are defined by a constant and a function, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from 1 to x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)} x y \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double> f = (x, y) => x * y;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => x * x;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the lower bound of y
             double y_1 = 1;
             // Calculate the integral
             double integral = GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral is approximately: {integral}");


   GaussLeg2::
      Description:  Computes the definite double integral of a function over a region where both y-bounds are defined by functions of x, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)} x y \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double> f = (x, y) => x * y;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => Math.Sqrt(x);
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral is approximately: {integral}");


   GaussLag::
      Description:  Integration via Gause Laguerre method


   GaussHer::
      Description:  Integration via Gause Hermite method


   GaussChebf::
      Description:  Ingerates a function using the Gauss Chebyshev method


   GaussChebg::
      Description:  Ingerates a function using the Gauss Chebyshev method
