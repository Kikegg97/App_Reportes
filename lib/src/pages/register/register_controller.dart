import 'package:app_reportes/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:app_reportes/src/models/response_api.dart';
import 'package:app_reportes/src/models/user.dart';
import 'package:app_reportes/src/provider/users_provider.dart';

class RegisterController{

  BuildContext context;

  TextEditingController emailController = new TextEditingController();//
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController telephoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();

  Future init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
  }

  void Register() async{
    String email = emailController.text.trim();//trim sirve para que no haya espacios
    String firstname = firstnameController.text;
    String lastname = lastnameController.text;
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();


    String confirmpassword = confirmpasswordController.text.trim();

    if(email.isEmpty || firstname.isEmpty || lastname.isEmpty || telephone.isEmpty || password.isEmpty || confirmpassword.isEmpty){
      MySnackBar.show(context, 'Debes ingresar todos los campos');

      return;
    }
    
    if(confirmpassword != password){
      MySnackBar.show(context, 'Las contraseñas no coinciden');
      return;
    }

    if(password.length < 6){
      MySnackBar.show(context, 'Las contraseña debe tener al menos 6 caracteres');
      return;
    }

    User user = new User(
      email: email,
      name: firstname,
      lastname: lastname,
      phone: telephone,
      password: password,
    );

    ResponseApi responseApi = await usersProvider.create(user);

    MySnackBar.show(context, responseApi.message);

    print('RESPUESTA: ${responseApi.toJson()}');
  }

  void back(){
    Navigator.pop(context);
  }
}