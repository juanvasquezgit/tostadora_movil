import 'package:flutter/material.dart';

class DrawerPageStateFull extends StatefulWidget {
  const DrawerPageStateFull({super.key});

  @override
  State<DrawerPageStateFull> createState() => _DrawerPageStateFullState();
}

class _DrawerPageStateFullState extends State<DrawerPageStateFull> {
  String textoPrincipal = "INICIO";
  String tipoDeTostionSeleccionado = 'Alto'; // Variable para almacenar el tipo de tostión seleccionado
  bool mostrarBotonesTostion = false; // Variable para controlar la visibilidad de los botones de tostión

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textoPrincipal),
      ),
      //Agrega un cajón a la aplicación y lo envuelve  en un widget de Scaffold.
      drawer: Drawer(
        // Agrega un ListView al Drawer. Esto asegura que el usuario pueda desplazarse
        // a través de las opciones si no caben en la pantalla.
        child: ListView(
          // Importante: elimina cualquier padding del ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 212, 33),
              ),
              child: Text('BIENVENIDOS'
                         '\n TOSTADORA DIGITAL',style: TextStyle(fontSize: 20.20),textAlign: TextAlign.center,),
              
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: Text('Tipo de Tostión'),
              onTap: () {
                // Acción cuando se presiona el botón "Tipo de Tostión"
                // Actualiza el estado de la app
                setState(() {
                  mostrarBotonesTostion = !mostrarBotonesTostion; // Alternar la visibilidad de los botones de tostión
                });
              },
            ),
            if (mostrarBotonesTostion) // Mostrar los botones de tostión si mostrarBotonesTostion es true
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón "Alto"
                      setState(() {
                        tipoDeTostionSeleccionado = 'Alto';
                        mostrarBotonesTostion = false; // Ocultar los botones de tostión
                        textoPrincipal = 'Tipo de Tostión - $tipoDeTostionSeleccionado';
                      });
                    },
                    child: Text('Alto'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón "Medio"
                      setState(() {
                        tipoDeTostionSeleccionado = 'Medio';
                        mostrarBotonesTostion = false; // Ocultar los botones de tostión
                        textoPrincipal = 'Tipo de Tostión - $tipoDeTostionSeleccionado';
                      });
                    },
                    child: Text('Medio'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción cuando se presiona el botón "Bajo"
                      setState(() {
                        tipoDeTostionSeleccionado = 'Bajo';
                        mostrarBotonesTostion = false; // Ocultar los botones de tostión
                        textoPrincipal = 'Tipo de Tostión - $tipoDeTostionSeleccionado';
                      });
                    },
                    child: Text('Bajo'),
                  ),
                ],
              ),
          ],  
        ),
      ),
      body: Center(
        child: Text(textoPrincipal),
      ),
    );
  }
}
