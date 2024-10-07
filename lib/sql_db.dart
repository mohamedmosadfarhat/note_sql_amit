import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  intialDb() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "note.db");
    Database mydb =
        await openDatabase(databasePath, version: 1, onCreate: _oncreate);
    return mydb;
  }

  _oncreate(Database db, version) {
    db.execute('''
    CREATE TABLE 'notes' (
      id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
      note TEXT NOT NULL 
    )  
     ''');
    print("data base created");
  }



  insertData(String sql) async {
    Database db = await intialDb();
    int res = await db.rawInsert(sql);
    return res;
  }

  readDadta(String sql) async {
    Database db = await intialDb();
    List<Map> res = await db.rawQuery(sql);
    return res;
  }

  deleteData(String sql) async {
    Database db = await intialDb();
    int res = await db.rawDelete(sql);
    return res;
  }

  updateData(String sql) async {
    Database db = await intialDb();
    int res = await db.rawUpdate(sql);
    return res;
  }
}
