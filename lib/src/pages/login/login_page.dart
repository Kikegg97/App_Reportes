import 'package:app_reportes/src/pages/incidentes/incidente_page.dart';
import 'package:flutter/material.dart';
import 'package:app_reportes/src/utils/my_colors.dart';
import 'package:flutter/scheduler.dart';
import 'package:app_reportes/src/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLogin()),
            Positioned(
              top: 60,
              left: 25,
              child: _textLogin(),
            ),
            SingleChildScrollView(//Responsive para la pantalla
              child: Column(
                children: [
                  _lottieAnimation(),
                  _textFieldEmail(),
                  _textFieldPassword(),
                  _buttonLogin(),
                  _textResetPassword(),
                  _textDontHaveAccount(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintText: 'Correo electronico',
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Colors.black
            ),
            prefixIcon: Icon(Icons.email, color: Colors.black)
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _con.passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(
                color: Colors.black
            ),
            prefixIcon: Icon(Icons.lock, color: Colors.black)
        ),
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return Container(
      margin: EdgeInsets.only(top:15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿No eres miembro aún?',
            style: TextStyle(
                color: MyColors.primaryColor
            ),),
          SizedBox(width: 25),
          GestureDetector(
            onTap: _con.goToRegisterPage,
            child: Text('Registrate', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textResetPassword(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: (){},
            child: Text('Recuperar contraseña',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
              fontSize: 16
            ),),
          )
        ],
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      width: 170,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        onPressed: (){
            _con.login();
        } ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.send),
            Text('Ingresar'),
          ],
        )
      ),
    );
  }

  Widget _circleLogin(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
      ),
    );
  }

  Widget _textLogin(){
    return Text('LOGIN', style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
    ),);
  }

  Widget _lottieAnimation(){
    return Container(
      margin: EdgeInsets.only(top: 150,
          bottom: MediaQuery.of(context).size.height*0.05 ),
      child: Image.asset('assets/img/logo_muni.png',
          width: 180,
          height: 250,
          fit: BoxFit.fill),
    );
  }
}
