// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuAdmin extends StatelessWidget {
  static const menuAdmin = "admin";

  const MenuAdmin({
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
          title: const Text(
            "ADMINISTRACIÓN",
            style: TextStyle(color: Colors.white, fontSize: 23),
            
          ),
          actions: [
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.more_vert_rounded, color: Colors.white, size: 27,),
              // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
            
            )
          ],
          
          
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 27,
            
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15), 
              bottomRight: Radius.circular(15),
            )
          ),
        ),


        
        body: Stack(
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
                          color: Colors.black12,
                          blurRadius: 15,
                          offset: Offset.zero,
                        ),
                      ]),
                  child: const Column(
                    children: [
                      ButtonsAdmin()
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

          
        ));
  }
}





class ButtonsAdmin extends StatelessWidget {
  const ButtonsAdmin({super.key});

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
          onPressed: () {},
          icon: const Icon(Icons.people),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              FadeAnimation(1, Text("Registrar Alumno", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),

            // backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 254, 68, 68)),
          ),
        ),

        
        const SizedBox(height: 20,),


        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.more_sharp),
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              Text("Opciones Alumno", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
          ),
        ),

        const SizedBox(height: 60,),

        //----------------------------------------------------------------

        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.person),
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              Text("Registrar Docente", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
          ),
        ),


        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.more_sharp),
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              Text("Opciones Docente", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
          ),
        ),


        const SizedBox(height: 60,),

        //----------------------------------------------------------------


        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.book_rounded),
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              Text("Registrar Materia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
          ),
        ),

        const SizedBox(height: 20,),



        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.more_sharp),
          label: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 23),
              Text("Opciones Materia", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 209, 218, 226); // Cambia esto al color que desees para el highlightColor
              }
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
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
