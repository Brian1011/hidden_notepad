import 'dart:math';

import 'package:diary/database/database_helper.dart';
import 'package:diary/models/notes.dart';
import 'package:diary/ui/view_story.dart';
//import 'package:diary/ui/dialogs/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  }

  // future Builder to display notes
  FutureBuilder myStories(){
    return FutureBuilder<List>(
      future: dbHelper.getAllNotes(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        List<Widget> children;
        if(snapshot.hasData){
          Note note = new Note("", "");
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index){
                dynamic data = snapshot.data[index];
                Note myNote = Note.map(data);
                note.id = data['id'];
                return  Card(
                  color: Colors.black45,
                  elevation: 4,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewStory(myNote.id)));
                    },
                    //leading: Icon(Icons.edit, color: Colors.grey[600],),
                    leading: CircleAvatar(backgroundColor: Colors.grey[600],child: Text(oneLetter(myNote.text)),),
                    title: Text(shorterStory(myNote.text), style: TextStyle(color: Colors.white)),
                    subtitle: Text(myNote.date,style: TextStyle(color: Colors.white)),
                    //trailing: Icon(Icons.delete, color: Colors.red,),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        //ConfirmDialog().show();
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                content: Text("Are you sure you want to erase this note?", style: TextStyle(color: Colors.white),),
                                backgroundColor: Colors.grey[600],
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Cancel", style: TextStyle(color: Colors.white),),
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text("Yes",style: TextStyle(color: Colors.white),),
                                    onPressed: (){
                                      dbHelper.deleteItem(myNote.id);
                                      Navigator.of(context).pop();
                                      Fluttertoast.showToast(
                                          msg: "Note erased sucessfully",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey[600],
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                          timeInSecForIos: 1
                                      );
                                     // AppBuilder.of(context).rebuild();
                                     // myStories();
                                     Navigator.pushReplacementNamed(context, "/main");
                                      // MainMenu();
                                    },
                                  )
                                ],
                              );
                            }
                        );
                      },
                    ),
                  ),
                );
              }
          );

        }else if(snapshot.hasError){
          children = <Widget>[
              Icon(Icons.error_outline, color: Colors.red, size: 60,)];
        } else {
          children = <Widget>[
            SizedBox(height: 10.0,),
            SizedBox(child: CircularProgressIndicator(backgroundColor: Colors.white,), width: 60, height: 60,),
            const Padding(padding: EdgeInsets.only(top: 16), child: Text('Awaiting result...', style: TextStyle(color: Colors.white)),)
          ];
        }
          return Center(
            child: Column(
              children: children,
            ),
          );
        },
    );
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
        child: myStories()
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

  // reduce string size
  String shorterStory(String story){
    if(story.length>20){
      return story.substring(0,15)+"...";
    }else{
      return story;
    }
  }

  // get first letter
  String oneLetter(String story){
    return story.substring(0,2).toUpperCase();
  }

  // random colours
  String randomColours(){
    var list = ['blue','red','grey[600]','grey[800]','grey'];
    final _random = new Random();
    var element = list[_random.nextInt(list.length)];
    return element;
  }

}
