import 'package:flutter/material.dart';
class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
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
            Card(
              color: Colors.black45,
              elevation: 4,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.edit, color: Colors.grey[600],),
                title: Text('Am grateful for', style: TextStyle(color: Colors.white),),
                subtitle: Text('7th Janauary 2020',style: TextStyle(color: Colors.white)),
                trailing: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add, color: Colors.white,),
        backgroundColor: Colors.grey,
        elevation: 30,
      ),
    );
  }
}
