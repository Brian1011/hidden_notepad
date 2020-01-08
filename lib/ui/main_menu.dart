import 'package:diary/database/database_helper.dart';
import 'package:diary/models/notes.dart';
import 'package:flutter/material.dart';
class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //final dbHelper = DatabaseHelper.instance;

    // insert data
    Note note = new Note("Hi Brian", "1/1/2019");
    print("NOte "+note.text);
    //print(dbHelper.insertNotes(note));
    //int result = dbHelper.insertNotes(note);
    //print("results: "+result.toString());

    // view all
    //List<Note> notes = databaseHelper.getAllNotes();
    print(dbHelper.getAllNotes().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Diary',),
        elevation: 0,
        backgroundColor: Colors.black87,
        // add gradient
      ),
      body: Container(
            decoration: BoxDecoration(
                color: Colors.grey[800]
            ),
        child: ListView(
          children: <Widget>[
            Card(
              color: Colors.black45,
              elevation: 4,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.edit, color: Colors.grey[600],),
                title: Text('Random Story...', style: TextStyle(color: Colors.white),),
                subtitle: Text('7th Janauary 2020',style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/newLeaf");
        },
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.grey,
        elevation: 30,
      ),
    );
  }
}
