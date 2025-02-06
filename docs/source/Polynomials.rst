Polynomials
-----------


Polynomials::
   Description: 
       Handles all operations involving polynomials such as roots, convolution and deconvolution


   Roots::
      Description: 
          Calculates the roots of a polynomial given its coefficients.
      Param: 
         | Coeffs:  An array of doubles representing the coefficients of the polynomial.
      Returns: 
          An array of complex numbers representing the roots of the polynomial.
      Example: 
          In this example, we calculate the roots of a polynomial with given coefficients.
          

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Coefficients of the polynomial 7x^6 + 9x^5 - 7x^4 + 9x^3 + 3x^2 - 8x - 4
             double[] coeffs = [ 7,  9, -7, 9, 3, -8, -4 ];
             
             // Calculate the roots
             Complex[] roots = Complex.Roots(coeffs);
             
             // Print the roots
             foreach (Complex root in roots)
                 Console.WriteLine($"Root: {root}");
                 
          

         Output: 


          .. code-block:: Terminal 

             Root: -2.0000 + 0.0000i
             Root:  0.4370 + 0.9730i
             Root:  0.4370 - 0.9730i
             Root:  0.8530 + 0.0000i
             Root: -0.5064 + 0.1948i
             Root: -0.5064 - 0.1948i


   Roots::
      Description: 
          Calculates the roots of a polynomial given its complex coefficients.
      Param: 
         | Coeffs:  An array of complex numbers representing the coefficients of the polynomial.
      Returns: 
          An array of complex numbers representing the roots of the polynomial.
      Example: 
          In this example, we calculate the roots of a polynomial with given complex coefficients.
          

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Complex Coefficients of the polynomial (-6, -6i)x^3 + (11, 11i)x^2 + (-6, -6i)x + (1, 1)
             Complex[] coeffs = [ new(-6, -6), new(11, 11), new(-6, -6), new(1, 1) ];
             
             // Calculate the roots
             Complex[] roots = Polynomials.Roots(coeffs);
             
             // Print the roots
             foreach (Complex root in roots)
                 Console.WriteLine($"Root: {root}");
             
          

         Output: 


          .. code-block:: Terminal 

             Root: 1.0000 + 0.0000i
             Root: 0.5000 + 0.0000i
             Root: 0.3333 + 0.0000i
