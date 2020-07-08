class Planet {
  final String name;
  final String description;

  // Constructor
  Planet({this.name, this.description});

  Planet.nullPlanet()
      : name = 'null',
        description = 'null';
}
