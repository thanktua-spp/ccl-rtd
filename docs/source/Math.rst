

Hypot
=====
   Description: 
       Calculates the length of the hypotenuse of a right-angled triangle given the lengths of the other two sides.This method computes z = Sqrt(Pow(x, 2) + Pow(y, 2)) by avoiding underflow and overflow.

       .. math::
          \text{hypot}(x,y) = \sqrt{x^2 + y^2}
          

       .. code-block:: CSharp 

          double Hypot(double x, double y)
          ColVec Hypot(ColVec x, double y)
          ColVec Hypot(double x, ColVec y)
          RowVec Hypot(RowVec x, double y)
          RowVec Hypot(double x, RowVec y)
          Matrix Hypot(Matrix x, double y)
          Matrix Hypot(double x, Matrix y)
          ColVec Hypot(ColVec x, ColVec y)
          RowVec Hypot(RowVec x, RowVec y)
          Matrix Hypot(Matrix x, Matrix y)
          Matrix Hypot(RowVec x, ColVec y)
          Matrix Hypot(ColVec x, RowVec y)
          Matrix Hypot(RowVec x, Matrix y)
          Matrix Hypot(Matrix x, RowVec y)
          Matrix Hypot(Matrix x, ColVec y)
          Matrix Hypot(ColVec x, Matrix y)
   Param: 
      | x:  The length of one side of the triangle.
      | y:  The length of the other side of the triangle.
   Returns: 
       The length of the hypotenuse.
   Example: 
       <code>
          var hypotenuse = Hypot(3, 4);
          Console.WriteLine(hypotenuse);
       </code>

      Output: 


       .. code-block:: Terminal 

          5
   Example: 
       <code>
          RowVec X = new double[]{2,3,4,5};
          ColVec Y = new double[]{7,6};
          var hypotenuse = Hypot(X, Y);
          Console.WriteLine(hypotenuse); 
       </code>

      Output: 


       .. code-block:: Terminal 

          7.2801    7.6158    8.0623    8.6023
          6.3246    6.7082    7.2111    7.8102


decic
=====
   Description: 
       Compute consistent initial conditions for ODE45I.
   Param: 
      | fun:  The function that represents the implicit ODE. The function should accept three doubles (time, state, and its derivative) and return a double representing the derivative of the state.
      | t0:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | y0:  The initial value of the dependent variable (state).
      | ytruth:  An array of intergers indicating which component of y0 is fixed and which is not.
      | yp0:  The initial time derivative of the dependent variable (state).
      | yptruth:  An array of intergers indicating which component yp0 is fixed and which is not.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * double y0: modified initial state.
          * double yp0: modified initial rate of change.
   Remark: 
      |  decic changes as few components of the guess as possible. You can specify that certain components are to be held fixed by setting ytruth(i) = 1 if no change is permitted 
      |  in the guess for Y0(i) and 0 otherwise.An empty array for yptruth is interpreted as allowing changes in all entries.yptruth is handled similarly. 
      |  You cannot fix more than length(Y0) components.Depending on the problem, it may not be possible to fix this many.It also may not be possible to fix certain components of Y0 or YP0.
      |  It is recommended that you fix no more components than necessary.
   Example: 
        Determine the consistent initial condition for the implicit ODE :math:`~ty^2y'^3 - y^3y'^2 + t(t^2 + 1)y' - t^2y = 0~` with initial condition :math:`~y(0) = \sqrt{1.5}~`.
          

       .. code-block:: CSharp 

         // import libraries
         using System;
         using SepalSolver.Math;
      
         //define ODE
         static double fun(double t, double y, double yp) =>
            t * y * y * yp * yp * yp - y * y * y * yp * yp + t * (t * t + 1) * yp - t * t * y;
            var opts = Odeset(Stats: true);
            double t0 = 1, y0 = Sqrt(t0 * t0 + 1 / 2.0), yp0 = 0;
            (y0, yp0) = decic(fun, t0, y0, 1, yp0, 0);
             
         // print result to console
         Console.WriteLine($"y0 = {y0}");
         Console.WriteLine($"yp0 = {yp0}");

      Output: 


       .. code-block:: Terminal 

         y0 = 1.2247
         yp0 = 0.8165
