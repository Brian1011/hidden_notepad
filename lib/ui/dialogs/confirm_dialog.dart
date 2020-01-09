import 'package:flutter/material.dart';
class ConfirmDialog{
  BuildContext context;

  void show(){
    _showConfirmDialog();
  }

  Future _showConfirmDialog(){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            //title: Text(title, style: TextStyle(color: Colors.white),),
            content: Text("Are you sure you want to erase this note?", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.grey[600],
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Yes"),
                onPressed: (){

                },
              )
            ],
          );
        }
    );
    return null;
  }
}