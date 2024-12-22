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



Using tabs
----------

You can also use tabs to organize your content. For example, here's a

.. tabs::

   .. tab:: CCL-Maths

      This is how to write code in CCL-Maths.

      >>> import lumache
      >>> lumache.get_random_ingredients()
      ['shells', 'gorgonzola', 'parsley']

   .. tab:: Python

      This is how to write code in Python.

      >>> import lumache
      >>> lumache.get_random_ingredients()
      ['shells', 'gorgonzola', 'parsley']

   .. tab:: Matlab

      This is how to write code in Matlab.

      >>> import lumache
      >>> lumache.get_random_ingredients()
      ['shells', 'gorgonzola', 'parsley']