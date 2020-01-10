import 'package:diary/database/database_helper.dart';
import 'package:diary/models/notes.dart';
import 'package:diary/ui/functions/current_time_date.dart';
import 'package:flutter/material.dart';

class ViewStory extends StatefulWidget {
  final int noteId;
  //final String noteDateTime = " ";
  const ViewStory(this.noteId);

  @override
  _ViewStoryState createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  final myController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;
  String noteDateTime = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Retrieve data
    dynamic singleNote = dbHelper.getSingleItem(widget.noteId);
    Future<Note> mine = singleNote;
  }

  FutureBuilder myStory(){
    return FutureBuilder<Note>(
      future: dbHelper.getSingleItem(widget.noteId),
      builder: (BuildContext context, AsyncSnapshot<Note> snapshot){
        if(snapshot.hasData){
//          print(snapshot.data.id);
          myController.text = snapshot.data.text;
          noteDateTime = snapshot.data.date;
          return TextField(
            cursorColor: Colors.white,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: myController,
            decoration: InputDecoration.collapsed(
                hintText: "Enter your text here",
                hintStyle: TextStyle(color: Colors.white, letterSpacing: 0.5,
                fontSize: 18.0)),
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 0.5,
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
        title: Text("Edit leaf"),
        backgroundColor: Colors.black87,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, color: Colors.white,),
            onPressed: (){
              saveNewNote(myController.text);
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          saveNewNote(myController.text);
         //return AlertDialog(content: Text("Alert Dialog"),);
        },
        child: Icon(Icons.save, color: Colors.white,),
        backgroundColor: Colors.grey,
        elevation: 30,
      ),
    );
  }

  // alert dialog
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

  // save new note
  void saveNewNote(String note){
    if(note.length>0 && note.isNotEmpty){
        // Note newNote = Note(note, CurrentDateTime().getDateToday());
        Note newNote = Note(note, noteDateTime);
        newNote.id = widget.noteId;
        dbHelper.updateItem(newNote);
        dialog("Note updated", "Changes saved successfully.");
    }else{
      dialog("Error", "Your note cannot be empty!");
    }
    //Note newNote = Note("")
  }

}


