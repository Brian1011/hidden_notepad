import 'package:flutter/material.dart';
class StoryCard extends StatefulWidget {
  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      elevation: 4,
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
      child: ListTile(
        leading: Icon(Icons.edit, color: Colors.grey[600],),
        title: Text('Random Story...', style: TextStyle(color: Colors.white),),
        subtitle: Text('7th Janauary 2020',style: TextStyle(color: Colors.white)),
        trailing: Icon(Icons.delete, color: Colors.red,),
      ),
    );
  }
}
