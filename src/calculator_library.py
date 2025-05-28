"""
Calculator library for Robot Framework tests.
This file wraps the Calculator class to expose its methods as keywords for Robot Framework.
"""

from robot.api.deco import keyword
from calculator import Calculator

class CalculatorLibrary:
    """
    A library for Robot Framework that wraps the Calculator class.
    This exposes the Calculator methods as keywords that can be used in Robot Framework tests.
    """
    
    def __init__(self):
        self.calculator = Calculator()
    
    @keyword
    def add(self, a, b):
        """Add two numbers and return the result."""
        return self.calculator.add(float(a), float(b))
    
    @keyword
    def subtract(self, a, b):
        """Subtract b from a and return the result."""
        return self.calculator.subtract(float(a), float(b))
    
    @keyword
    def multiply(self, a, b):
        """Multiply two numbers and return the result."""
        return self.calculator.multiply(float(a), float(b))
    
    @keyword
    def divide(self, a, b):
        """Divide a by b and return the result."""
        return self.calculator.divide(float(a), float(b))
