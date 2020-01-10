import 'package:flutter/material.dart';

class ViewStory extends StatefulWidget {
  final int noteId;
  const ViewStory(this.noteId);

  @override
  _ViewStoryState createState() => _ViewStoryState();
}

class _ViewStoryState extends State<ViewStory> {
  final myController = TextEditingController();

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
        child: TextField(
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
        ),
      ),
    );
  }
}


