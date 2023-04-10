import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
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
              MaterialButton(
                onPressed: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Ingreso', style: TextStyle(color: Colors.white)),
                highlightColor: Colors.blue,
                splashColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                minWidth: 320.0,
                height: 45,
                color: Colors.blue,
              ),
              Container(
                margin: const EdgeInsets.only(top: 0.5, bottom: 20),
              ),
              TextButton(
                style: TextButton.styleFrom(
                foregroundColor: Colors.black, // foreground
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),              
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
            ]
          ),
        ),
      );
    }
  }

  //*************Registro***********/
  class Registro extends StatelessWidget { 
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nickController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController confPassController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        /*appBar: AppBar(
          title: Text('Registro'),
        ),*/
      body: SingleChildScrollView(
        child: Column(            
            children: [
              Container (
                margin: const EdgeInsets.only(top: 25, bottom: 20),
                child: Image.asset("images/image1.png", height: 280),
              ),
              Container(
                child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nombre',
                        ),
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Correo electrónico',
                        ),
                      ),
                      TextFormField(
                        controller: nickController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_2_rounded),
                          labelText: 'Usuario',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Contraseña',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: confPassController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Confirmar Contraseña',
                        ),
                      ),
                      SizedBox(height: 16),
  
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            MaterialButton(
              onPressed: () { 
                  sign_in(nameController.text, emailController.text, nickController.text, passController.text, confPassController.text)
                  .then((id) {         
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  })                  
                  .catchError((e) {
                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Ocurrió un error'),
                        content: Text('Por favor intenta nuevamente.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Aceptar'),
                            onPressed: () {
                              // Aquí puedes tomar alguna acción según lo que haya seleccionado el usuario
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );}
                );  
              },
              child: const Text('Registro', style: TextStyle(color: Colors.white)),
              highlightColor: Colors.blue,
              splashColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
              minWidth: 320.0,
              height: 45,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            const Text('--------------- O Regístrate usando ---------------', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            TextButton( 
              onPressed: () { 
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // foreground
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),              
                fixedSize: Size(325, 45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/google.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0), // Separación entre la imagen y el texto
                  Text(
                    'Google',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),             
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            TextButton( 
              onPressed: () { 
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Registro()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // foreground
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),              
                fixedSize: Size(325, 45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/Vector.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0), // Separación entre la imagen y el texto
                  Text(
                    'Facebook',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),             
            ),
          ]
        ),
      )
      );
    }
  }

//*************Ingreso***********/
class LoginPage extends StatefulWidget {
  @override
  Ingreso createState() => Ingreso();
}
  //class Ingreso extends StatelessWidget { 
  class Ingreso extends State<LoginPage> { 
    final _formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController celController = TextEditingController();
    final TextEditingController passController = TextEditingController();
    final TextEditingController confPassController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        /*appBar: AppBar(
          title: Text('Ingreso'),
        ),*/
      body: SingleChildScrollView(
        child: Column(            
            children: [
              Container ( 
                margin: const EdgeInsets.only(top: 25, bottom: 20),
                child: Image.asset("images/image3.png", height: 280),
              ),
              Container(
                child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [                    
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Correo electrónico',
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          labelText: 'Contraseña',
                        ),
                      ),
                      SizedBox(height: 16),  
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            MaterialButton(
              onPressed: () { 
                authenticate(emailController.text, passController.text)
                  .then((token) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResgistroRealizado()),
                    );
                })
                  .catchError((e) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Usuario o Contraseña erronea'),
                            content: Text('Ingresa nuevamente tus credenciales.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Aceptar'),
                                onPressed: () {
                                  // Aquí puedes tomar alguna acción según lo que haya seleccionado el usuario
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                });                
              },
              child: const Text('Ingresar', style: TextStyle(color: Colors.white)),
              highlightColor: Colors.blue,
              splashColor: Colors.red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
              minWidth: 320.0,
              height: 45,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            const Text('--------------- O Ingresa usando ---------------', style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold, fontSize: 15)),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            TextButton( 
              onPressed: () { 
                
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red, // foreground
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),              
                fixedSize: Size(325, 45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/google.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0), // Separación entre la imagen y el texto
                  Text(
                    'Google',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),             
            ),
            Container(
              margin: const EdgeInsets.only(top: 0.1, bottom: 20),
            ),
            TextButton( 
              onPressed: () {                 
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // foreground
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.blue,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0))
                ),              
                fixedSize: Size(325, 45),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/Vector.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0), // Separación entre la imagen y el texto
                  Text(
                    'Facebook',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),             
            ),
          ]
        ),
      )
      );
    }
  }

  class ResgistroRealizado extends StatelessWidget { 
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        //Selecciona toda la pantalla!
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 189, 228, 230),
          title: Text('Bienvenid@'),
        ),
     );
    }
  }

//***********************Registro API
Future<String> sign_in(String name, String email, String nick, String password, String password_confirmation) async {
  print(email);
  print(password);
  final url = 'http://utadeo-apps-load-balancing-2034895534.us-east-1.elb.amazonaws.com/v1/user/sign-up';
  final response = await http.post(Uri.parse(url), body: {
    "name": name,
    "email": email,
    "nick": nick,
    "password": password,
    "password_confirmation": password_confirmation
  });
  print(response.statusCode);
  if (response.statusCode == 201) {
    print(response.body);
    final data = json.decode(response.body);
    if (data.containsKey("data")) {
        final dataObject = data["data"];
        if (dataObject.containsKey("id")) {
          var id = dataObject["id"];
          id = id.toString();
          print(id);
          return id;
        }
    }else {
      print("API no contiene un ID");
      throw Exception('API no contiene un ID');
    }
  } else {
    print("No se pudo crear el usuario: ${response.statusCode}");
    throw Exception('No se pudo crear el usuario');
  }
  throw Exception('Ocurrió un error inesperado');
}

//***********************Iniciar Sesión API
Future<String> authenticate(String username, String password) async {
  print(username);
  print(password);
  final url = 'http://utadeo-apps-load-balancing-2034895534.us-east-1.elb.amazonaws.com/v1/user/login';
  final response = await http.post(Uri.parse(url), body: {
    "email": username,
    "password": password
  });
  print(response.statusCode);
  if (response.statusCode == 200) {
    print(response.body);
    final data = json.decode(response.body);
    if (data.containsKey("data")) {
      final dataObject = data["data"];
      if (dataObject.containsKey("token")) {
        final token = dataObject["token"];
        print(token);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', token);
        return token;
      }
    } else {
      print("API no contiene un token");
      throw Exception('API no contiene un token');
    }
  } else {
    print("No se pudo autenticar: ${response.statusCode}");
    throw Exception('No se pudo autenticar');
  }
  throw Exception('Ocurrió un error inesperado');
}