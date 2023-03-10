import 'package:app_reportes/src/models/response_api.dart';
import 'package:app_reportes/src/provider/users_provider.dart';
import 'package:app_reportes/src/utils/my_snackbar.dart';
import 'package:app_reportes/src/utils/shared_pref.dart';
import 'package:flutter/material.dart';


import '../../models/user.dart';

class LoginController{
  BuildContext context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider= new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async{
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ??{});
    if(user?.sessionToken != null){
      Navigator.pushNamedAndRemoveUntil(context, 'incidentes', (route) => false);
    }
  }
  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login() async{
    String email = emailController.text.trim();//trim eliminar espacion en blancos
    String password = passwordController.text.trim();
    ResponseApi responseApi = await usersProvider.login(email, password);

    if(responseApi.success){
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());
      Navigator.pushNamedAndRemoveUntil(context, 'incidentes', (route) => false);
    }else{
      print('Respuesta: ${responseApi.toJson()}');
    }

    print('Respuesta: ${responseApi.toJson()}');
    MySnackBar.show(context, responseApi.message);
  }
}