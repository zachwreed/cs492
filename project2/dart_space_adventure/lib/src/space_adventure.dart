import 'package:dart_space_adventure/dart_space_adventure.dart';

import 'dart:io';

class SpaceAdventure {
  PlanetarySystem planetarySystem;

  // Constructor
  SpaceAdventure({this.planetarySystem});

  void start() {
    printGreeting();
    printIntroduction(responseToPrompt('What is your name?'));
    print('Let\s go on an adventure!');

    if (planetarySystem.hasPlanets) {
      travel(destinationPrompt(
          'Shall I randomly choose a planet for you to visit (Y or N)'));
    } else {
      print('There aren\'t any planets to explore');
    }
  }

  bool destinationPrompt(String prompt) {
    String answer;
    while (answer != 'Y' && answer != 'N') {
      answer = responseToPrompt(prompt);

      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I don\'t understand.');
      }
    }
  }

  void travel(bool randomDestination) {
    if (randomDestination) {
      travelToRandomDestination();
    } else {
      travelTo(responseToPrompt('Name the planet you would like to visit'));
    }
  }

  void travelToRandomDestination() {
    if (planetarySystem.hasPlanets) {
      var destination = planetarySystem.getRandomPlanet();

      if (destination.name == 'null' && destination.description == 'null') {
      } else {
        print('Traveling to ${destination.name}...');
        print('Arrived at ${destination.name}. ${destination.description}');
      }
    }
  }

  void travelTo(String planetName) {
    print('Traveling to ${planetName}...');

    var destination = planetarySystem.planetWithName(planetName);

    if (destination.name == 'null' && destination.description == 'null') {
      print(
          'There isn\'t a planet called ${planetName} in the ${planetarySystem.name}');
    } else {
      print('Arrived at ${destination.name}. ${destination.description}');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.numPlanets} to explore');
  }

  void printIntroduction(String name) {
    print(
        'Nice to meet you $name. My name is Eliza, I\'m an old friend of Alexa.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync();
  }
}
