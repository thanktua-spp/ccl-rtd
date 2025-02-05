Integrators
-----------


Integrators::
   Description: 
       Performs numerical evaluation of definite integration of functions


   GaussLeg::
      Description: 
          Computes the definite integral of a function using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept a double and return a double.
         | x_1:  The lower bound of the integration interval.
         | x_2:  The upper bound of the integration interval.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the definite integral.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration interval.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x) = x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} x^2 \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a rectangular region using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. It is assumed this is a constant.
         | y_2:  The upper bound of the y integration. It is assumed this is a constant.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          The integration is performed over the region defined by x_1 <= x <= x_2 and y_1 <= y <= y_2.
          For best results, the function should be smooth within the integration region.
          If x_1 equals x_2 then the method will return 0. The y bounds are assumed to be constant (y_1 and y_2)
      Example: 
           Integrate the function f(x, y) = x * y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2} x y \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where the y-bounds are defined by a function and a constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration.  This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
          The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_1(x) should be a smooth function.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from x^2 to 2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2} x y \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where the y-bounds are defined by a constant and a function, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
          The integration is performed over the region defined by x_1 <= x <= x_2 and y_1 <= y <= y_2(x).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_2(x) should be a smooth function.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, and y ranges from 1 to x^2, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)} x y \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg2::
      Description: 
          Computes the definite double integral of a function over a region where both y-bounds are defined by functions of x, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept two doubles (x, y) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite double integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the double integral.
          The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2(x).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)} x y \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.ArgumentException is Thrown when y_1(x) is greater than y_2(x) for any x in the interval [x_1, x_2].


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a rectangular cuboid region using adaptive Gauss-Legendre quadrature.  All bounds are constants.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z1:  The lower bound of the z integration. This is a constant value.
         | z2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z1 <= z <= z2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region.
          If x_1 equals x_2 then the method will return 0. All y and z bounds are assumed to be constant.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1 <= z <= z_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_1(x) should be a smooth function. The z bounds are assumed to be constant.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a constant and a function of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1 <= z <= z_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_2(x) should be a smooth function. The z bounds are assumed to be constant.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are constants, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1 <= z <= z_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
          If x_1 equals x_2 then the method will return 0. The z bounds are assumed to be constant.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.ArgumentException is Thrown when y_1(x) is greater than y_2(x) for any x in the interval [x_1, x_2].
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, the lower z-bound is a function of x and y, and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1(x, y) <= z <= z_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, y_1(x) should be a smooth function, and z_1(x, y) should be a smooth function. Also ensure that z_1(x,y) is less than or equal to z_2 within the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x and a constant, and the lower z-bound is a function of x and y, and the upper z-bound is a constant, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  The upper bound of the z integration. This is a constant value.
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1(x, y) <= z <= z_2.
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, y_1(x) and z_1(x, y) should be smooth functions. Additionally, y_1(x) and z_1(x, y) must result in a valid intergration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to 3, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Calculates the integral of a function using a 3-dimensional Gauss-Legendre quadrature method.
      Param: 
         | fun:  A function of three variables to integrate.
         | x_1:  The lower limit of integration for the x variable.
         | x_2:  The upper limit of integration for the x variable.
         | y_1:  The lower limit of integration for the y variable (constant).
         | y_2:  The upper limit of integration for the y variable (constant).
         | z_1:  The lower limit of integration for the z variable (constant).
         | z_2:  A function that provides the upper limit of integration for the z variable based on x and y.
         | eps:  The desired accuracy of the result. Defaults to 1e-6.
      Returns: 
          The approximate value of the integral.
     cref=Exception is 
      Remark: 
          This method uses the Gauss-Legendre quadrature method for numerical integration.
          It iterates up to a maximum number of steps to achieve the desired accuracy.
      Example: 
          This method calculates the integral of a function \( f(x, y, z) \) over a 3-dimensional region defined by the limits [x_1, x_2], [y_1, y_2], and [z_1, z_2(x, y)] using the Gauss-Legendre quadrature method.
         
          
         
          The integral we are trying to calculate is:
         

          .. math::
              \int_{0}^{1} \int_{0}^{1} \int_{0}^{1} \sin(x) \cdot \cos(y) \cdot \exp(z) \, dz \, dy \, dx
         

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Define the function to integrate
             Func<double, double, double, double> func = (x, y, z) => Sin(x) * Cos(y) * Exp(z);
         
             // Perform the integration using GaussLeg3
             double result = GaussLeg3(
                 func,
                 0, 1,                // Integration limits for x
                 0, 1,                // Integration limits for y (constant lower and upper limits)
                 0, (x, y) => 1       // Integration limits for z (constant lower limit and upper limit based on x and y)
             );
         
             // Output the result
             Console.WriteLine("The integral result is: " + result);


   GaussLeg3::
      Description: 
          Calculates the integral of a function using a 3-dimensional Gauss-Legendre quadrature method.
      Param: 
         | fun:  A function of three variables to integrate.
         | x_1:  The lower limit of integration for the x variable.
         | x_2:  The upper limit of integration for the x variable.
         | y_1:  A function that provides the lower limit of integration for the y variable based on x.
         | y_2:  The upper limit of integration for the y variable (constant).
         | z_1:  The lower limit of integration for the z variable (constant).
         | z_2:  A function that provides the upper limit of integration for the z variable based on x and y.
         | eps:  The desired accuracy of the result. Defaults to 1e-6.
      Returns: 
          The approximate value of the integral.
     cref=Exception is 
      Remark: 
          This method uses the Gauss-Legendre quadrature method for numerical integration.
          It iterates up to a maximum number of steps to achieve the desired accuracy.
      Example: 
          This method calculates the integral of a function \( f(x, y, z) \) over a 3-dimensional region defined by the limits [x_1, x_2], [y_1(x), y_2], and [z_1, z_2(x, y)] using the Gauss-Legendre quadrature method.
         
          
         
          The integral we are trying to calculate is:
         

          .. math::
              \int_{0}^{1} \int_{0}^{1} \int_{0}^{1} \sin(x) \cdot \cos(y) \cdot \exp(z) \, dz \, dy \, dx
         

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Define the function to integrate
             Func<double, double, double, double> func = (x, y, z) => Math.Sin(x) * Math.Cos(y) * Math.Exp(z);
         
             // Perform the integration using GaussLeg3
             double result = GaussLeg3(
                 func,
                 0, 1,                // Integration limits for x
                 x => 0, 1,           // Integration limits for y (lower limit based on x and constant upper limit)
                 0, (x, y) => 1       // Integration limits for z (constant lower limit and upper limit based on x and y)
             );
         
             // Output the result
             Console.WriteLine("The integral result is: " + result);
             This example calculates the integral of the function sin(x) * cos(y) * exp(z) over the range [0, 1] for x, y, and z.


   GaussLeg3::
      Description: 
          Calculates the integral of a function using a 3-dimensional Gauss-Legendre quadrature method.
      Param: 
         | fun:  A function of three variables to integrate.
         | x_1:  The lower limit of integration for the x variable.
         | x_2:  The upper limit of integration for the x variable.
         | y_1:  The lower limit of integration for the y variable (constant).
         | y_2:  A function that provides the upper limit of integration for the y variable based on x.
         | z_1:  The lower limit of integration for the z variable (constant).
         | z_2:  A function that provides the upper limit of integration for the z variable based on x and y.
         | eps:  The desired accuracy of the result. Defaults to 1e-6.
      Returns: 
          The approximate value of the integral.
     cref=Exception is 
      Remark: 
          This method uses the Gauss-Legendre quadrature method for numerical integration.
          It iterates up to a maximum number of steps to achieve the desired accuracy.
      Example: 
          This method calculates the integral of a function \( f(x, y, z) \) over a 3-dimensional region defined by the limits [x_1, x_2], [y_1, y_2(x)], and [z_1, z_2(x, y)] using the Gauss-Legendre quadrature method.
         
          
         
          The integral we are trying to calculate is:
         

          .. math::
              \int_{0}^{1} \int_{0}^{1} \int_{0}^{1} \sin(x) \cdot \cos(y) \cdot \exp(z) \, dz \, dy \, dx
         

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Define the function to integrate
             Func<double, double, double, double> func = (x, y, z) => Math.Sin(x) * Math.Cos(y) * Math.Exp(z);
         
             // Perform the integration using GaussLeg3
             double result = GaussLeg3(
                 func,
                 0, 1,                // Integration limits for x
                 0, x => 1,           // Integration limits for y (constant lower limit and upper limit based on x)
                 0, (x, y) => 1       // Integration limits for z (constant lower limit and upper limit based on x and y)
             );
         
             // Output the result
             Console.WriteLine("The integral result is: " + result);
          This example calculates the integral of the function sin(x) * cos(y) * exp(z) over the range [0, 1] for x, y, and z.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, the lower z-bound is a constant, and the upper z-bound is a function of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  The lower bound of the z integration. This is a constant value.
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1 <= z <= z_2(x, y).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_1(x), y_2(x) and z_2(x, y) should be smooth functions.
          Ensure that y_1(x) <= y_2(x) and z_1 <= z_2(x, y) throughout the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from 2 to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.ArgumentNullException is Thrown when the  z_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by constants, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2, and z_1(x, y) <= z <= z_2(x, y).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and z_1(x, y) and z_2(x, y) should be smooth functions. 
          Ensure that z_1(x,y) <= z_2(x, y) throughout the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by a function of x for the lower bound and a constant for the upper bound, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  The upper bound of the y integration. This is a constant value.
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2, and z_1(x, y) <= z <= z_2(x, y).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, and y_1(x), z_1(x, y), and z_2(x, y) should be smooth functions.
          Ensure that y_1(x) <= y_2 and z_1(x,y) <= z_2(x, y) throughout the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the lower y-bound is constant, the upper y-bound is a function of x, and the z-bounds are functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  The lower bound of the y integration. This is a constant value.
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1 <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions.
          Ensure that y_1 is less than or equal to y_2(x) and z_1(x,y) is less than or equal to z_2(x, y) across the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from 1 to x^2, and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


   GaussLeg3::
      Description: 
          Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-Legendre quadrature.
      Param: 
         | fun:  The function to integrate. The function should accept three doubles (x, y, z) and return a double.
         | x_1:  The lower bound of the x integration.
         | x_2:  The upper bound of the x integration.
         | y_1:  A function that defines the lower bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | y_2:  A function that defines the upper bound of the y integration as a function of x. It should accept a double (x) and return a double (y).
         | z_1:  A function that defines the lower bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | z_2:  A function that defines the upper bound of the z integration as a function of x and y. It should accept two doubles (x, y) and return a double (z).
         | eps:  The desired relative accuracy. The default value is 1e-6.
      Returns: 
          The approximate value of the definite triple integral.
      Remark: 
          This method uses adaptive Gauss-Legendre quadrature to approximate the triple integral.
          The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
          The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
          For best results, the function should be smooth within the integration region, y_1(x), y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions. 
          Ensure that y_1(x) <= y_2(x) and z_1(x, y) <= z_2(x, y) throughout the integration region.
          If x_1 equals x_2 then the method will return 0.
      Example: 
           Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

          .. math::
             \int_{x_1}^{x_2} \int_{y_1(x)}^{y_2(x)}  \int_{z_1(x,y)}^{z_2(x,y)} x y z \, dz \, dy \, dx

          .. code-block:: CSharp 

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
     cref=System.ArgumentNullException is Thrown when the  fun is null.
     cref=System.ArgumentNullException is Thrown when the  y_1 is null.
     cref=System.ArgumentNullException is Thrown when the  y_2 is null.
     cref=System.ArgumentNullException is Thrown when the  z_1 is null.
     cref=System.ArgumentNullException is Thrown when the  z_2 is null.
     cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.
