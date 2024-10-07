import 'package:flutter/material.dart';
import 'package:note_app_amit/add_note.dart';
import 'package:note_app_amit/home_page.dart';
import 'package:note_app_amit/sql_db.dart';
import 'package:note_app_amit/update_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SqlDb().intialDb();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePAge(),
      routes: {
        AddNote.id:(context)=>AddNote(),
        HomePAge.id:(context)=>HomePAge(),
        UpdateData.id:(context)=>UpdateData()
      },
    );
  }
}




