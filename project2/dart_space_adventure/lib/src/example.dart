void foo({int x, int y}) {
  print(x / y);
}

void stringEx() {
  // use in the case of a null object to String
  Request r;
  String body = r?.body;
}

class Request {
  final String body;
  Request({this.body});
}

// Constructor example
class Ship {
  String name;
  // Ship(String name) {
  //   this.name = name;
  // }

  // Ship(String name) : this.name = name;

  // Ship(this.name);
}

// Subclass Example
class Freighter extends Ship {
  int capacity;
}
