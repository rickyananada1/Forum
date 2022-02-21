import 'package:flutter/material.dart';
import 'AppDrawer.dart';

class ProfileScreen extends StatefulWidget{
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileScreen'),
      ),
      body: Center(
        child: Text('Yeay logged in....'),
      ),
      drawer: AppDrawer(),
    );
  }
}