import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../utils/my_colors.dart';

class RoboPersona extends StatefulWidget {
  const RoboPersona({Key key}) : super(key: key);

  @override
  State<RoboPersona> createState() => _RoboPersonaState();
}

class _RoboPersonaState extends State<RoboPersona> {
  Position _position;

  void _getCurrentLocation() async{
    Position position = await _determinePosition();
    setState(() {
      _position = position;
    });
  }

  Future<Position> _determinePosition() async{
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error('Location Permission are Denied');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Robo a Personas'),
        backgroundColor: MyColors.primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center ,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                child: TextField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 80, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: MyColors.primaryColor,
                      hintText: '¿Que esta pasando?',
                      hintStyle: TextStyle(
                          color: Colors.white
                      )
                  ),
                ),
              ),
              _position != null ? Text('Current Location: ' + _position.toString()) : Text('No Location Data'),
              _buttonRow(),
              _buttonIngresar(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _getCurrentLocation, backgroundColor: MyColors.primaryColor),
    );
  }

  Widget _buttonRow(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add_a_photo_rounded,size:35)),
          IconButton(onPressed: (){}, icon: Icon(Icons.attachment,size:35))
        ],
      ),
    );
  }

  Widget _buttonIngresar(){
    return Container(
      width: 170,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: (){          } ,
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
}
