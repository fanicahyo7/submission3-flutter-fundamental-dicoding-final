import 'package:sqflite/sqflite.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';

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

  static const String _tblBookmark = 'bookmarks';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/favoriteResto.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblBookmark (
             url TEXT PRIMARY KEY,
             author TEXT,
             title TEXT,
             description TEXT,
             urlToImage TEXT,
             publishedAt TEXT,
             content TEXT
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initializeDb();
    }

    return _database;
  }

  Future<void> insertBookmark(Restaurants article) async {
    final db = await database;
    await db.insert(_tblBookmark, article.toJson());
  }

  Future<List<Restaurants>> getBookmarks() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tblBookmark);

    return results.map((res) => Restaurants.fromJson(res)).toList();
  }

  Future<Map> getBookmarkByUrl(String url) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [url],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeBookmark(String url) async {
    final db = await database;

    await db.delete(
      _tblBookmark,
      where: 'id = ?',
      whereArgs: [url],
    );
  }
}
