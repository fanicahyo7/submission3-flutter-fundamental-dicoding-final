import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/db_provider.dart';
import 'package:provider/provider.dart';

import 'coba_add.dart';

class RestaurantFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbProvider(),
      child: Scaffold(
        body: Consumer<DbProvider>(
          builder: (context, provider, child) {
            final notes = provider.notes;
            return ListView(
              children: notes
                  .map((e) => Column(
                        children: [Text(e.id.toString())],
                      ))
                  .toList(),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NoteAddUpdatePage()));
        },
      ),
      ),
    );
  }
}
