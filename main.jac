import math;
class Calculator {
    def __init__(self: Calculator) {
        self.history = [];
    }
    def add(self: Calculator, a: Any, b: Any) {
        result = (a + b);
        self.history.append(f" {a} ' + ' {b} ' = ' {result} ");
        return result;
    }
    def subtract(self: Calculator, a: Any, b: Any) {
        result = (a - b);
        self.history.append(f" {a} ' - ' {b} ' = ' {result} ");
        return result;
    }
    def multiply(self: Calculator, a: Any, b: Any) {
        result = (a * b);
        self.history.append(f" {a} ' × ' {b} ' = ' {result} ");
        return result;
    }
    def divide(self: Calculator, a: Any, b: Any) {
        if (b == 0) {
            return 'Error: Division by zero!';
        }
        result = (a / b);
        self.history.append(f" {a} ' ÷ ' {b} ' = ' {result} ");
        return result;
    }
    def power(self: Calculator, a: Any, b: Any) {
        result = (a ** b);
        self.history.append(f" {a} ' ^ ' {b} ' = ' {result} ");
        return result;
    }
    def square_root(self: Calculator, a: Any) {
        if (a < 0) {
            return 'Error: Cannot calculate square root of negative number!';
        }
        result = math.sqrt(a);
        self.history.append(f" '√' {a} ' = ' {result} ");
        return result;
    }
    def factorial(self: Calculator, a: Any) {
        if (a < 0) {
            return 'Error: Factorial not defined for negative numbers!';
        }
        if ((a == 0) or (a == 1) ) {
            result = 1;
        } else {
            result = math.factorial(int(a));
        }
        self.history.append(f" {a} '! = ' {result} ");
        return result;
    }
    """Display calculation history"""
    def show_history(self: Calculator) {
        if not self.history {
            print('No calculations in history!');
            return;
        }
        print('\n--- Calculation History ---');
        for (i, calculation) in enumerate(self.history, 1) {
            print(f" {i} '. ' {calculation} ");
        }
    }
    """Clear calculation history"""
    def clear_history(self: Calculator) {
        self.history.clear();
        print('History cleared!');
    }
}
def main() {
    calc = Calculator();
    print('=== Enhanced Calculator ===');
    while True {
        print('\nOperations available:');
        print('1. Addition (+)');
        print('2. Subtraction (-)');
        print('3. Multiplication (×)');
        print('4. Division (÷)');
        print('5. Power (^)');
        print('6. Square Root (√)');
        print('7. Factorial (!)');
        print('8. Show History');
        print('9. Clear History');
        print('10. Exit');
        choice = input('Enter your choice (1-10): ');
        if (choice == '10') {
            print('Goodbye!');
            break;
        } elif (choice == '8') {
            calc.show_history();
            continue;
        } elif (choice == '9') {
            calc.clear_history();
            continue;
        }
        try {
            if (choice in ['1', '2', '3', '4', '5']) {
                a = float(input('Enter first number: '));
                b = float(input('Enter second number: '));
                if (choice == '1') {
                    result = calc.add(a, b);
                } elif (choice == '2') {
                    result = calc.subtract(a, b);
                } elif (choice == '3') {
                    result = calc.multiply(a, b);
                } elif (choice == '4') {
                    result = calc.divide(a, b);
                } elif (choice == '5') {
                    result = calc.power(a, b);
                }
                print(f" 'Result: ' {result} ");
            } elif (choice == '6') {
                a = float(input('Enter number: '));
                result = calc.square_root(a);
                print(f" 'Result: ' {result} ");
            } elif (choice == '7') {
                a = int(float(input('Enter integer: ')));
                result = calc.factorial(a);
                print(f" 'Result: ' {result} ");
            } else {
                print('Invalid choice! Please try again.');
            }
        } except ValueError {
            print('Please enter valid numbers!');
        } except Exception as e {
            print(f" 'An error occurred: ' {e} ");
        }
    }
}
with entry {
    if (__name__ == '__main__') {
        main();
    }
}