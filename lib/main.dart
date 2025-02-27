import 'package:diary/ui/main_menu.dart';
import 'package:diary/ui/new_story.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  //debugShowCheckedModeBanner: false,
  home: SplashScreen(),
  //initialRoute: '/main',
  routes: {
    '/main': (context)=>MainMenu(),
    '/newLeaf': (context)=>NewLeaf(),
  },
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    await Future.delayed(Duration(seconds: 3));
    navigationPage();
  }

  void navigationPage(){
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
