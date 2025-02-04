Integrators
------------------------------


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
             double integral = Integrators.GaussLeg(f, x_1, x_2);
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
             double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
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
             double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
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
             double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
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
             double integral = Integrators.GaussLeg2(f, x_1, x_2, y_1, y_2);
             // Print the result
             Console.WriteLine($"The integral is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a rectangular cuboid region using adaptive Gauss-Legendre quadrature.  All bounds are constants.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the lower bound of y
             double y_1 = 1;
             // Set the upper bound of y
             double y_2 = 2;
             // Set the lower bound of z
             double z1 = 2;
             // Set the upper bound of z
             double z2 = 3;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z1, z2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Set the upper bound of y
             double y_2 = 2;
             // Set the lower bound of z
             double z_1 = 2;
             // Set the upper bound of z
             double z_2 = 3;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by a constant and a function of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => x * x;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Set the lower bound of y
             double y_1 = 1;
             // Set the lower bound of z
             double z_1 = 2;
             // Set the upper bound of z
             double z_2 = 3;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => Math.Sqrt(x);
             // Set the lower bound of z
             double z_1 = 2;
             // Set the upper bound of z
             double z_2 = 3;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, the lower z-bound is a function of x and y, and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Set the upper bound of y
             double y_2 = 2;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Set the upper bound of z
             double z_2 = 3;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the lower z-bound is a function of x and y, and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Set the upper bound of y
             double y_2 = 2;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Set the upper bound of z
             double z_2 = 3;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the lower y-bound is a constant, the upper y-bound is a function of x, the lower z-bound is a function of x and y and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
          <code>
             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
              // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
              // Set the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => x * x;
              // Set the lower bound of y 
             double y_1 = 1;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Set the upper bound of z
             double z_2 = 3;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2,y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");
          </code>


   GaussLeg3::
      Description:  Computes the definite triple integral of a function, where the y-bounds are functions of x and the lower z-bound is a function of x and y and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
          <code>
             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => Math.Sqrt(x);
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Set the upper bound of z
             double z_2 = 3;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");
          </code>


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by constants, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Set the lower bound of y
             double y_1 = 1;
             // Set the upper bound of y
             double y_2 = 2;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Define the upper bound of z as a function of x and y
             Func<double, double, double> z_2 = (x, y) => x + y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x for the lower bound and a constant for the upper bound, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Set the upper bound of y
             double y_2 = 2;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Define the upper bound of z as a function of x and y
             Func<double, double, double> z_2 = (x, y) => x + y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the lower y-bound is constant, the upper y-bound is a function of x, and the z-bounds are functions of x and y, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => x * x;
             // Set the lower bound of y
             double y_1 = 1;
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Define the upper bound of z as a function of x and y
             Func<double, double, double> z_2 = (x, y) => x + y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLeg3::
      Description:  Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
          Example usage: Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: C# 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using System;
         
             // Define the function to integrate
             Func<double, double, double, double> f = (x, y, z) => x * y * z;
             // Define the lower bound of y as a function of x
             Func<double, double> y_1 = (x) => x * x;
             // Define the upper bound of y as a function of x
             Func<double, double> y_2 = (x) => Math.Sqrt(x);
             // Define the lower bound of z as a function of x and y
             Func<double, double, double> z_1 = (x, y) => x * y;
             // Define the upper bound of z as a function of x and y
             Func<double, double, double> z_2 = (x, y) => x + y;
             // Set the lower bound of x
             double x_1 = 0;
             // Set the upper bound of x
             double x_2 = 1;
             // Calculate the integral
             double integral = Integrators.GaussLeg3(f, x_1, x_2, y_1, y_2, z_1, z_2);
             // Print the result
             Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");


   GaussLag::
      Description:  Integration via Gause Laguerre method


   GaussHer::
      Description:  Integration via Gause Hermite method


   GaussChebf::
      Description:  Ingerates a function using the Gauss Chebyshev method


   GaussChebg::
      Description:  Ingerates a function using the Gauss Chebyshev method
