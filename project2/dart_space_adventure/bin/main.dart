import 'package:dart_space_adventure/dart_space_adventure.dart'; // Dart Space Adventure
import 'dart:io';
import 'dart:convert';

import 'package:dart_space_adventure/src/space_adventure.dart';

void main(List<String> arguments) {
  // Return if no file provided
  if (arguments.isEmpty) {
    print('JSON file required for execution');
    return;
  }

  // Get Argument
  String file = arguments[0];

  new File(file)
      .readAsString()
      .then((content) => json.decode(content))
      .then((jsonData) {
    // Create variables for planetary system
    final String systemName = jsonData['name'];
    List<Planet> planets = [];

    // Get planets from jsonData
    jsonData['planets'].forEach((planet) {
      planets.insert(
          0, Planet(name: planet['name'], description: planet['description']));
    });

    // Start space adventure
    SpaceAdventure(
            planetarySystem:
                PlanetarySystem(name: systemName, planets: planets))
        .start();
  });
}
