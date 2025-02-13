Math
----


   Deconv::
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
