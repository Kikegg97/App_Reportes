import 'package:app_reportes/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class BAccidenteAuto extends StatefulWidget {
  const BAccidenteAuto({Key key}) : super(key: key);

  @override
  State<BAccidenteAuto> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BAccidenteAuto> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: MyColors.secondaryColor,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Logeo'),
        ]
    );  
  }

  Widget _imageAccidente(){
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/accidente_2.png'),
      radius: 40,
      backgroundColor: MyColors.secondaryColor,
    );
  }
}