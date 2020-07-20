import 'dart:math';

class Die {
  Random random = Random();
  final int numberOfSides;
  int currentValue = 0;

  Die({this.numberOfSides = 4});

  void roll() {
    currentValue = random.nextInt(numberOfSides) + 1;
  }
}
