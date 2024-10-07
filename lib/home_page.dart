import 'package:flutter/material.dart';
import 'package:note_app_amit/add_note.dart';
import 'package:note_app_amit/sql_db.dart';
import 'package:note_app_amit/update_data.dart';

class HomePAge extends StatefulWidget {
  const HomePAge({Key? key}) : super(key: key);
  static String id = "homepage";
  @override
  State<HomePAge> createState() => _HomePAgeState();
}

class _HomePAgeState extends State<HomePAge> {
  Future<List<Map>> getData() async {
    List<Map> data = await SqlDb().readDadta("SELECT * FROM 'notes'");
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddNote.id);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("notes"),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(UpdateData.id,
                          arguments: snapshot.data![index]["id"]);
                    },
                    onLongPress: () {
                      SqlDb().deleteData('''
                      DELETE FROM 'notes' WHERE id='${snapshot.data![index]["id"]}'

                      ''');
                      Navigator.of(context).pushNamed(HomePAge.id);
                    },
                    child: Card(
                      child: ListTile(
                          title: Text("${snapshot.data![index]["note"]}")),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
