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

  static String _tableName = 'restofavorite';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/resto.db',
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
               id TEXT PRIMARY KEY,
               title TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertRestoFav(Resto resto) async {
    final Database db = await database;
    await db.insert(_tableName, resto.toMap());
    print('Data saved');
  }

  Future<List<Resto>> getRestoFav() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => Resto.fromMap(res)).toList();
  }
}
