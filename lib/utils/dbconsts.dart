class DbConstants {
  static const String dbName = 'notes.db';
  static const int dbVersion = 1;
  static const String noteId = '_id';
  static const String noteTitle = 'title';
  static const String noteBody = 'body';
  static const String tableName = 'NOTE';

  static const String createTableCommand = '''
    CREATE TABLE $tableName (
    $noteId INTEGER PRIMARY KEY AUTOINCREMENT,
    $noteTitle TEXT NOT NULL,
    $noteBody TEXT
)
''';
}
