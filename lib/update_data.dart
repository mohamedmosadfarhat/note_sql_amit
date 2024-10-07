import 'package:flutter/material.dart';
import 'package:note_app_amit/home_page.dart';
import 'package:note_app_amit/sql_db.dart';

class UpdateData extends StatelessWidget {
  UpdateData({Key? key}) : super(key: key);
  static String id = "UpdateData";
  late String note;
  @override
  Widget build(BuildContext context) {
    int id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("update note"),
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
                int res = await SqlDb().updateData('''
                  UPDATE 'notes' SET note = '$note' WHERE id='$id'
               ''');
                print(res);
                Navigator.of(context).pushNamed(HomePAge.id);
              },
              child: Text("update note"))
        ],
      ),
    );
  }
}
