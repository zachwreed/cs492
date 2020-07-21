import 'dart:math';

class Magic8Ball {
  final List<String> _values = [
    "Unlikely but possible",
    "The future is uncertain",
    "Maybe... We'll see",
    "Yes, for sure",
    "Without a doubt",
    "There's a strong possibility"
  ];
  final Random _random = Random();

  String shake() {
    return _values[_random.nextInt(_values.length)];
  }
}
