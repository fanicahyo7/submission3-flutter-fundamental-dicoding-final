import 'package:sqflite/sqflite.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/resto_db.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  DatabaseHelper._createObject();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createObject();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/favoriteResto.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             id TEXT PRIMARY KEY,
             judul TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertBookmark(Resto article) async {
    final db = await database;
    await db.insert(_tblBookmark, article.toMap());
  }

  Future<List<Resto>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblBookmark);

    return results.map((res) => Resto.fromMap(res)).toList();
  }

  Future<Resto> getBookmarkById(String id) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );

     return results.map((res) => Resto.fromMap(res)).first;
  }

  Future<void> updateNote(Resto note) async {
    final db = await database;

    await db.update(
      _tblBookmark,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> removeBookmark(String id) async {
    final db = await database;

    await db.delete(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
