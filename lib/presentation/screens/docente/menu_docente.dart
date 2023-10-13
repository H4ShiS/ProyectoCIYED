// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuDocente extends StatelessWidget {
  static const menuDocenteHome = "menu_docente";

  const MenuDocente({
    Key? key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    // final colors = Theme.of(context).colorScheme;

    ThemeData();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 17, 5, 130),
          toolbarHeight: 80,
          title: FadeAnimation(1,
             const Text(
              "DOCENTES",
              style: TextStyle(color: Colors.white, fontSize: 20),
              
            ),
          ),
          
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.account_circle, color: Colors.white, size: 25,),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            ),

            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.message, color: Colors.white, size: 30, ),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
              
            ),
            
          ],
          
          
          centerTitle: false,

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


        
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // const _BackgroundBubbles(),
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(

                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(156, 242, 59, 9),
                          blurRadius: 5,
                          offset: Offset.zero,
                        ),
                      ]
                  ),
                  child: const Column(
                    children: [
                      OpcionesMenuDocente()
                    ],
                  ),
                ),
              ],
            ),

          ],  
        ),


        
    );
  }
}





class OpcionesMenuDocente extends StatelessWidget {
  const OpcionesMenuDocente({super.key});

  @override
  Widget build(BuildContext context) {
   

    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [

        const SizedBox(
          height: 20,
        ),
        Center(
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Puedes cambiar el color del borde
                  width: 1, // Puedes ajustar el ancho del borde
                ),
                borderRadius: BorderRadius.circular(20), // Puedes ajustar el radio del borde
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blue, // Puedes cambiar el color del ícono
                  ),
                  SizedBox(
                      width:
                          15), // Puedes ajustar el espacio entre el ícono y el texto
                  Text(
                    "Pedro Rojas Prado",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 30,
        ),


        

        OutlinedButton.icon(
          onPressed: () {


            // context.pushNamed(FomrularioAlumno.formularioAlumno);

          },
          icon: FadeAnimation(1, const Icon(Icons.looks_one, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 30),
              FadeAnimation(1, const Text("Primer Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor
 // Cambia esto al color que desees para el highlightColor
 // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),

            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        
        const SizedBox(height: 20,),


        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_two, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              FadeAnimation(1, const Text("Segundo Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor
        
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),

            // backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 239, 68, 20)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),


          ),
        ),

        const SizedBox(height: 20,),

        //----------------------------------------------------------------

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_3_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              FadeAnimation(1, const Text("Tercer Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor

              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),
            // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 239, 68, 20)),


          ),
        ),


        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_4_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              FadeAnimation(1, const Text("Cuarto Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor

              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),
            // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 239, 68, 20)),


          ),
        ),


        const SizedBox(height: 20,),

        //----------------------------------------------------------------


        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1,const Icon(Icons.looks_5_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              FadeAnimation(1, const Text("Quinto Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor

              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),
            // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 67, 49, 228)),


          ),
        ),

        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_6_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              FadeAnimation(1, const Text("Sexto Semestre", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor

              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            // backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 239, 68, 20)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 17, 5, 130)),


          ),
        ),
        
        const SizedBox(height: 20,),

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.picture_as_pdf, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              FadeAnimation(1, const Text("Reportes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white,),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(150, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                 return const Color.fromARGB(255, 239, 68, 20); // Cambia esto al color que desees para el highlightColor

              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 239, 68, 20)),
                //  return const Color.fromARGB(255, 239, 68, 20); 
                //  Color.fromARGB(255, 17, 5, 130)
            
            

          ),
        ),

        

        const SizedBox(height: 30,),

        Center(
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              width: 300, // Aumentar el ancho del contenedor
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  // Icon(
                  //   Icons.message_rounded,
                  //   color: Colors.blue,
                  // ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "Recado:",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )




       

        
      ],
    );
  }
}



