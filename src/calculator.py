"""
Simple calculator module for demonstration purposes.
This will be used with Robot Framework tests in a Jenkins pipeline.
"""

class Calculator:
    """A simple calculator class with basic arithmetic operations."""
    
    def add(self, a, b):
        """Add two numbers and return the result."""
        return a + b
    
    def subtract(self, a, b):
        """Subtract b from a and return the result."""
        return a - b
    
    def multiply(self, a, b):
        """Multiply two numbers and return the result."""
        return a * b
    
    def divide(self, a, b):
        """Divide a by b and return the result.
        
        Raises:
            ZeroDivisionError: If b is zero.
        """
        if b == 0:
            raise ZeroDivisionError("Cannot divide by zero")
        return a / b


if __name__ == "__main__":
    # Simple demonstration
    calc = Calculator()
    print(f"5 + 3 = {calc.add(5, 3)}")
    print(f"10 - 4 = {calc.subtract(10, 4)}")
    print(f"7 * 6 = {calc.multiply(7, 6)}")
    print(f"15 / 3 = {calc.divide(15, 3)}")
