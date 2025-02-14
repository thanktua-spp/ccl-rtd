

Polyfit
=======
   Description: 
       Fits a polynomial of degree N to the data points specified by the arrays X and Y.
       Mathematically, this can be represented as finding the coefficients of the polynomial:

       .. math::
          P(x) = a_0 + a_1 x + a_2 x^2 + ... + a_N x^N
       that best fits the given data points (X, Y).
   Param: 
      | X:  The x-coordinates of the data points.
      | Y:  The y-coordinates of the data points.
      | N:  The degree of the polynomial to fit.
   Returns: 
       An array containing the coefficients of the fitted polynomial, starting with the coefficient of the highest degree term.
   Example: 

          .. math::
             X = [1, 2, 3, 4],~ Y = [1, 4, 9, 16],~ N = 2
       In this example, we fit a polynomial of degree 2 to the data points.
       The x-coordinates are represented by the array { 1, 2, 3, 4 } and the y-coordinates by { 1, 4, 9, 16 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using CypherCrescent.MathematicsLibrary.Math;
      
          // Example of fitting a polynomial
          double[] X = { 1, 2, 3, 4 };
          double[] Y = { 1, 4, 9, 16 };
          int N = 2;
          double[] coefficients = Polyfit(X, Y, N);
          // Print the result
          Console.WriteLine($"Coefficients: {string.Join(", ", coefficients)}");

      Output: 


       .. code-block:: Terminal 

          Coefficients: 1, 0, 0


Deconv
======
   Description: 
       Performs polynomial deconvolution (division) of two polynomials and returns the quotient and remainder.
       Mathematically, this can be represented as:

       .. math::
          P(x) = D(x) * Q(x) + R(x)
       where P(x) is the dividend polynomial, D(x) is the divisor polynomial, Q(x) is the quotient polynomial, and R(x) is the remainder polynomial.
   Param: 
      | Polynomial:  The coefficients of the dividend polynomial (numerator).
      | Divisor:  The coefficients of the divisor polynomial (denominator).
   Returns: 
       A tuple containing two arrays:
          - Quotient: The coefficients of the quotient polynomial.
          - Remainder: The coefficients of the remainder polynomial.
   Example: 

          .. math::
             P(x) = x^5 + 2x^4 + 3x^3 + 4x^2 + 5x + 6,~ D(x) = x^2 + 2x + 3
       In this example, we perform polynomial deconvolution on two polynomials.
       The dividend polynomial is represented by the coefficients { 1, 2, 3, 4, 5, 6 } and the divisor polynomial by { 1, 2, 3 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using CypherCrescent.MathematicsLibrary.Math;
      
          // Example of performing polynomial deconvolution
          double[] Polynomial = [1, 2, 3, 4, 5, 6];
          double[] Divisor = [1, 2, 3];
          var result = Deconv(Polynomial, Divisor);
          // Print the result
          Console.WriteLine($"Quotient: {string.Join(", ", result.Quotient)}");
          Console.WriteLine($"Remainder: {string.Join(", ", result.Remainder)}");

      Output: 


       .. code-block:: Terminal 

          Quotient: 1, 0, 0, 4
          Remainder: 0, 0, 0, 0, -3, -6

   ..note::
       Both polynomial and the divisor can be real or complex as demonstrated below



   Example: 

          .. math::
             P(x) = (2+2i)x^4 + (7+3i)x^3 + (9+10i)x^2 + (10+4i)x + (2+7i)
       

          .. math::
             D(x) = (3+2i)x^2 + (4+2i)x + (3+i)
       In this example, we perform polynomial deconvolution on two polynomials with complex coefficients.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using CypherCrescent.MathematicsLibrary.Math;
      
          // Example of performing polynomial deconvolution
          Complex[] P = [new(2,2), new(7,3), new(9,10), new(10,4), new(2,7)], 
          Complex[] D = [new(3,2), new(4,2), new(3,1)];
          (Complex[]Q, Complex[]R) = Deconv(P, D);
      
          // Print the result
          Console.WriteLine("Q = \n" + string.Join(", ", Q)); 
          Console.WriteLine("R = \n" + string.Join(", ", R));

      Output: 


       .. code-block:: Terminal 

          Q = 
              0.7692 + 0.1538i ,   1.1065 - 0.4556i ,   1.6372 + 1.7014i
          R =
              0.0000 + 0.0000i ,   0.0000 + 0.0000i ,   0.0000 + 0.0000i ,   3.0787 - 5.8198i ,  -1.2103 + 0.2585i


Conv
====
   Description: 
       Performs polynomial convolution (multiplication) of two polynomials and returns the resulting polynomial.
       Mathematically, this can be represented as:

       .. math::
          C(x) = P(x) * M(x)
       where P(x) is the first polynomial, M(x) is the second polynomial, and C(x) is the resulting polynomial.
   Param: 
      | Polynomial:  The coefficients of the first polynomial.
      | Multiplier:  The coefficients of the second polynomial.
   Returns: 
       An array containing the coefficients of the resulting polynomial.
   Example: 

          .. math::
             P(x) = x^2 + 2x + 3,~ M(x) = x + 1
       In this example, we perform polynomial convolution on two polynomials.
       The first polynomial is represented by the coefficients { 1, 2, 3 } and the second polynomial by { 1, 1 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using CypherCrescent.MathematicsLibrary.Math;
      
          // Example of performing polynomial convolution
          double[] Polynomial = [ 1, 2, 3 ];
          double[] Multiplier = [ 1, 1 ];
          double[] Product = Conv(Polynomial, Multiplier);
          // Print the result
          Console.WriteLine($"Product: {string.Join(", ", Product)}");

      Output: 


       .. code-block:: Terminal 

          Product: 1, 3, 5, 3
