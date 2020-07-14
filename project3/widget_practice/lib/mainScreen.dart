import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String title;

  // Constructor takes key to use as widget ID in constructor
  const MainScreen({Key key, this.title}) : super(key: key);

  // Override build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [banner(context), placeHolderRow(), placeHolderRow()],
      ),
    );
  }

  Widget banner(BuildContext context) {
    return Text(
      'Bart!',
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Widget placeHolderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [paddedPlaceHolder(), paddedPlaceHolder()],
    );
  }

  Widget paddedPlaceHolder() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        child: Placeholder(),
        width: 100,
        height: 100,
      ),
    );
  }
}
