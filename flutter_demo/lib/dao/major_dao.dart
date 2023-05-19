

class MajorDao {
  static const TABLE_NAME = 'major';
  static const COL_ID = 'MAJ_ID';
  static const COL_NAME = 'Name';
  static String createTable() => '''
  CREATE TABLE IF NOT EXISTS $TABLE_NAME(
    $COL_ID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    $COL_NAME TEXT
  )
  ''';
}
