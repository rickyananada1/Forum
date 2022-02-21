import 'package:flutter/material.dart';
import 'package:forum/screen/AppDrawer.dart';
import 'package:forum/helper/Auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _hasError = false;
  String _errorMsg = "";

  @override
  void dispose(){
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

    submitLoginForm() async{
      final res = await Provider.of<Auth>(context,listen:false).requestLogin({
        'email' : _emailCtrl.text,
        'password' : _passwordCtrl.text,
      });

      if(res['status'] ==true){
        Navigator.pushNamed(context, '/profile');
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
        title: Text('LoginScreen'),
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
            child: Text('Login'),
            onPressed: () =>submitLoginForm(),
          ),
        )

      ]),
      drawer: AppDrawer(),
    );
  }
}