|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode23
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Bogacki-Shampine method (Ode23).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Bogacki-Shampine method (Ode23) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 2]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode23(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE23");
          SaveAs("Van-der-Pol-(μ=1)-Ode23.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode23.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode23.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Dormand-Prince method (Ode45).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Dormand-Prince method (Ode45) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 2]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode45(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE45");
          SaveAs("Van-der-Pol-(μ=1)-Ode45.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode45.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode45.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode56
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 5th and 6th order pair method (Ode56).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 5th and 6th order pair method (Ode56) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode56(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE56");
          SaveAs("Van-der-Pol-(μ=1)-Ode56.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode56.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode56.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode78
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 7th and 8th order pair method (Ode78).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 7th and 8th order pair method (Ode78) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode78(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE78");
          SaveAs("Van-der-Pol-(μ=1)-Ode78.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode78.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode78.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode89
=====
   Description: 
       Solves non stiff ordinary differential equations (ODE) using the Jim Verner 8th and 9th order pair method (Ode89).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses the Jim Verner 8th and 9th order pair method (Ode89) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = (1 - y^2)y' - y~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 20]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& (1 - y^2)v - y
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp1(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], (1 - y[0] * y[0]) * y[1] - y[0]];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode89(vdp1, [2, 0], [0, 20]);
          // Plot the result
          Plot(T, Y, "-o");
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1) with ODE89");
          SaveAs("Van-der-Pol-(μ=1)-Ode89.png");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1)-Ode89.png
       :align: center
       :alt: Van der Pol-(μ = 1)-Ode89.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45s
======
   Description: 
       Solves stiff ordinary differential equations (ODE) using Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45s).
   Param: 
      | dydx:  The function that represents the ODE. The function should accept two doubles (time and state) and return a double representing the derivative of the state.
      | initcon:  The initial value of the dependent variable (state).
      | tspan:  An array of time points at which the solution is desired. The first element is the initial time, and the last element is the final time.
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45s) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~d^2y/dt^2 = 10^{5}((1 - y^2)y' - y)~` with initial condition :math:`~y(0) = [2, 0]~` over the interval :math:`[0, 6.3]`.
        First we have to convert this to a system of first order differential equations, 

        .. math::
           \begin{array}{rcl}
                 y' &=& v \\
                 v' &=& 10^{5}((1 - y^2)v - y)
            \end{array}

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static ColVec vdp2(double t, ColVec y)
          {
               double[] dy;
               return dy = [y[1], 1e5*((1 - y[0] * y[0]) * y[1] - y[0])];
          }
          //Solve ODE
          (ColVec T, Matrix Y) = Ode45s(vdp2, [2, 0], [0, 6.3]);
          // Plot the result
          Plot(T, Y);
          Xlabel("Time t"); Ylabel("Soluton y");
          Legend(["y_1", "y_2"], Alignment.UpperLeft);
          Title("Solution of van der Pol Equation (μ = 1e5) with ODE45s");
          SaveAs("Van-der-Pol-(μ=1e5)-Ode45s");

      Output: 

    .. figure:: images/Van-der-Pol-(μ=1e5)-Ode45s.png
       :align: center
       :alt: Van-der-Pol-(μ=1e5)-Ode45s.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


Ode45i
======
   Description: 
       Solves inmplicit ordinary differential equations (ODE) using Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i).
   Param: 
      | fun:  The function that represents the implicit ODE. The function should accept three doubles (time, state, and its derivative) and return a double representing the derivative of the state.
      | initcon:  A tuple containing two elements:
                   * double y0:  initial state.
                   * double yp0: initial rate of change.
      | tspan:  The initial value of the dependent variable (state).
      | options:  Optional parameters for the ODE solver, such as relative tolerance, absolute tolerance, and maximum step size. If not provided, default options will be used.
   Returns: 
       A tuple containing two elements:
          * ColVec T: A column vector of time points at which the solution was computed.
          * Matrix Y: A matrix where each row corresponds to the state of the system at the corresponding time point in T.
   Remark: 
      |  This method uses Adaptive Diagonally Implicit RungeKutta of 4th and 5th Order Method (Ode45i) to solve the ODE. It is an adaptive step size method that adjusts the step size to achieve the desired accuracy.
      |  For best results, the function should be smooth within the integration interval.
   Example: 
        Solve the ODE :math:`~ty^2y'^3 - y^3y'^2 + t(t^2 + 1)y' - t^2y = 0~` with initial condition :math:`~y(0) = \sqrt{1.5}~`.
          

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          //define ODE
          static double fun(double t, double y, double yp) =>
             t* y * y* yp * yp* yp - y* y * y* yp * yp + t* (t* t + 1) * yp - t* t * y;
             
          var opts = Odeset(Stats: true);
          double t0 = 1, y0 = Sqrt(t0 * t0 + 1 / 2.0), yp0 = 0;
          (y0, yp0) = decic(fun, t0, y0, 1, yp0, 0);
          (ColVec T, Matrix Y) = Ode45i(fun, (y0, yp0), [t0, 10], opts);
          ColVec Y_exact = T.Select(t => Sqrt(t * t + 0.5)).ToList();
          Console.WriteLine(Hcart(Y, Y_exact));
          Plot(T, Y, "*"); hold = true;
          Plot(T, Y_exact, "-o"); hold = false;
          Title("Implicit differential (weissinger) equation with ODE45i");
          Xlabel("Time t");
          Ylabel("Solution y");
          SaveAs("Weissinger-Ode45i.png");

      Output: 


       .. code-block:: Terminal 

       Summary of statistics by Ode45i
               13 successful steps
               0 failed attempts
               335 function evaluations
               52 partial derivatives
               52 LU decompositions
               174 solutions of linear systems
      
          1.2247    1.2247
          1.2993    1.2993
          1.4536    1.4536
          1.7767    1.7768
          2.3227    2.3229
          3.1865    3.1869
          4.0689    4.0694
          4.9575    4.9582
          5.8496    5.8504
          6.7437    6.7447
          7.6392    7.6403
          8.5357    8.5368
          9.4327    9.4340
         10.0236   10.0250

      Output: 

    .. figure:: images/Weissinger-Ode45i.png
       :align: center
       :alt: Weissinger-Ode45i.png


|   cref=System.ArgumentNullException is Thrown when the  dydx is null.
|   cref=System.ArgumentException is Thrown when the  tspan array has less than two elements.


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
          using SepalSolver.Math;
      
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

       .. code-block:: CSharp 

          (double[] Quotient, double[] Remainder) Deconv(double[] Polynomial, double[] Divisor)
          (Complex[] Quotient, Complex[] Remainder) Deconv(Complex[] Polynomial, Complex[] Divisor)
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
          using SepalSolver.Math;
      
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
          \begin{array}{rcl}
          P(x) &=& (7+3i)x^3 + (9+10i)x^2 + (10+4i)x + (2+7i) \\
          D(x) &=& (3+2i)x^2 + (4+2i)x + (3+i)
          \end{array}
          
       In this example, we perform polynomial deconvolution on two polynomials with complex coefficients.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial deconvolution
          Complex[] P = [new(7,3), new(9,10), new(10,4), new(2,7)], 
          Complex[] D = [new(3,2), new(4,2), new(3,1)];
          (Complex[]Q, Complex[]R) = Deconv(P, D);
      
          // Print the result
          Console.WriteLine("Q = \n" + string.Join(", ", Q)); 
          Console.WriteLine("R = \n" + string.Join(", ", R));

      Output: 


       .. code-block:: Terminal 

          Q = 
              2.0769 - 0.3846i ,  1.1183 + 1.7160i
          R =
              0.0000 + 0.0000i ,  0.0000 + 0.0000i ,  2.3432 - 6.0237i ,  0.3609 + 0.7337i


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
          using SepalSolver.Math;
      
          // Example of performing polynomial convolution
          double[] Polynomial = [ 1, 2, 3 ];
          double[] Multiplier = [ 1, 1 ];
          double[] Product = Conv(Polynomial, Multiplier);
          // Print the result
          Console.WriteLine($"Product: {string.Join(", ", Product)}");

      Output: 


       .. code-block:: Terminal 

          Product: 1, 3, 5, 3
   Example: 

          .. math::
             P(x) = (2+3i)x^2 + (5-i)x + 3+7i,~ M(x) = (-3+2i)x + 2-i
       In this example, we perform polynomial convolution on two polynomials.
       The first polynomial is represented by the coefficients { 2+3i, 5-i, 3+7i } and the second polynomial by { 1, 1 }.

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Example of performing polynomial convolution
          Complex[] Polynomial = [ new(2,3), new(5,-1), new(3,7) ];
          Complex[] Multiplier = [ new(-3,2), new(2,-1) ];
          var Product = Conv(Polynomial, Multiplier);
          // Print the result
          Console.WriteLine($"Product: {string.Join(", ", Product)}");

      Output: 


       .. code-block:: Terminal 

          Product: -12.0000 - 5.0000i ,  -6.0000 + 17.0000i, -1.4000e+01 - 2.2000e+01i,  13.0000 + 11.0000i


Integral
========
   Description: 
       Computes the definite integral of a function using adaptive Gauss-LegendreP quadrature.
   Param: 
      | fun:  The function to integrate. The function should accept a double and return a double.
      | x_1:  The lower bound of the integration interval.
      | x_2:  The upper bound of the integration interval.
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the definite integral.
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration interval.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x) = x^2, which can be expressed as:

       .. math::
          \int_{x_1}^{x_2} x^2 \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double> f = (x) => x * x;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral(f, x_1, x_2);
          // Print the result
          Console.WriteLine($"The integral of x^2 is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral of x^2 is approximately: 0.333333333321056
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


Integral2
=========
   Description: 
       Computes the definite double integral of a function over a region where both y-bounds are defined by functions of x, using adaptive Gauss-LegendreP quadrature.
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
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the double integral.
      |  The integration is performed over the region defined by x_1 <= x <= x_2 and y_1(x) <= y <= y_2(x).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, and both y_1(x) and y_2(x) should be smooth functions. Additionally, y_1(x) should be less than or equal to y_2(x) for all x in the interval [x_1, x_2] to ensure a valid integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x, y) = x * y over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{\sqrt{x}} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral is approximately: 0.0833333333277262

   ..note::
       If the any of the boundary of y is a constant, it can be defined as a lambda function that returns the constant value as shown below:



   Example: 
        Integrate the function f(x, y) = x * y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{1}^{2} x y \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double> f = (x, y) => x * y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Set the lower bound of y
          Func<double, double> y_1 = x => 1;
          // Set the upper bound of y
          Func<double, double> y_2 = x => 2;
          // Calculate the integral
          double integral = Integral2(f, x_1, x_2, y_1, y_2);
          // Print the result
          Console.WriteLine($"The integral of x*y is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The integral of x*y is approximately: 0.749999999948747
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentException is Thrown when y_1(x) is greater than y_2(x) for any x in the interval [x_1, x_2].


Integral3
=========
   Description: 
       Computes the definite triple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-LegendreP quadrature.
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
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the triple integral.
      |  The integration is performed over the region defined by x_1 <= x <= x_2, y_1(x) <= y <= y_2(x), and z_1(x, y) <= z <= z_2(x, y).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, y_1(x), y_2(x), z_1(x, y), and z_2(x, y) should be smooth functions. 
      |  Ensure that y_1(x) <= y_2(x) and z_1(x, y) <= z_2(x, y) throughout the integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to sqrt(x), and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{\sqrt{x}}  \int_{xy}^{x+y} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Define the upper bound of y as a function of x
          Func<double, double> y_2 = (x) => Sqrt(x);
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately: 0.0641203694008985

   ..note::
       If any of boundaries of y or z is a constant, it can be defined as a lambda function that returns the constant value as shown below:



   Example: 
        Integrate the function f(x, y, z) = x * y * z over the region where x ranges from 0 to 1, y ranges from x^2 to 2, and z ranges from x*y to x+y, which can be expressed as:

       .. math::
          \int_{0}^{1} \int_{x^{2}}^{2}  \int_{xy}^{x+y} x y z \, dz \, dy \, dx

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double> f = (x, y, z) => x * y * z;
          // Define the lower bound of y as a function of x
          Func<double, double> y_1 = (x) => x * x;
          // Set the upper bound of y
          Func<double, double> y_2 = (x) => 2;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double> z_1 = (x, y) => x * y;
          // Define the upper bound of z as a function of x and y
          Func<double, double, double> z_2 = (x, y) => x + y;
          // Set the lower bound of x
          double x_1 = 0;
          // Set the upper bound of x
          double x_2 = 1;
          // Calculate the integral
          double integral = Integral3(f, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The triple integral of x*y*z is approximately: {integral}");

      Output: 


       .. code-block:: Terminal 

          The triple integral of x*y*z is approximately:  1.56851851820977
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.


Integral4
=========
   Description: 
       Computes the definite quadruple integral of a function over a region where the y-bounds are defined by functions of x, and the z-bounds are defined by functions of x and y, using adaptive Gauss-LegendreP quadrature.
   Param: 
      | fun:  The function to integrate. The function should accept four doubles (w, x, y, z) and return a double.
      | w_1:  The lower bound of the w integration.
      | w_2:  The upper bound of the w integration.
      | x_1:  A function that defines the lower bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
      | x_2:  A function that defines the upper bound of the x integration as a function of w. It should accept a double (w) and return a double (x).
      | y_1:  A function that defines the lower bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
      | y_2:  A function that defines the upper bound of the y integration as a function of w and x. It should accept two doubles (w, x) and return a double (y).
      | z_1:  A function that defines the lower bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
      | z_2:  A function that defines the upper bound of the z integration as a function of w, x and y. It should accept three doubles (w, x, y) and return a double (z).
      | eps:  The desired relative accuracy. The default value is 1e-6.
   Returns: 
       The approximate value of the definite triple integral.
   Remark: 
      |  This method uses adaptive Gauss-LegendreP quadrature to approximate the quadruple integral.
      |  The integration is performed over the region defined by w_1 <= w <= w_2, x_1(w) <= x <= x_2(w), y_1(w, x) <= y <= y_2(w, x), and z_1(w, x, y) <= z <= z_2(w, x, y).
      |  The number of quadrature points is increased until the desired relative accuracy is achieved or a maximum number of iterations is reached.
      |  For best results, the function should be smooth within the integration region, x_1(w), x_2(w),  y_1(w, x), y_2(w, x), z_1(w, x, y), and z_2(w, x, y) should be smooth functions. 
      |  Ensure that x_1(w) <= x_2(w),  y_1(w, x) <= y_2(w, x) and z_1(w, x, y) <= z_2(w, x, y) throughout the integration region.
      |  If x_1 equals x_2 then the method will return 0.
   Example: 
        To compute the volume of a sphere in 4D: :math:`f(w, x, y, z) = 1` over the region where w ranges from -1 to 1, x ranges from :math:`-\sqrt{1-w^2}` to :math:`\sqrt{1-w^2}`, y ranges from :math:`-\sqrt{1-w^2-x^2}` to :math:`\sqrt{1-w^2-x^2}`, and z ranges from :math:`-\sqrt{1-w^2-x^2-y^2}` to :math:`\sqrt{1-w^2-x^2-y^2}`, which can be expressed as:

       .. math::
          \int_{-1}^{1}\int_{-\sqrt{1-w^{2}}}^{\sqrt{1-w^{2}}} \int_{-\sqrt{1-w^{2}-x^{2}}}^{\sqrt{1-w^{2}-x^{2}}} \int_{-\sqrt{1-w^{2}-x^{2}-y^{2}}}^{\sqrt{1-w^{2}-x^{2}-y^{2}}} \, dz \, dy \, dx \, dw

       .. code-block:: CSharp 

          // import libraries
          using System;
          using SepalSolver.Math;
      
          // Define the function to integrate
          Func<double, double, double, double, double> f = (w, x, y, z) => 1;
          // Define the lower bound of z as a function of x and y
          Func<double, double, double, double> z_1 = (w, x, y) => -Sqrt(1 - w*w - x*x - y*y);
          // Define the upper bound of z as a function of x and y
          Func<double, double, double, double> z_2 = (w, x, y) => Sqrt(1 - w*w - x*x - y*y);
          // Define the lower bound of y as a function of x
          Func<double, double, double> y_1 = (w, x) => -Sqrt(1 - w*w - x*x);
          // Define the upper bound of y as a function of x
          Func<double, double, double> y_2 = (w, x) => Sqrt(1 - w*w - x*x);
          // Define the lower bound of x as a function of w
          Func<double, double> x_1 = (w) => -Sqrt(1 - w*w);
          // Define the upper bound of x as a function of w
          Func<double, double> x_2 = (w) => Sqrt(1 - w*w);
          // Set the lower bound of w
          double w_1 = -1;
          // Set the upper bound of w
          double w_2 = 1;
          // Calculate the integral
          double integral = Integral4(f, w_1, w_2, x_1, x_2, y_1, y_2, z_1, z_2);
          // Print the result
          Console.WriteLine($"The approximate volume of a 4D sphere: {integral}");
          Console.WriteLine($"The exact volume of a 4D sphere: {pi*pi/2}");

      Output: 


       .. code-block:: Terminal 

          The approximate volume of a 4D sphere: 4.93483151454187
          The exact volume of a 4D sphere: 4.93480220054468
|   cref=System.ArgumentNullException is Thrown when the  fun is null.
|   cref=System.ArgumentNullException is Thrown when the  x_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  x_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  y_2 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_1 is null.
|   cref=System.ArgumentNullException is Thrown when the  z_2 is null.
|   cref=System.Exception is Thrown when the maximum number of iterations is reached without achieving the desired accuracy.
