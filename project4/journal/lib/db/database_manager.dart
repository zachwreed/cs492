import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';

class DatabaseManager {
  // hide public constructor to control number of instances.
  // expose 1 static getInstance value
  static DatabaseManager _instance;
  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SCHEMA_FILENAME = 'assets/schema_1.sql.txt';
  static const String SQL_INSERT_ENTRY =
      'INSERT INTO journal_entries(title, body, rating, date) VALUES (?, ?, ?, ?)';
  static const String SQL_GET_ENTRIES = 'SELECT * FROM journal_entries';

  final Database db;

  // Once naming a constructor, the default constructor is no longer used. This is a private constructor.
  DatabaseManager._({Database database}) : db = database;

  // class is a singleton
  factory DatabaseManager.getInstance() {
    // if not exists, instantiate
    assert(_instance != null);
    return _instance;
  }

  // Make sure to call before other dbm calls
  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME, version: 1,
        onCreate: (Database db, int version) async {
      // Open file and read create statement to string
      final String createSchema = await rootBundle.loadString(SCHEMA_FILENAME);

      // Seed database with schema
      createTables(db, createSchema);
    });
    _instance = DatabaseManager._(database: db);
  }

  // Creates tables in db
  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  // Saves journal entry to db
  void saveJournalEntry(JournalEntry entry) {
    db.transaction((txn) async {
      await txn.rawInsert(SQL_INSERT_ENTRY,
          [entry.title, entry.body, entry.rating, entry.date.toString()]);
    });
  }

  // Gets journal entries map and returns mapped entries object
  Future<List<JournalEntry>> getJournalEntries() async {
    final journalRecords = await db.rawQuery(SQL_GET_ENTRIES);

    final journalEntries = journalRecords.map((record) {
      return JournalEntry(
        title: record['title'],
        body: record['body'],
        rating: record['rating'],
        date: DateTime.parse(record['date']),
      );
    }).toList();
    return journalEntries;
  }
}
