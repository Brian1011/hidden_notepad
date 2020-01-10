import 'package:diary/database/database_helper.dart';
import 'package:diary/models/notes.dart';
import 'package:flutter/material.dart';
import 'package:diary/ui/functions/current_time_date.dart';

class NewLeaf extends StatefulWidget {
  @override
  _NewLeafState createState() => _NewLeafState();
}

class _NewLeafState extends State<NewLeaf> {
  // define a text controller to be used to retrieve textfield value
  final myController = TextEditingController();
  String appBarTitle = "New Leaf";
  int saveButtonPressCount = 0;
  Note newNote = new Note(" "," ");
  final dbHelper = DatabaseHelper.instance;

  // change Title
  void changeTitle(String title){
    setState(() {
      appBarTitle = title;
    });
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
        title: Text(appBarTitle),
        elevation: 0,
        backgroundColor: Colors.black87,
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
          child: TextField(
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
          ),
        ),
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
    //showDialog(context: Text(data))
  }

  // save new note
  void saveNewNote(String note){
    if(note.length>0 && note.isNotEmpty){
      saveButtonPressCount = saveButtonPressCount + 1;

      if(saveButtonPressCount > 1){
        // update note
        changeTitle("Edit leaf");
        dialog("Note Updated", "Changes saved successfully");
      }else{
        //save new note
        Note newNote = Note(note, CurrentDateTime().getDateToday());
        dbHelper.insertNotes(newNote);
        dialog("New Note Saved", "Your note has been saved successfully");
      }

    }else{
      dialog("Error", "Your note cannot be empty!");
    }
    //Note newNote = Note("")
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

  // get date and time -- Thu, Jan 9, 2020 10:57 AM

}
