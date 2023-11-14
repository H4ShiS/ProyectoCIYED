// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/primer_semestre_list.dart';
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class OpcionesMenuAlumnoSemestres extends StatelessWidget {
  static const opcionesSemestresAlumnosMenu = "semestres";

  const OpcionesMenuAlumnoSemestres({
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
              "Editar Alumnos",
              style: TextStyle(color: Colors.white, fontSize: 20),
              
            ),
          ),
          
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.add, color: Colors.white, size: 25,),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            ),

            
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.settings, color: Colors.white, size: 30, ),
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
                  height: 50,
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
                      OpcionesSemestreAlumno()
                    ],
                  ),
                ),
              ],
            ),


            // Row(crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     FloatingActionButton(
            //         onPressed: (){},
            //         child: const Icon(Icons.message),
            //       ),
            //   ],
            // ), 

          ],  
        ),

        // floatingActionButton: FloatingActionButton(

          
        //       backgroundColor: Colors.orange,
        //       onPressed: (){
        //         context.pop();
        //       },
        //       child: new Icon(Icons.chat),
         
              

        //   ),

        // floatingActionButton: IconButton(
        //   onPressed: (){}, 
        //   icon: Icon(Icons.chat),
        //   style: ButtonStyle(
        //     backgroundColor: MaterialStatePropertyAll(Colors.blue)
        //   ), 
        // ),

        
        
    );
  }
}





class OpcionesSemestreAlumno extends StatelessWidget {
  const OpcionesSemestreAlumno({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox(
      width: 50,
    );

    final colors = Theme.of(context).colorScheme;
    return Column(
      children: [

        const SizedBox(
          height: 20,
        ),

        

        OutlinedButton.icon(
          onPressed: () {


            // context.pushNamed(FomrularioAlumno.formularioAlumno);
            context.pushNamed(ListPrimero.listaPrimero);
            

          },
          icon: FadeAnimation(1, const Icon(Icons.looks_one, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Primer Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)),
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
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Segundo Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
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

          ),
        ),

        const SizedBox(height: 60,),

        //----------------------------------------------------------------

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_3_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Tercer Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
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

          ),
        ),


        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_4_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Cuarto Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
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

          ),
        ),


        const SizedBox(height: 60,),

        //----------------------------------------------------------------


        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1,const Icon(Icons.looks_5_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Quinto Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
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

          ),
        ),

        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(1, const Icon(Icons.looks_6_rounded, color: Colors.white,)),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(1, const Text("Sexto Semestre", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white,),)),
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

          ),
        ),

        const SizedBox(height: 20,),



       

        
      ],
    );
  }
}


/*
class _BackgroundBubbles extends StatelessWidget {
  const _BackgroundBubbles({Key? key});


  @override
  Widget build(BuildContext context) {

  final colors = Theme.of(context).colorScheme;



    return Stack(
      children: [
        Positioned(
          // top: index * 50.0,
          // left: index % 2 == 0 ? 50 : 200,
          top: -30,
          left: 190,
          child: Opacity(
            opacity: 0.099,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(248, 109, 24, 199),
              ),
            ),
          ),
        ),
        Positioned(
          // top: index * 50.0,
          // left: index % 2 == 0 ? 50 : 200,
          top: 150,
          left: -50,
          child: Opacity(
            opacity: 0.2,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(250),
               color: Color.fromARGB(248, 246, 103, 26),

              ),
            ),
          ),
        ),
        Positioned(
          // top: index * 50.0,
          // left: index % 2 == 0 ? 50 : 200,
          top: 650,
          left: 60,
          child: Opacity(
            opacity: 0.09,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(248, 109, 24, 199),
              ),
            ),
          ),
        ),
        Positioned(
          // top: index * 50.0,
          // left: index % 2 == 0 ? 50 : 200,
          top: 565,
          left: 285,
          child: Opacity(
            opacity: 0.09,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color.fromARGB(248, 38, 4, 199),
              ),
            ),
          ),
        ),
      ],
    );
  }
}*/
