class DatabaseManager {
  // hide public constructor to control number of instances.
  // expose 1 static getInstance value

  static DatabaseManager _instance;

  // Once naming a constructor, the default constructor is no longer used. This is a private constructor.
  DatabaseManager._();

  // class is a singleton
  factory DatabaseManager.getInstance() {
    // if not exists, instantiate
    if (_instance == null) {
      _instance = DatabaseManager._();
    }
    return _instance;
  }
}
