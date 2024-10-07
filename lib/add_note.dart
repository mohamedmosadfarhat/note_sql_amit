import 'package:flutter/material.dart';
import 'package:note_app_amit/home_page.dart';
import 'package:note_app_amit/sql_db.dart';

class AddNote extends StatelessWidget {
  AddNote({Key? key}) : super(key: key);
  static String id = "AddNote";
  late String note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("add note"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
            child: TextField(
              onChanged: (Value) {
                note = Value;
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                int res = await SqlDb().insertData('''
                 INSERT INTO 'notes' (note) VALUES ('$note')
                 ''');
                print(res);
                Navigator.of(context).pushNamed(HomePAge.id);
              },
              child: Text("add note"))
        ],
      ),
    );
  }
}
