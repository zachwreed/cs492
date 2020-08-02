class JournalEntry {
  int id;
  String title;
  String body;
  int rating;
  DateTime date;

  JournalEntry({this.id, this.title, this.body, this.rating, this.date});
}

class Journal {
  List<JournalEntry> entries;

  Journal({this.entries});
}
