import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/HomeScreen.dart';
import 'screen/RegisterScreen.dart';
import 'screen/LoginScreen.dart';
import 'screen/ProfileScreen.dart';
import 'helper/Auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (_) => Auth(),
        child:MaterialApp(
          home: HomeScreen(),
          routes:{
          '/home' : (context) => HomeScreen(),
          '/register' : (context)=> RegisterScreen(),
          '/login' : (context)=> LoginScreen(),
            '/profile' : (context)=> ProfileScreen(),
        }
      )
    )
  );
}
