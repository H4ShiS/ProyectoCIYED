// ignore_for_file: body_might_complete_normally_nullable, avoid_print, unnecessary_new, prefer_const_constructors, use_build_context_synchronously, unused_local_variable, must_be_immutable, file_names
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../widgets/Animatios/Animaciones.dart';

class UpdateDocente  extends StatefulWidget {
  static const actualizarDocente = "Update-Docente";

    String id;
    String nombre;
    String appaterno;
    String apmaterno;
    String email;
    String contrasena;
    String matricula;
    String recordatorio;


    UpdateDocente ({
    super.key,
    required this.id, 
    required this.nombre, 
    required this.appaterno,
    required this.apmaterno, 
    required this.email, 
    required this.contrasena, 
    required this.matricula, 
    required this.recordatorio
    });

  @override
  State<UpdateDocente> createState() => _UpdateDocenteState();
}

class _UpdateDocenteState extends State<UpdateDocente> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 17, 5, 130),
          toolbarHeight: 80,
        title: const  Text(
          "Actualizar Docente", 
          style: TextStyle(color: Colors.white),
        ),

        actions: [
            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(
                Icons.update, 
                color: Colors.white, size: 30,
              ),  
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            ),

            const SizedBox(width: 15,),

          ],


        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded, // Icono de flecha de retroceso
              color:
                  Colors.white, // Cambia el color de la flecha de retroceso aquí
            ),
            onPressed: () {
              Navigator.pop(context);
            },
        ),

        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), 
              bottomRight: Radius.circular(15),
            )
          ),

      ),

      body: FormularioDocenteTextField(

        userId: widget.id,
        nombre: widget.nombre,
        appaterno: widget.appaterno,
        apmaterno: widget.apmaterno,
        email: widget.email,
        contrasena: widget.contrasena,
        matricula: widget.matricula,
        recordatorio: widget.recordatorio,

      ),

    );
  }
}


class FormularioDocenteTextField extends StatelessWidget {

    String userId;
    String nombre;
    String appaterno;
    String apmaterno;
    String email;
    String contrasena;
    String matricula;
    String recordatorio;


  FormularioDocenteTextField({
    Key? key,
    required this.userId,
    required this.nombre,
    required this.appaterno,
    required this.apmaterno,
    required this.email,
    required this.contrasena,
    required this.matricula,
    required this.recordatorio,
    
  }) : super(key: key);

