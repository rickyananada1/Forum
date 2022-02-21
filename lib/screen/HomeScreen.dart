import 'package:flutter/material.dart';
import 'package:forum/screen/AppDrawer.dart';

class HomeScreen extends StatefulWidget{
    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text('HomeScreen'),
        ),
        body: Center(
          child: Text('Homescreen')
        ),
        drawer: AppDrawer(),
      );
  }
}