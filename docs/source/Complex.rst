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
          Complex z1 = new ComplexNumber(2, 3); 
          Complex z2 = new ComplexNumber(1, -2); 
          Complex sum = z1 + z2; // Complex number addition
          Console.WriteLine(sum); 
       </code>

      Output: 


       .. code-block:: Terminal 

          3.0000 +  1.0000i


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


   Cart::
      Description: 
          Converts polar coordinates (magnitude and angle) to a complex number in Cartesian coordinates.
      Param: 
         | mag:  The magnitude of the complex number.
         | angle:  The angle (in radians) of the complex number.
      Returns: 
          A complex number represented in Cartesian coordinates.
      Example: 
          In this example, we convert polar coordinates to a complex number.
          Mathematically, if we have:

          .. math::
             \text{Magnitude} = 5, \text{Angle} = \frac{\pi}{4}
          The Cartesian coordinates are:

          .. math::
             \begin{array}{rcl}
             \text{Real} &=& 5 \cdot \cos\left(\cfrac{\pi}{4}\right) \\
             \text{Imaginary} &=& 5 \cdot \sin\left(\cfrac{\pi}{4}\right)
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Cart method
             double magnitude = 5.0;
             double angle = Math.PI / 4;
             Complex cartesianComplex = Complex.Cart(magnitude, angle);
             // print the result
             Console.WriteLine($"Cartesian Complex = {cartesianComplex}");

         Output: 


          .. code-block:: Terminal 

             Cartesian Complex =   3.5355 + 3.5355i


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
             \text{Argument} &=& \arctan\left(\cfrac{4}{3}\right)
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


   Root::
      Description: 
          Calculates the Nth roots of a complex number.
      Param: 
         | c:  The complex number for which to calculate the roots.
         | N:  The number of roots to calculate.
      Returns: 
          An array of complex numbers representing the Nth roots of the input complex number.
   |   cref=ArgumentException is 
      Example: 
          In this example, we calculate the 3rd roots of a complex number.
          Mathematically, if we have:

          .. math::
             z = 8 + 0i, N = 3
          The roots are:

          .. math::
             \begin{array}{rcl}
             \text{Root}_1 &=& 2 + 0i \\
             \text{Root}_2 &=& -1 + \sqrt{3}i \\
             \text{Root}_3 &=& -1 - \sqrt{3}i
             \end{array}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             using System.Linq;
             
             // Example of using the Root method
             Complex c = new Complex(8.0, 0.0);
             int N = 3;
             Complex[] roots = Complex.Root(c, N);
             // print the results
             foreach (var root in roots)
             {
                 Console.WriteLine($"Root = {root}");
             }

         Output: 


          .. code-block:: Terminal 

             Root =   2.0000 + 0.0000i
             Root =  -1.0000 + 1.7321i
             Root =  -1.0000 - 1.7321i


   Random::
      Description: 
          Generates a random complex number with real and imaginary parts between 0 and 1.
      Param: 
         | random:  An optional Random object to use for generating the random numbers. If null, a new Random object is created.
      Returns: 
          A complex number with random real and imaginary parts.
      Example: 
          In this example, we generate a random complex number.

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Random method
             Complex randomComplex = Complex.Random();
             // print the result
             Console.WriteLine($"Random Complex = {randomComplex}");

         Output: 


          .. code-block:: Terminal 

             Random Complex =   0.1234 + 0.5678i


   Sqrt::
      Description: 
          Calculates the square root of a complex number.
      Param: 
         | c:  The complex number for which to calculate the square root.
      Returns: 
          A complex number representing the square root of the input complex number.
      Example: 
          In this example, we calculate the square root of a complex number.
          Mathematically, if we have:

          .. math::
             z = 3 + 4i
          The square root is:

          .. math::
             \sqrt{z} = \sqrt{3 + 4i}

          .. code-block:: CSharp 

             // import libraries
             using CypherCrescent.MathematicsLibrary;
             using static System.Math;
             using System;
             
             // Example of using the Sqrt method
             Complex c = new Complex(3.0, 4.0);
             Complex sqrtComplex = Complex.Sqrt(c);
             // print the result
             Console.WriteLine($"Sqrt Complex = {sqrtComplex}");

         Output: 


          .. code-block:: Terminal 

             Sqrt Complex =   2.0000 + 1.0000i
