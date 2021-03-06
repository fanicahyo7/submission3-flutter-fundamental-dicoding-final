import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/db_provider.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/resto_db.dart';

class NoteAddUpdatePage extends StatefulWidget {
  final Resto note;

  NoteAddUpdatePage([this.note]);

  @override
  _NoteAddUpdatePageState createState() => _NoteAddUpdatePageState();
}

class _NoteAddUpdatePageState extends State<NoteAddUpdatePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  bool _isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note.title;
      _descriptionController.text = widget.note.id;
      _isUpdate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul',
              ),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Simpan'),
                onPressed: () async {
                  // TODO : Tambahkan kode untuk menyimpan atau mengedit note
                  if (!_isUpdate) {
                    final note = Resto(
                      title: _titleController.text,
                      id: _descriptionController.text,
                    );
                    Provider.of<DbProvider>(context, listen: false)
                        .addNote(note);
                  } else {
                    final note = Resto(
                      id: widget.note.id,
                      title: _titleController.text,
                    );
                    Provider.of<DbProvider>(context, listen: false)
                        .updateNote(note);
                  }
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
