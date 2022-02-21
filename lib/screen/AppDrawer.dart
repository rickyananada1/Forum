import 'package:flutter/material.dart';
import 'package:forum/helper/Auth.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget{
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>{

   Future submitLogout() async{
    final res = await Provider.of<Auth>(context,listen:false).requestLogout();
    if(res['status']==true){
      Navigator.pushNamed(context, '/login');
    }
  }

  ListTile buttonMenu(text,route){
    return ListTile(
      title: Text(text),
      onTap: () {Navigator.pushNamed(context, route);},
    );
  }

  @override
  Widget build(BuildContext context){

    var _menuList;
    var _isLoggedIn = context.watch<Auth>().isAuthenticated;

    if(_isLoggedIn){
      _menuList=Column(
        children: [
          buttonMenu('Profile', '/profile'),
          ListTile(
            title: Text('logout'),
            onTap: () {
              submitLogout();
              Navigator.pop(context);
            },
          )
        ]
      );
    }else{
      _menuList=Column(
          children: [
            buttonMenu('Register', '/register'),
            buttonMenu('Login', '/login'),
          ]
      );
    }

    return Drawer(
       child: Container(
         margin: EdgeInsets.only(top:10),
         child:Column(children:[
           buttonMenu('Home', '/home'),
           _menuList
         ]),
       ),
    );
  }
}