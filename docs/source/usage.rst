Usage
=====

.. _installation:

Installation
------------

To use Lumache, first install it using pip:

.. code-block:: console

   (.venv) $ pip install lumache

Creating recipes
----------------

To retrieve a list of random ingredients,
you can use the ``lumache.get_random_ingredients()`` function:

.. autofunction:: lumache.get_random_ingredients

The ``kind`` parameter should be either ``"meat"``, ``"fish"``,
or ``"veggies"``. Otherwise, :py:func:`lumache.get_random_ingredients`
will raise an exception.

.. autoexception:: lumache.InvalidKindError

For example:

>>> import lumache
>>> lumache.get_random_ingredients()
['shells', 'gorgonzola', 'parsley']



Writing Eqautions
-----------------

You can also write equations in your documentation. For example, here's a

.. math::

   \int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}



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

   .. .. tab:: Python

   ..    This is how to write code in Python.

   ..    .. code-block:: python

   ..       import lumache
   ..       lumache.get_random_ingredients()
   ..       # Output: ['shells', 'gorgonzola', 'parsley']

   .. .. tab:: Matlab

   ..    This is how to write code in Matlab.

   ..    .. code-block:: matlab

   ..       disp('This is an example of Matlab code.')
