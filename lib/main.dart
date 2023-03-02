import 'package:flutter/material.dart';
//import 'package:flutter_visual_code/factory/task_factory.dart';
//import 'package:flutter_visual_code/models/task.dart';

void main() {
  runApp(AppMovil());
}

class AppMovil extends StatelessWidget {
   const AppMovil();

   @override
   Widget build(BuildContext context){
    return MaterialApp(
      home: login(),
    );
   }
}

class login extends StatelessWidget {
  login({super.key});
  @override
    Widget build(BuildContext context) {
      return Scaffold(
        //body: Text(_task.name()),
        body: Container(          
          child: Column(            
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, bottom: 20),
              ),
              Container (
                margin: const EdgeInsets.only(top: 25, bottom: 20),
                child: Image.asset("images/image2.png", height: 300),
              ),
              const Text("Motocicleta App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),              
              const Text("Lorem ipsum dolor sit amet, consectetur adipiscing", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),              
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
              ),
              TextButton(
               style: TextButton.styleFrom(
                foregroundColor: Colors.black, // foreground
                backgroundColor: Color.fromARGB(255, 189, 228, 230),
                fixedSize: Size(325, 45),
              ),
              onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registro()),
                );
              },
              child: Text('Registro'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.5, bottom: 20),
              ),
              TextButton(
               style: TextButton.styleFrom(
                foregroundColor: Colors.black, // foreground
                backgroundColor: Color.fromARGB(255, 189, 228, 230),
                fixedSize: Size(325, 45),
              ),
              onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Ingreso()),
                );
              },
              child: Text('Ingreso'),
              )
            ]
          ),
        ),
      );
    }
  }


  class Registro extends StatelessWidget { 
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //Selecciona toda la pantalla!
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 189, 228, 230),
          title: Text('Registro'),
        ),
     );
    }
  }

   class Ingreso extends StatelessWidget { 
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //Selecciona toda la pantalla!
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 189, 228, 230),
          title: Text('Ingreso'),
        ),
     );
    }
  }