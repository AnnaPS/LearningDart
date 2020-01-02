void main() {
  // ----- First variable -----
  var name = 'Ana';
  print('Hello $name');
  // --------------------------

  // ----- Types of data ------
  //Numbers
  int number = 10;
  double pi = 3.14;
  var number2 = 1.0;

  print('$number - $pi - $number2');

  // Strings
  String myName = 'Ana';
  print(myName);
  print(myName[1]);
  print(myName[myName.length - 1]);

  //Booleans and conditions
  bool isActive = true;
  if (isActive) {
    print('It\'s working');
  } else {
    print('It\'s not working');
  }

  // List
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);
  numbers.add(6);
  print(numbers);

  // Define size to list.
  List moreNumbers = List(10);
  // When are define a static size we can't use add.
  //  moreNumbers.add(1);

  // We need to access the position and set value.
  moreNumbers[0] = 1;
  print(moreNumbers);
  
  // Map --
  
  //-------------------------------------
}
