import 'package:dio/dio.dart' as Dio;
import 'package:forum/helper/Storage.dart';
import 'package:flutter/material.dart';
import 'dio.dart';
import 'dart:convert';

class Auth extends ChangeNotifier{

  bool _isAuthenticated = false;
  bool get isAuthenticated =>_isAuthenticated;

  requestLogin(credentials) async{
    try{
      final res = await dio().post('auth/login',data:credentials);

      if(res.statusCode == 200){
        
        final token =json.decode(res.toString())['access_token'];
        Storage().saveToken(token);
        _isAuthenticated = true;
        notifyListeners();
        return{
          'status':true
        };
      }
    }on Dio.DioError catch(e){

      if(e.response.statusCode ==401){
        return{
          'status':false,
          'error_msg': 'username atau password gagal'
        };
      }
    }
  }

  requestRegister(credentials) async{
      try{
        final res = await dio().post('auth/register',data:credentials);

        if(res.statusCode == 200){
          return{
            'status':true
          };
        }
      }on Dio.DioError catch(e){

          if(e.response.statusCode ==422){
            var _resError = "";
            final _resValidation = json.decode(e.response.toString());

            _resValidation.forEach((key,val){
              _resError += val[0] + "\n";
            });

            return{
              'status':false,
              'error_msg': _resError
            };
          }
      }
  }

  requestLogout() async{
    try{
      final token =  Storage().readToken();
      final res = await dio().post('auth/logout',
                  options: Dio.Options(
                    headers: {
                      'Authorization':'Bearer $token'
                    }
                  ));

      if(res.statusCode == 200){
        Storage().deleteToken();

        _isAuthenticated = false;
        notifyListeners();

        return{
          'status':true
        };
      }
    }on Dio.DioError catch(e){
        return{
          'status':false,
          'error_msg': e.response
        };
    }
  }

}