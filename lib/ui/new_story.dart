import 'package:flutter/material.dart';

class NewLeaf extends StatefulWidget {
  @override
  _NewLeafState createState() => _NewLeafState();
}

class _NewLeafState extends State<NewLeaf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Leaf'),
        elevation: 0,
        backgroundColor: Colors.black87,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[800]
        ),
        child: TextField(
          maxLines: null,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration.collapsed(hintText: "Enter your text here", hintStyle: TextStyle(color: Colors.white)),
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
