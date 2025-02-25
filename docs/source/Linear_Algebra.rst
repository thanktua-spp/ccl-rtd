Linear Algebra
==============

Linear algebra is a cornerstone of modern mathematics, providing a framework for understanding and solving a wide range of problems in various fields, from physics and engineering to computer science and economics.

Applications:
- Physics: Describing forces, analyzing electrical circuits, and modeling quantum mechanics.   
- Computer Graphics: Representing images, performing transformations (rotations, scaling), and rendering 3D graphics.   
- Machine Learning: Representing data, training models, and making predictions.   
- Economics: Modeling economic systems, analyzing market trends, and forecasting.   


All linear algebra functionalities can be accessed through vector and matrices in the mathematics library. 
In essence, matrices provide a versatile and elegant framework for representing and manipulating data, making them an indispensable tool in various fields of science, engineering, and technology.


Matrix Slicing
--------------
Slicing is a powerful feature in CCL-Math that allows you to extract specific portions of arrays. Slicing can be applied along multiple axes, enabling efficient data manipulation and analysis.
To illustrate the power of Matrix slicing lets see how to implement strassen multiplication in with CCL-Math. 

Strassen’s algorithm is a method for matrix multiplication that is more efficient than the standard algorithm for large matrices. It was developed by Volker Strassen in 1969. The key idea is to reduce the number of multiplications needed to compute the product of two matrices.

In the standard matrix multiplication, multiplying two (2 \times 2) matrices requires 8 multiplications. Strassen’s algorithm reduces this to 7 multiplications by using a divide-and-conquer approach. Here’s a simplified outline of the process:

 #. Divide the matrices into four submatrices.
 #. Compute seven products using combinations of these submatrices.
 #. Combine these products to get the final result.

.. figure:: images/StrassenMultilication.png
   :align: center
   :alt: StrassenMultilication.png


.. code-block:: C#
         
   // import libraries
   using System.Collections.Generic;
   using CypherCrescent.MathematicsLibrary;
   using static CypherCrescent.MathematicsLibrary.Math;

   static Matrix Strass(Matrix A, Matrix B)
   {
      if (A.Cols != B.Rows)   
         throw new Exception("Matrices are not conformable for multiplication");
      if (A.Cols == 1)
         return A[0, 0] * B[0, 0];
      else
      {
         // get matrix size
         int N = A.Cols / 2; Indexer I = new(0, N), J = I + N;
 
         // split A and B into submatrices
         Matrix A11 = A[I, I], A12 = A[I, J], B11 = B[I, I], B12 = B[I, J],
                A21 = A[J, I], A22 = A[J, J], B21 = B[J, I], B22 = B[J, J],
 
         // compute the strassen submatrices (7 multiplication)
             M1 = Strass(A11 + A22, B11 + B22),
             M2 = Strass(A21 + A22, B11),
             M3 = Strass(A11, B12 - B22),
             M4 = Strass(A22, B21 - B11),
             M5 = Strass(A11 + A12, B22),
             M6 = Strass(A21 - A11, B11 + B12),
             M7 = Strass(A12 - A22, B21 + B22);
 
         // compose the result
         return new Matrix[,] 
         { 
             { M1 + M4 - M5 + M7,        M3 + M5      },
             {      M2 + M4,        M1 - M2 + M3 + M6 } 
         };
      } 
   }

   Matrix A = Rand(8,8), B = Rand(8,8), C = Strass(A, B);
   Console.WriteLine($"A = \n{A}");
   Console.WriteLine($"B = \n{B}");
   Console.WriteLine($"C = \n{C}");

Output

.. code-block:: C#

   A =
   
      0.6804           0.4096          0.2655          0.2206          0.1321          0.5049          0.9087          0.9618
      0.1726           0.6211          0.6076          0.7902          0.9363          0.4044          0.5000          0.7788
      0.5419           0.8509          0.5657          0.6927          0.8439          0.9449          0.6010          0.1753
      0.2176           0.3106          0.8529          0.8783          0.9723          0.8027          0.7169          0.1395
      0.8370           0.0268          0.3158          0.5822          0.9617          0.4122          0.6199          0.2008
      0.9677           0.8137          0.7056          0.8029          0.7299          0.9224          0.2169          0.8073
      0.4679           0.7868          0.6308          0.6227          0.0467          0.3010          0.4390          0.7355
      0.8086           0.0902          0.0030          0.8215          0.6520          0.0305          0.9895          0.3699
   
   B =
   
      0.9042           0.4681          0.9532          0.9095          0.0885          0.9178          0.8172          0.1297
      0.2310           0.3648          0.7250          0.0302          0.2393          0.7981          0.4454          0.2951
      0.0936           0.0456          0.4104          0.1855          0.1719          0.0942          0.0928          0.5360
      0.5878           0.5803          0.7736          0.8714          0.4092          0.7984          0.5488          0.9372
      0.8242           0.3357          0.8987          0.2618          0.9692          0.3075          0.7188          0.5501
      0.9697           0.5012          0.3917          0.6819          0.5760          0.4088          0.4962          0.0105
      0.6448           0.7079          0.7279          0.6064          0.6201          0.8040          0.1980          0.8100
      0.3753           0.4172          0.3217          0.5082          0.1442          0.9457          0.7204          0.4326
   
   C =
   
      2.4098           1.9500          2.5125          2.2914          1.4152          3.0397          2.1024          1.7883
      2.5995           1.9896          3.0899          2.1970          2.1545          2.9340          2.4415          2.5332
      3.2118           2.2473          3.5239          2.5458          2.3924          3.0775          2.5751          2.3106
      2.9590           2.0581          3.2170          2.4383          2.4690          2.5645          2.2168          2.5845
      2.8023           1.8059          2.9389          2.3389          1.9560          2.4368          2.2080          1.9537
      3.5399           2.4457          3.8579          3.0971          2.2200          3.7844          3.2662          2.4325
      1.9195           1.6804          2.4731          1.9665          1.1899          2.8000          1.9328          1.9173
      2.5790           1.9772          2.9101          2.4341          1.7463          2.8286          2.0983          2.2235
   
  


