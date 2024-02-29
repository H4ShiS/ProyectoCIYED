// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use, prefer_const_constructors
import 'package:app_ciyed/presentation/widgets/Animatios/Animaciones.dart';
import 'package:flutter/material.dart';
import 'package:app_ciyed/presentation/screens/barril.dart';


// ignore: must_be_immutable
class OpcionesMenuAlumnoSemestres extends StatelessWidget {
  static const opcionesSemestresAlumnosMenu = "semestres";

  // ignore: use_key_in_widget_constructors
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
        title: FadeAnimation(
          1,
          const Text(
            "Semestres Alumnos",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 25,
            ),
            // style:  ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
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
          // bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(20),
        )),
      ),
      body: const OpcionesSemestreAlumno()
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
    
    
    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.zero,
        children: [      
          // const SizedBox(height: 50,), //esto es la medicion de donde empizan mis formularios es decir la division del appbar y el body
          Container(
            color: const Color.fromARGB(255, 17, 5, 130),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40), //padding para el tamaño de las cards
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                padding: const EdgeInsets.only(top: 55),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  
                  itemDashboard(context, '1 Semestre', Icons.looks_one, Colors.black, ListPrimero(numeroSemestre: 1,)),
                  itemDashboard(context, '2 Semestre', Icons.looks_two, const Color.fromARGB(255, 255, 98, 0), ListPrimero(numeroSemestre: 2,)),
                  itemDashboard(context, '3 Semestre', Icons.looks_3, const Color.fromARGB(255, 225, 22, 7),  ListPrimero(numeroSemestre: 3,)),
                  itemDashboard(context, '4 Semestre', Icons.looks_4, const Color.fromARGB(255, 176, 176, 12),  ListPrimero(numeroSemestre: 4)),
                  itemDashboard(context, '5 Semestre', Icons.looks_5, const Color.fromARGB(255, 6, 34, 192),  ListPrimero(numeroSemestre: 5)),
                  itemDashboard(context, '6 Semestre', Icons.looks_6_sharp, const Color.fromARGB(255, 22, 105, 97),  ListPrimero(numeroSemestre: 6)),
                  // itemDashboard(context, 'Pendientes', CupertinoIcons.refresh_bold, Colors.blue, const MenuAdmin()),
                  itemDashboard(context, 'Opciones', Icons.rule_folder, const Color.fromARGB(255, 109, 64, 255), const MenuAdmin()),
                ],
              ),

            ),
          ),
        ],
      ),

    );
  }

Widget itemDashboard(BuildContext context, String title, IconData iconData, Color background, Widget screen) => GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Colors.black.withOpacity(.2),
            blurRadius: 10
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: background,
              shape: BoxShape.circle,
            ),
            child: FadeAnimation(1, Icon(iconData, color: Colors.white))
          ),
          const SizedBox(height: 8),
          Text(title.toString(), 
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: const Color.fromARGB(255, 17, 5, 130),

          ))
        ],
      ),
    ),
  );
   
}

    





    /*Column(
      children: [
        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {
            // context.pushNamed(FomrularioAlumno.formularioAlumno);
            context.pushNamed(ListPrimero.listaPrimero);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_one,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Primer Semestre",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
                // Cambia esto al color que desees para el highlightColor
                // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_two,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Segundo Semestre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 60,
        ),

        //----------------------------------------------------------------

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_3_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Tercer Semestre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_4_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Cuarto Semestre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 60,
        ),

        //----------------------------------------------------------------

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_5_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Quinto Semestre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {},
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.looks_6_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Sexto Semestre",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ],
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(270, 45)),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 239, 68,
                    20); // Cambia esto al color que desees para el highlightColor
              }
              return colors
                  .primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 20,
        ),
      ],
    );*/