  final _keyForm = GlobalKey<FormState>();
  final TextEditingController matriculaDocenteUpdate = new TextEditingController();
  final TextEditingController nombreDocenteUpdate = new TextEditingController();
  final TextEditingController apePaternoDocenteUpdate = new TextEditingController();
  final TextEditingController apeMaternoDocenteUpdate = new TextEditingController();
  final TextEditingController emailDocenteUpdate = new TextEditingController();
  final TextEditingController contrasenaDocenteUpdate = new TextEditingController();
  final TextEditingController recadoDocenteUpdate = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    matriculaDocenteUpdate.text = matricula;
    nombreDocenteUpdate.text = nombre;
    apePaternoDocenteUpdate.text = appaterno;
    apeMaternoDocenteUpdate.text = apmaterno;
    emailDocenteUpdate.text = email;
    contrasenaDocenteUpdate.text = contrasena;
    recadoDocenteUpdate.text = recordatorio;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Form(
                key: _keyForm,
                child: Column(
                  children: [
                      
                      
                    Row(
                      children: [
                        Expanded(  
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                            child: TextFormField(
                              controller: matriculaDocenteUpdate,
                              validator: (valor) {
                                if (valor != null && valor.isNotEmpty) {
                                  RegExp matriculaDocente = RegExp(r'^[a-zA-Z]+$');
                                  RegExp matriculaDocenteRex = RegExp(r'^[0-9]{4,6}$');
                                  if (matriculaDocente.hasMatch(valor)) {
                                    return "Solo numeros";
                                  } else {
                                    if (!matriculaDocenteRex.hasMatch(valor)) {
                                      return "4-6 caracteres";
                                    }
                                  }
                                } else {
                                  return "Ingrese la Matricula";
                                }
                                return null;
                              },                            
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Matricula")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.app_registration_rounded,
                                  color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5),                  
                              ),
                            ),
                          ),
                        ),
              
                        const SizedBox(width: 10), // Espacio entre los campos
                        
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              controller: nombreDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                   RegExp nombreTutor = RegExp(r'[a-zA-Z\s]$');
                                   if (!nombreTutor.hasMatch(value)) {
                                     return "Solo letras";
                                   }
                                }else {
                                  return "Ingresa el Nombre ";
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Nombre Docente")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.account_circle_rounded,
                                  color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              
              
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15,),
                            child: TextFormField(
                              controller: apePaternoDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  RegExp apellidoPaterno =  RegExp(r'^[a-zA-Z\s]+$');
                                  if (!apellidoPaterno.hasMatch(value)) {
                                    return "Solo letras";
                                  }
                                }  else {
                                  return "Ingresa el dato";
                                }                                 
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Ape. Paterno")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons. person,
                                  color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5),   
                              ),
                            ),
                          ),
                        ),
              
              
                        const SizedBox(width: 10), // Espacio entre los campos
                        
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: TextFormField(
                              controller: apeMaternoDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                RegExp apellidoM = RegExp(r'^[a-zA-Z\s]+$');
                                  if (!apellidoM.hasMatch(value)) {
                                    return "Solo letras";
                                  }
                                } else {
                                  return "Ingresa el Dato";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Ape. Materno")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.person_2,
                                  color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 5),
              
                              ),
                            ),
                          ),
                        ),                      
                      ],
                    ),
                      
                      
                   Row(      
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 40
                            ),
                            child: TextFormField(
                              controller: emailDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
                                  if (!regex.hasMatch(value)) {
                                    return "Ingresa un correo electrónico válido";
                                  }
                                } else {
                                  return "Ingresa el Email";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                label:
                                    FadeAnimation(1, const Text("Email")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.email,
                                    color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                              ),
                            ),
                          ),
                        ), 
                      ],
                    ),
                      
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            child: TextFormField(
                              controller: contrasenaDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  
                                } else {
                                  return "Ingresa la contraseña";
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Contraseña")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                    color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 5),
                              ),
                            ),
                          ),
                        ),            
                        // const SizedBox(width: 10), // Espacio entre los campos
                      ],
                    ),
                        
              
              
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 40),
                            child: TextFormField(
                              controller: recadoDocenteUpdate,
                              validator: (value) {
                                if (value != null && value.isNotEmpty) {
                                  RegExp recado =  RegExp(r'^[a-zA-Z9-9áéíóúüÁÉÍÓÚÜ\s]+$');
                                  if (recado.hasMatch(value)) {
                                    
                                  } else {
                                    return "Solo Letras";
                                  }
                                } else {
                                  // // Otras condiciones de validación
                                  // if (value == null) {
                                  //   return "El valor no cumple con los requisitos";
                                  // }
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                label: FadeAnimation(1, const Text("Recado")),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                prefixIcon: const Icon(
                                  Icons.message,
                                  color: Color.fromARGB(255, 5, 78, 186),
                                ),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 6, 30, 65),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              
              
                             
                    const SizedBox(
                      height: 20,
                    ),
                        
                          
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                          
                            margin: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 40
                            ),
                          
                           child: 
                            
                           OutlinedButton.icon(
                              onPressed: () async {
                      
                                if (_keyForm.currentState != null && _keyForm.currentState!.validate()) {
                      
                                  String id = userId;
                                  String matricula =  matriculaDocenteUpdate.text;
                                  String nombre = nombreDocenteUpdate.text;
                                  String apPaterno = apePaternoDocenteUpdate.text;
                                  String apMaterno = apeMaternoDocenteUpdate.text;
                                  String email = emailDocenteUpdate.text;
                                  String pass = contrasenaDocenteUpdate.text;
                                  String recordatorio = recadoDocenteUpdate.text;
                      
                      
                                  var response = await http.post(Uri.parse('https://pruebas97979797.000webhostapp.com/apis/admin/docente/updateDocente.php?id=$id'),
                                    body: {
                                      'matricula': matricula,
                                      'nombre': nombre,
                                      'apePaterno': apPaterno,
                                      'apeMaterno': apMaterno,
                                      'email': email,
                                      'pass': pass,
                                      'recado': recordatorio,
                                    } );
                      
                                  if (response.statusCode == 200) {
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];
                      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message))
                                    );            
                      
                                    print('Response data: ${response.body}');
                      
                                  } else if(response.statusCode == 400){
                                    Map<String, dynamic> responseData = json.decode(response.body);
                                    int httpCode = responseData['httpCode'];
                                    String message = responseData['message'];
                      
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message,
                                      style: const TextStyle(color: Colors.red),)
                                      )
                                    );
                                  
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Error en la solicitud. Código de estado: ${response.statusCode}', 
                                        style: const TextStyle(color: Colors.red),)
                                      )
                                    );
                      
                                  }
                      
                                  print("Actualizacion Exitosa");
                                } else{
                                  print("Actualizacion no Exitosa");
                                }
                              },
                              icon: FadeAnimation(1, const Icon(Icons.check_box, color: Colors.white,)),
                              label: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10),
                                  FadeAnimation(1,
                                      const Text(
                                        "Actualizar Docente",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white
                                          ),   
                                      )
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(const Size(270, 50)),
                                overlayColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.pressed)) {
                                    return Color.fromARGB(255, 239, 68, 20);
                                  }
                                  return Color.fromARGB(255, 48, 8, 206); 
                                }),
                        
                                 backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 17, 5, 130)),
                              ),
                            ),      
                           
                           ),
                        ),
                      ],
                    )        
                    // Resto de tus TextFormField aquí...
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}



/*validator: (value) {
  if (value != null && value.isNotEmpty) {
    // El campo tiene un valor escrito
    if (/* Otra condición que debes validar */) {
      // Otra validación también es exitosa
      return null; // El valor es válido
    } else {
      return "Otra validación no es exitosa"; // Devuelve un mensaje de error
    }
  } else {
    return null; // El campo está vacío pero es válido
  }
},*/