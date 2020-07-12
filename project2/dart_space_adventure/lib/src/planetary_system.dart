import 'dart:math';

import 'package:dart_space_adventure/dart_space_adventure.dart';

import 'planet.dart';

class PlanetarySystem {
  final _random = Random();
  final String name;
  final List<Planet> planets;

  // Constructor
  PlanetarySystem({this.name, this.planets});

  // Other constructor
  // PlanetarySystem({this.name = 'Unnamed System', this.planets = const []});

  int get numPlanets => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  Planet getRandomPlanet() {
    if (hasPlanets) {
      return planets[_random.nextInt(planets.length)];
    } else {
      return Planet(name: 'null', description: 'null');
    }
  }

  Planet planetWithName(String name) {
    var planetRet;

    planets.forEach((planet) {
      if (planet.name == name) {
        planetRet = planet;
      }
    });

    if (planetRet != null) {
      return planetRet;
    } else {
      return Planet(name: 'null', description: 'null');
    }
  }
}
