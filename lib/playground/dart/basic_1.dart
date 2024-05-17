var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

int fibonaccii(int n) {
  if (n == 0 || n == 1) return n;
  return fibonaccii(n - 1) + fibonaccii(n - 2);
}

var result = fibonaccii(20);

const pi = 3.1459;

int fibonacci_2(int n) {
  /// Computes the nth Fibonacci number.
  return n < 2 ? n : (fibonacci_2(n - 1) + fibonacci_2(n - 2));
}

void main() {

  if (year >= 2001) {
    print('21st century');
  }
  else if (year >= 1901) {
    print('20th century');
  }
  else {

  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  const i = 20;

  for (final object in flybyObjects) {
    print(object);
  }

//shorthand => (arrow) syntax is handy for functions that contain a single statement.
//This syntax is especially useful when passing anonymous functions as arguments:

  flybyObjects.where((name) => name.contains('turn')).forEach(print);

//Besides showing an anonymous function (the argument to where()), this code shows that you can use a function as an argument: the top-level print() function is an argument to forEach().
//-----------------------------------------------------------------------------
  for (var i = 0; i < 10; i++) {
    print('hello ${i +1 }');
  }
  print('Hello, World!');
  print(pi);
  print('fibonacci_2($i) = ${fibonacci_2(i)}');

}