import 'package:app_reportes/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AccidenteTransito extends StatefulWidget {
  const AccidenteTransito({Key key}) : super(key: key);

  @override
  State<AccidenteTransito> createState() => _AccidenteTransitoState();
}

class _AccidenteTransitoState extends State<AccidenteTransito> {
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
        title: Text('Accidente de Transito'),
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
                _position != null ? Text(_position.toString()) : Text('No Location Data'),
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
