import pytest
from calc.calculator import add, subtract, multiply, divide, power, root

def test_add():
    assert add(1, 2) == 3
    assert add(-1, 1) == 0
    assert add(-1, -1) == -2

def test_subtract():
    assert subtract(10, 5) == 5
    assert subtract(-1, 1) == -2
    assert subtract(-1, -1) == 0

def test_multiply():
    assert multiply(3, 3) == 9
    assert multiply(-1, 3) == -3
    assert multiply(-1, -1) == 1

def test_divide():
    assert divide(10, 2) == 5
    with pytest.raises(ValueError):
        divide(10, 0)
    assert divide(-4, 2) == -2

def test_power():
    assert power(2, 2) == 4
    assert power(2, 3) == 8
    assert power(2, 4) == 16

def test_root():
    assert root(4, 2) == 2
    assert root(8, 3) == 2
    assert root(16, 4) == 2