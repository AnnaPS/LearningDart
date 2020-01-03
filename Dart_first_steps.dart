import 'dart:convert';

void main() async{
  // ----- First variable ----------------------------------------------
  var name = 'Ana';
  print('Hello $name');
  // ----end first variable---------------------------------------------

  // ----- Types of data -----------------------------------------------
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
  //--------end type of data --------------------------------------------

  // ------- Functions --------------------------------------------------
  sayHello();
  print(sayHelloReturnString());
  print(sayHelloWithArguments('Ana', "Hola"));
  print(sayHelloWithArgumentsAndSetValue(name: 'Ana', text: 'Hola'));

  //--------end funtions ------------------------------------------------

  // --------- Classes --------------------------------------------------

  final elliotAlderson = new MrRobot(name: 'Elliot', isWhiteRose: false);
  print(elliotAlderson.toString());

  final captainAmerica = new Marvel(name: 'Captain America', power: 'Fighter');
  print(captainAmerica);

  final villain = new Villain();
  villain.setName = 'Lex Luthor';
  print(villain);

  // This is an example to response of an API in Json format.
  final jsonObject = '{"name" : "Spiderman", "power": "fly"}';
  // Decode json into a map
  Map parsedJson = json.decode(jsonObject);
  // Call the constructor name to create new object with json data.
  final spiderman = new Marvel.fromJson(parsedJson);
  print(spiderman);

  final square = new Square();
  square.side = 10;
  print(square);
  // This example throw an exception
  //square.side = 0;
  //print(square);
  print('Area ${square.area}');

  // ------ end classes --------------------------------------------------

  // ------ Abstract classes ---------------------------------------------
  final dog = new Dog();
  print(dog.makeASound());
  // ------ end abstract classes -----------------------------------------

  // ------ Mixins classes ---------------------------------------------
  // Mixins are a way of reusing a classes code in multiple class hierarchies.
  final cat = new Cat();
  print(cat.walk());
  print(cat.makeASound());
  // ------ end mixins classes -----------------------------------------

  // ------ Futures , Async, Await --------------------------------------------
  // 1. Futurees are essential in asynchronous tasks. These are tasks that are executed in a different thread from the main one and when that action ends, other threads can continue to be executed in the main thread.

  // 2. Async its helps transform a function into an asynchronous task. 
  
  // 3. Await helps to wait until the async task is resolved
  
  print('Start future task');
  // Four seconds later will be show data wich is text into a callback in the future method.
 // Example without async
  httpGet("https://www.this_url_return_nothing.com").then((data) {
    print('-----------------------');
    print(data);
    print('-----------------------');
  });
  
  // Example with async (put async in main method)
  print('Start future async task ');
  String data = await httpGet("https://www.this_url_return_nothing.com");
  print(data);
  print('end future async task');

  // ------ end futures, Async, Await ------------------------------------
}

// ------ End MAIN -------------------------------------------------------

//--------- Functions block ----------------------------------------------
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

//-------- end functions block ----------------------------------------

// ------- Classes block ----------------------------------------------

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
    if (isWhiteRose) {
      return 'Hi ${this.name} , do u know who WhiteRose is? : Yes';
    } else {
      return 'Hi ${this.name},  do u know who WhiteRose is? : No';
    }
  }
}

class Marvel {
  String name;
  String power;

  Marvel({this.name, this.power});

  // override toString method
  String toString() {
    return 'Name of heroe : $name / power: $power';
  }

  // Constructor with name
  Marvel.fromJson(Map parsedJson) {
    name = parsedJson['name'];
    power = parsedJson['power'];
  }
}

class Villain extends Character {
  bool _evil;

  Villain({name, evil});

  set setPower(String value) {
    power = value;
  }

  set setName(String value) {
    name = value;
  }

  set setEvil(bool value) {
    _evil = value;
  }

  // override toString method
  String toString() {
    return 'Name of villain : $name / power: $power';
  }
}

// This class will be base of other classes.
class Character {
  String name;
  String power;
}

class Square {
  //With _ we convert this property into a private property. This property        can't be accessed outside this class.
  double _side;

  // Set method
  set side(double value) {
    if (value <= 0) {
      throw ('Side can\'t be lower or equal than 0');
    } else {
      _side = value;
    }
  }

  // Get method
  double get area => _side * _side;

  toString() => 'Side: $_side';
}

class Dog implements Animal {
  String color;
  int legs;

  String makeASound() => 'GUAAAAAAUUUU';
}

//-------- end classes block ---------------------------------------

// -------- Abstract classes block ---------------------------------
abstract class Animal {
  int legs;
  String makeASound();
}

abstract class Mammal extends Animal {}

abstract class Bird extends Animal {}

abstract class Fish extends Animal {}

//-------- end abstract classes block ----------------------------

// -------- Mixins classes block ---------------------------------

abstract class Walker {
  String walk() => ("This animal can walk");
}

abstract class Swimmer {
  String swim() => ("This animal can swim");
}

abstract class Flying {
  String fly() => ("This animal can fly");
}

class Dolphin extends Mammal with Swimmer {
  @override
  String makeASound() => 'I\'m a dolphin';
}

class Bat extends Mammal with Walker, Flying {
  @override
  String makeASound() => 'I\'m a bat';
}

class Cat extends Mammal with Walker {
  @override
  String makeASound() => 'I\'m a cat, miauuuuu';
}

class Parrot extends Bird with Walker, Flying {
  @override
  String makeASound() => 'I\'m a parrot';
}

class Shark extends Fish with Swimmer {
  @override
  String makeASound() => 'I\'m a shark';
}
//-------- end Mixins classes block ------------------------------

// -------- Futures block ----------------------------------------
// This is an example of http response

Future<String> httpGet(String url) {
  return Future.delayed(new Duration(seconds: 4), () {
    return 'Hi, i\'m future task';
  });
}
//-------- end futures block -------------------------------------
