import 'package:flutter/material.dart';
import 'package:forum/screen/AppDrawer.dart';
import 'package:forum/helper/Auth.dart';

class RegisterScreen extends StatefulWidget{
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  final _emailCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _hasError = false;
  String _errorMsg = "";

  @override
  void dispose(){
    _emailCtrl.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  submitRegisterForm() async{
    final res = await Auth().requestRegister({
      'email' : _emailCtrl.text,
      'username' : _usernameCtrl.text,
      'password' : _passwordCtrl.text,
    });

    if(res['status'] ==true){
      print('berhasil terdaftar');
      Navigator.pushNamed(context, '/login');
    }else{
      setState(() {
        _hasError = true;
        _errorMsg = res['error_msg'];
      });
    }

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text('RegisterScreen'),
        ),
        body: Column(children: [
          TextFormField(
            controller: _emailCtrl,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'email'
            ),
          ),

          TextFormField(
            controller: _usernameCtrl,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'username'
            ),
          ),

          TextFormField(
            controller: _passwordCtrl,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password'
            ),
          ),

          Visibility(
            visible: _hasError,
            child: Text('$_errorMsg')
          ),

          SizedBox(
            width: double.infinity,
            child: OutlineButton(
              child: Text('Register'),
              onPressed: () =>submitRegisterForm(),
            ),
          )
          
        ]),
      drawer: AppDrawer(),
    );
  }
}