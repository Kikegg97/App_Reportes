import 'package:app_reportes/src/pages/incidentes/accidente_transito.dart';
import 'package:app_reportes/src/pages/incidentes/act_sospechosa.dart';
import 'package:app_reportes/src/pages/incidentes/disturbios.dart';
import 'package:app_reportes/src/pages/incidentes/incidente_controller_cerrarSesion.dart';
import 'package:app_reportes/src/pages/incidentes/robo_personas.dart';
import 'package:app_reportes/src/pages/incidentes/robo_vehiculo.dart';
import 'package:app_reportes/src/pages/incidentes/venta_drogas.dart';
import 'package:flutter/material.dart';
import 'package:app_reportes/src/utils/my_colors.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class IncidentePage extends StatefulWidget {
  const IncidentePage({Key key}) : super(key: key);

  @override
  State<IncidentePage> createState() => _IncidentePageState();
}

class _IncidentePageState extends State<IncidentePage> {
  CerrarSesion _con = CerrarSesion();

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
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          //Boton Navigator de Google - Dos botones (HOME: no tiene funcion - LOGEO: funcion de cerrar sesion)


          bottomNavigationBar: GNav(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              rippleColor: MyColors.secondaryColor,
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.black,
              tabBackgroundColor: MyColors.secondaryColor,
              padding: EdgeInsets.all(20),
              gap: 4,
              tabs: [
                GButton(
                    onPressed: (){
                      print('Home');
                    },
                    icon: Icons.home,
                    text: 'Inicio'),
                GButton(
                  onPressed: _con.logout,//
                    icon: Icons.person,
                    text: 'Cerrar Sesion'),
              ]
          ),


          backgroundColor: MyColors.primaryColor,//Color de toda la ventana

          //AppBar que tiene includio un TabBar para navegar entre dos ventanas
          appBar: AppBar(
            centerTitle: true,
            title: Text("Reportar"),
            backgroundColor: MyColors.primaryColor,
            bottom: TabBar(
                tabs: [
                  Tab(text: 'Incidentes'),
                  Tab(text: 'Emergencias')
                ]
            ),
          ),


          //Cuerpo luego del AppBar
          body: Center(
            child: TabBarView(//Cuerpo del TabBar
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(// Primera ventana del TabBar - Incidentes
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _imgAccident(),
                          TextButton(onPressed: (){},
                              child: Text(
                                "Accidente de Transito",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),
                          ),
                          _imgActSosp(),
                          TextButton(onPressed: (){},
                              child: Text(
                                'Actividad Sospechosa',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              )),
                          _imgRoboCarro(),
                          TextButton(onPressed: (){},
                              child: Text(
                                'Robo a vehiculo',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ))
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _imgRoboPersona(),
                          TextButton(onPressed: (){},
                              child: Text(
                                'Robo a personas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),),
                          _imgDisturbios(),
                          TextButton(onPressed: (){},
                              child: Text(
                                'Disturbios',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ),),
                          _imgVentaDrogas(),
                          TextButton(onPressed: (){},
                              child: Text(
                                'Venta de Drogas',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15
                                ),
                              ))
                        ],
                      )
                    ],
                  ),


                  Container(//Segunda ventana del TabBar - Emergencias
                      decoration: BoxDecoration(color: MyColors.primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _imgPolicia(),
                              TextButton(onPressed: (){},
                                child: Text(
                                  "Policia Nacional",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              _imgBomberos(),
                              TextButton(onPressed: (){},
                                  child: Text(
                                    'Central de Bomberos',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  )),
                              _imgAmbulancia(),
                              TextButton(onPressed: (){},
                                  child: Text(
                                    'Ambulancia',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  ))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _imgSerenazgo(),
                              TextButton(onPressed: (){},
                                child: Text(
                                  'Serenazgo',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15
                                  ),
                                ),),
                              _imgCayetano(),
                              TextButton(onPressed: (){},
                                child: Text(
                                  'Hospital Cayetano',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 15
                                  ),
                                ),),
                              _imgReategui(),
                              TextButton(onPressed: (){},
                                  child: Text(
                                    'Hospital Reategui',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                  ),
                ]
            ),
          ),
        )
    );
  }


  //Widgets para mejor control de codigo
  Widget _imgPolicia(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
            image: AssetImage('assets/img/policia.png'),
            width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imgBomberos(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
          image: AssetImage('assets/img/bomberos_2.png'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imgAmbulancia(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
          image: AssetImage('assets/img/ambulancia.png'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imgSerenazgo(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
          image: AssetImage('assets/img/serenazgo.png'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imgCayetano(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
          image: AssetImage('assets/img/doctor_1.png'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  Widget _imgReategui(){
    return Container(
      child: GestureDetector(
        onTap: (){},
        child: Image(
          image: AssetImage('assets/img/doctor_2.png'),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _imgAccident(){
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AccidenteTransito()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/accidente_2.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget _imgActSosp(){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {//Agregar la pagina donde se redirigira
          Navigator.push(context, MaterialPageRoute(builder: (context) => ActividadSospechosa()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/act_sospechosa.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget _imgRoboCarro(){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {//Agregar la pagina donde se redirigira
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoboVehiculo()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/robo_vehiculo.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget _imgRoboPersona(){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {//Agregar la pagina donde se redirigira
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoboPersona()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/robo_persona.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget _imgDisturbios(){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {//Agregar la pagina donde se redirigira
          Navigator.push(context, MaterialPageRoute(builder: (context) => Disturbios()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/disturbios_2.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }

  Widget _imgVentaDrogas(){
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: () {//Agregar la pagina donde se redirigira
          Navigator.push(context, MaterialPageRoute(builder: (context) => VentaDrogas()));
        },
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/img/venta_drogas.png'),
          radius: 50,
          backgroundColor: MyColors.primaryColor,
        ),
      ),
    );
  }
}
