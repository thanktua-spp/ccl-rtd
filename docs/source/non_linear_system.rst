Non Linear System
=================

.. _installation:

Equation
------------

.. math::
 3x_1 - cos(x_2 x_3) - \frac{1}{2} = 0
x_1^2 - 81(x_2+0.1)^2 + sin(x_3) + 1.06 = 0
e^{x_1x_2} + 20x_3 + \frac{10\pi-3}{3} = 0

x = [0.1, 0.1, -0.1]^T


Using tabs
----------

You can use tabs to display code in multiple languages. For example:

.. tabs::

   .. tab:: CCL-Maths

      This is how to write code in CCL-Maths.

      .. code-block:: python

         import lumache
         lumache.get_random_ingredients()
         # Output: ['shells', 'gorgonzola', 'parsley']

   .. tab:: Python

      This is how to write code in Python.

      .. code-block:: python

         import lumache
         lumache.get_random_ingredients()
         # Output: ['shells', 'gorgonzola', 'parsley']

   .. tab:: Matlab

      This is how to write code in Matlab.

      .. code-block:: matlab

         disp('This is an example of Matlab code.')
