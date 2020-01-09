import 'dart:async';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:diary/util/constants.dart';
import 'package:diary/models/notes.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final DatabaseHelper _INSTANCE = new DatabaseHelper();
  factory DatabaseHelper() => _INSTANCE;
  static Database _db;
  DatabaseHelper.make();

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, Constants.DBNAME);
    var myDb = openDatabase(path, version: Constants.DB_VERSION, onCreate: _onCreate);
    return myDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("create table ${Constants.TABLE_NAME} (${Constants.COLUMN_ID} INTEGER PRIMARY KEY,${Constants.COLUMN_TEXT} TEXT, ${Constants.COLUMN_DATE} TEXT);");
  }

  // insert new note
  Future insertNotes(Note note) async {
    var dbClient = await db;
    int count = await dbClient.insert(Constants.TABLE_NAME, note.toMap());
    //print("Insert Data "+count.toString());
    return count;
  }

  // get all notes
  Future<List> getAllNotes() async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("select * from ${Constants.TABLE_NAME} ORDER BY ${Constants.COLUMN_TEXT} ASC");
    //result.forEach((row)=>print(row));
    return result.toList();
  }

  // count number of rows
  Future<int> queryRowCount() async{
    var dbClient = await db;
    int count = Sqflite.firstIntValue(await dbClient.rawQuery("select count(*) from ${Constants.TABLE_NAME}"));
    return count;
  }

  // single note via id
  Future<Note> getSingleItem(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("select * from ${Constants.TABLE_NAME} WHERE ${Constants.COLUMN_ID} = $id");
    if(result == null) return null;
    return new Note.fromMap(result.first);
  }

  // delete particular object
  Future<int> deleteItem(int id) async {
    var dbClient = await db;
    int count = await dbClient.delete(Constants.TABLE_NAME, where: "${Constants.COLUMN_ID}=?", whereArgs: [id]);
    return count;
  }

  // update note
  Future<int> updateItem(Note note) async{
    var dbClient = await db;
    int count = await dbClient.update(Constants.TABLE_NAME, note.toMap(), where: "${Constants.COLUMN_ID}=?", whereArgs: [note.id]);
    return count;
  }


}