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
        title: const Text('My Diary'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 10,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Sweet Pie'),
                subtitle: Text('7th Janauary 2020'),
                trailing: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Sweet Pie'),
                subtitle: Text('7th Janauary 2020'),
                trailing: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
            Card(
              elevation: 10,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0, bottom: 5),
              child: ListTile(
                leading: Icon(Icons.edit),
                title: Text('Sweet Pie...'),
                subtitle: Text('7th Janauary 2020'),
                trailing: Icon(Icons.delete, color: Colors.red,),
              ),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
