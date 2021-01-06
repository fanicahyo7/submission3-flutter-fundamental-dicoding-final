import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/resto_db.dart';

import 'database_helper.dart';

class DbProvider extends ChangeNotifier {
  List<Resto> _notes = [];
  DatabaseHelper _dbHelper;

  List<Resto> get notes => _notes;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllNotes();
  }

  void _getAllNotes() async {
    _notes = await _dbHelper.getBookmarks();
    notifyListeners();
  }

  Future<void> addNote(Resto note) async {
    await _dbHelper.insertBookmark(note);
    _getAllNotes();
  }

  Future<Resto> getNoteById(String id) async {
    return await _dbHelper.getBookmarkById(id);
  }

  void deleteNote(String id) async {
    await _dbHelper.removeBookmark(id);
    _getAllNotes();
  }
}
