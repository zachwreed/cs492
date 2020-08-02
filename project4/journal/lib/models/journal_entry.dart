import 'package:intl/intl.dart';

// Models for Journal and Journal Entries

class JournalEntry {
  int id;
  String title;
  String body;
  int rating;
  DateTime date;

  JournalEntry({this.id, this.title, this.body, this.rating, this.date});

  String getDateString() {
    return DateFormat.yMEd().format(date);
  }
}

class Journal {
  List<JournalEntry> entries;

  Journal({this.entries});

  bool isEmpty() {
    if (entries.length < 1) {
      return true;
    }
    return false;
  }
}
