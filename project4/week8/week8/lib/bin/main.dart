void main() {
  print('a');
  go().then((value) => print(value));
  print('b');
}

Future<int> go() {
  return Future(longRunner);
}

int longRunner() {
  for (var i = 0; i < 5000000000; ++i) {}
  return 42;
}
