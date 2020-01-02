void main() {
  // ----- First variable -----
  var name = 'Ana';
  print('Hello $name');
  // ----end first variable----

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
  // moreNumbers.add(1);

  // We need to access the position and set value.
  moreNumbers[0] = 1;
  print(moreNumbers);

  // Map
  String property = 'single';
  //Dynamic means that it can be any type of data
  Map<String, dynamic> person = {'name': 'Carlos', 'age': 32, 'single': true};
  print(person['name']);
  print(person['age']);
  print(person[property]);

  person.addAll({'child': false});
  print(person['child']);
  //--------end type of data ------------

  // ------- Functions ------------------
  sayHello();
  print(sayHelloReturnString());
  print(sayHelloWithArguments('Ana', "Hola"));
  print(sayHelloWithArgumentsAndSetValue(name: 'Ana', text: 'Hola'));

  //--------end funtions ----------------

  // --------- Classes ------------------

  final elliotAlderson = new MrRobot(name: 'Elliot', isWhiteRose: false);
  print(elliotAlderson.toString());

  final captainAmerica =
      new Marvel(nameOfHeroe: 'Captain America', power: 'Fighter');
  print(captainAmerica);

  // ------ end classes -----------------
}

//--------- Functions block -------------
sayHello() {
  print('Hello');
}

String sayHelloReturnString() {
  return 'Return Hello';
}

String sayHelloWithArguments(String text, String name) {
  return '$text $name';
}

// By putting {} in the arguments we force the value to be specified for each data. => equals return.
String sayHelloWithArgumentsAndSetValue({String text, String name}) =>
    '$text $name';

//-------- end functions block ---------

// ------- Classes block ---------------

class MrRobot {
  String name;
  bool isWhiteRose;

  // constructor with  'names' arguments
  MrRobot({String name, bool isWhiteRose}) {
    this.name = name;
    this.isWhiteRose = isWhiteRose;
  }

  // override toString method
  String toString() {
    return '${this.name} is WhiteRose? : ${this.isWhiteRose}';
  }
}

class Marvel {
  String nameOfHeroe;
  String power;

  Marvel({this.nameOfHeroe, this.power});

  // override toString method
  String toString() {
    return 'Name of heroe : $nameOfHeroe / power =  $power';
  }
}
