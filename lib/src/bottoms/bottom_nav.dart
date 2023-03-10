import 'package:app_reportes/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BNavigator extends StatefulWidget {
  const BNavigator({Key key}) : super(key: key);

  @override
  State<BNavigator> createState() => _BNavigatorState();
}

class _BNavigatorState extends State<BNavigator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          padding: EdgeInsets.all(20),
          gap: 4,
          tabs: const [
            GButton(
                icon: Icons.home,
                text: 'Inicio'),
            GButton(
                icon: Icons.person,
                text: 'Logeo'),
          ]
      ),
    );
  }
}
