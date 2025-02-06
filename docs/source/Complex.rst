Complex
-------


Complex::
   Description: 
       Represents a complex number with a real and imaginary component.
   Remark: 
      |  A complex number is a number that can be expressed in the form a + bi, 
      |  where 'a' and 'b' are real numbers, and 'i' is the imaginary unit, 
      |  which satisfies the equation i² = -1.
   Example: 
       <code>
       Complex z1 = new ComplexNumber(2, 3); // 2 + 3i
       Complex z2 = new ComplexNumber(1, -2); // 1 - 2i
       Complex sum = z1 + z2; // Complex number addition
       Console.WriteLine(sum); // 3 + i
       </code>


   Real::
      Description: 
          Returns the real part of the complex number.


   Imaginary::
      Description: 
          Returns the imaginary part of the complex number.


   Magnitude::
      Description: 
          Returns the magnitude of the complex number.


   MagnitudeSq::
      Description: 
          Returns the square of the magnitude of the complex number.


   Argument::
      Description: 
          Returns the inclination (in radians) of the complex number with positive real number axis.


   Complex::
      Description: 
          Initializes a new instance of the Complex class with the specified real and imaginary parts.
      Param: 
         | real:  The real part of the complex number.
         | imaginary:  The imaginary part of the complex number.
      Example: 
          In this example, we create a complex number with a real part of 3.0 and an imaginary part of 4.0.
          Mathematically, this can be represented as:

          .. math::
             z = 3 + 4i

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
         
             // Example of creating a Complex instance
             Complex complex = new Complex(3.0, 4.0);
             // Print the result
             Console.WriteLine($"z = {complex}");

         Output: 


          .. code-block:: Terminal 

             z =   3.0000 + 4.0000i


   Complex::
      Description: 
          Initializes a new instance of the Complex class with the specified real part and an imaginary part of 0.
      Param: 
         | real:  The real part of the complex number.
      Example: 
          In this example, we create a complex number with a real part of 5.0 and an imaginary part of 0.
          Mathematically, this can be represented as:

          .. math::
             z = 5 + 0i

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
         
             // Example of creating a Complex instance
             Complex complexNumber = new Complex(5.0);
             // Print the result
             Console.WriteLine($"z = {complex}");

         Output: 


          .. code-block:: Terminal 

             z =   5.0000 + 0.0000i


   CompareTo::
      Description: 
          Compares the current complex number to another complex number.
      Param: 
         | other:  The complex number to compare with this instance.
      Returns: 
          A value less than zero if this instance is less than <paramref name="other"/>,
          zero if this instance is equal to <paramref name="other"/>, or 
          a value greater than zero if this instance is greater than <paramref name="other"/>.
      Remark: 
         |  Complex numbers are compared first by their magnitude, and then by their argument.


   Max::
      Description: 
          Returns the maximum of two Complex numbers.
      Param: 
         | A:  The first complex number to compare.
         | B:  The second complex number to compare.
      Returns: 
          The complex number that is greater.
      Example: 
          In this example, we compare two complex numbers and return the greater one.
          Mathematically, if we have:

          .. math::
             \begin{array}{rcl}
              A &=& 3 + 4i  \\
              B &=& 5 + 2i
              \end{array}
          The method will return B as it is greater.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Max method
             Complex A = new Complex(3.0, 4.0);
             Complex B = new Complex(5.0, 2.0);
             // find the maximum
             Complex maxComplex = Complex.Max(A, B);
             // print the result
             Console.WriteLine($"Max Complex = {maxComplex}");

         Output: 


          .. code-block:: Terminal 

             Max Complex =   5.0000 + 2.0000i


   Min::
      Description: 
          Returns the minimum of two Complex numbers.
      Param: 
         | A:  The first complex number to compare.
         | B:  The second complex number to compare.
      Returns: 
          The complex number that is smaller.
      Example: 
          In this example, we compare two complex numbers and return the smaller one.
          Mathematically, if we have:

          .. math::
             \begin{array}{rcl}
              A &=& 3 + 4i  \\
              B &=& 5 + 2i
              \end{array}
          The method will return A as it is smaller.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Min method
             Complex A = new Complex(3.0, 4.0);
             Complex B = new Complex(5.0, 2.0);
             // find the minimum
             Complex minComplex = Complex.Min(A, B);
             // print the result
             Console.WriteLine($"Min Complex = {minComplex}");

         Output: 


          .. code-block:: Terminal 

             Min Complex =   3.0000 + 4.0000i


   static::
      Description: 
          Returns the polar coordinates (magnitude and argument) of a complex number.
      Param: 
         | c:  The complex number to convert to polar coordinates.
      Returns: 
          A tuple containing the magnitude and argument of the complex number.
      Example: 
          In this example, we convert a complex number to its polar coordinates.
          Mathematically, if we have:

          .. math::
             z = 3 + 4i
          The polar coordinates are:

          .. math::
             \begin{array}{rcl}
             \text{Magnitude} &=& 5  \\
             \text{Argument} &=& \arctan\left(\frac{4}{3}\right)
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Pol method
             Complex c = new Complex(3.0, 4.0);
             var polarCoordinates = Complex.Pol(c);
             // print the result
             Console.WriteLine($"Magnitude = {polarCoordinates.Mag}, Argument = {polarCoordinates.Arg}");

         Output: 


          .. code-block:: Terminal 

             Magnitude = 5, Argument = 0.9273
