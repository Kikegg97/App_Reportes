import 'package:app_reportes/src/pages/incidentes/incidente_page.dart';
import 'package:app_reportes/src/pages/login/login_page.dart';
import 'package:app_reportes/src/pages/register/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'Logeo',
        routes: {
          'Logeo': (BuildContext context) => LoginPage(),
          'register' : (BuildContext context) => RegisterPage(),
          'incidentes' : (BuildContext context) => IncidentePage()
        }
    );
  }
}
