import 'package:diary/database/database_helper.dart';
import 'package:diary/models/notes.dart';
import 'package:flutter/material.dart';

class ViewStory extends StatefulWidget {
  final int noteId;
  const ViewStory(this.noteId);

  @override
  _ViewStoryState createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  final myController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Retrieve data
    dynamic singleNote = dbHelper.getSingleItem(widget.noteId);
    Future<Note> mine = singleNote;
//    print(singleNote);
//    print("Yellow");
    //print(myNote);

  }

  FutureBuilder myStory(){
    return FutureBuilder<Note>(
      future: dbHelper.getSingleItem(widget.noteId),
      builder: (BuildContext context, AsyncSnapshot<Note> snapshot){
        if(snapshot.hasData){
//          print(snapshot.data.id);
          myController.text = snapshot.data.text;
          return TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: myController,
            decoration: InputDecoration.collapsed(hintText: "Enter your text here", hintStyle: TextStyle(color: Colors.white, letterSpacing: 1.8,
                fontSize: 18.0)),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.8,
                fontSize: 18.0
            ),
          );
        }else if(snapshot.hasError){
          return dialog("Error", "Can't load note");
        } else {
          return Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10.0,),
                SizedBox(child: CircularProgressIndicator(backgroundColor: Colors.white,), width: 60, height: 60,),
                const Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting result...', style: TextStyle(color: Colors.white)),)
              ],
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.noteId.toString()),
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white,),
            onPressed: (){
              //saveNewNote(myController.text);
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[800]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: myStory(),
        )
      ),
    );
  }

  dynamic dialog(String title, String message){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title, style: TextStyle(color: Colors.white),),
            content: Text(message, style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.grey[600],
          );
        }
    );
  }
}


