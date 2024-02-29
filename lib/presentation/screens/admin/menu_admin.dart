// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors, deprecated_member_use
import 'package:app_ciyed/presentation/screens/barril.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

//pantalla destinada a las funciones que ltiene el adminsitradkr para el manejo de esta aplicacion el ciual debe de tener 
//las funciones de un CRUD, ademas de tambien contemplar el aparatado para la descarga para las asostencias
//para
//contiene lo que el el poder registrar a los alumnos, por los diferentes emestres  grupos que estan definidos
//ademas de contemplar las funciones de actrualizar a los diferentes alumnos Registrados,
class MenuAdmin extends StatefulWidget {
  static const menuAdmin = "admin";

  const MenuAdmin({
    Key? key,
  });

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context,){
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
      )
    );
    return Scaffold(
      body: ListView(
        padding:  EdgeInsets.zero,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 17, 5, 130),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50)
              ) 
            ),
            child: Column(
              children: [
                 const SizedBox(height: 50,),
                 ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text("Administrador", style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                  ),),
                  subtitle: Text("Registrar, Actualizar y Eliminar!!", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white
                  ),),
                  trailing: const CircleAvatar(
                   backgroundImage: AssetImage("assets/images/insta.png"), 
                    radius: 45,
                  ),
                 ),
                 const SizedBox(height: 30,)
              ],
            ),
          ),
      
          Container(
            color: const Color.fromARGB(255, 17, 5, 130),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard(context, 'Estudiantes', CupertinoIcons.person_3_fill, Colors.deepOrange, const FomrularioAlumno()),
                  itemDashboard(context, 'Opciones', CupertinoIcons.settings_solid, Colors.green, const OpcionesMenuAlumnoSemestres()),
                  itemDashboard(context, 'Docentes', CupertinoIcons.person_2_fill, Colors.purple, const FomrularioDocente()),
                  itemDashboard(context, 'Opciones', CupertinoIcons.pencil_outline, Colors.brown, const OpcionesDocente()),
                  itemDashboard(context, 'Materias', CupertinoIcons.book_solid, Colors.indigo, const FomrularioMaterias()),
                  itemDashboard(context, 'Opciones', CupertinoIcons.add_circled, Colors.teal, const GetListaMaterias()),
                  itemDashboard(context, 'About', CupertinoIcons.question_circle, Colors.blue, const MenuAdmin()),
                  itemDashboard(context, 'Contact', CupertinoIcons.phone, Colors.pinkAccent, const MenuAdmin()),
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
            child: Icon(iconData, color: Colors.white)
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
/*
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 17, 5, 130),
        toolbarHeight: 80,
        title: FadeAnimation(
          1,
          const Text(
            "ADMINISTRACIÓN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
              size: 25,
            ),
            
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 25,
            ),
            
          )
        ],
        centerTitle: false,
        leading: const Icon(
          Icons.home,
          color: Colors.white,
          size: 27,
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        )),
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
                        color: Color.fromARGB(156, 242, 59, 9),
                        blurRadius: 5,
                        offset: Offset.zero,
                      ),
                    ]),
                child: const Column(
                  children: [ButtonsAdmin()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/


/*
class ButtonsAdmin extends StatelessWidget {
  const ButtonsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox(
      width: 50,
    );

    // final colors = Theme.of(context).colorScheme;
    return Scaffold(

      body: ListView(

      ),
    );
    
    
    
    /*Column(
      children: [
        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {
            // context.pushNamed(SemestresAlumnosAdd.semestresAlumnosAdd);
            context.pushNamed(FomrularioAlumno.formularioAlumno);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.people,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Registrar Alumno",
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
                return const Color.fromARGB(255, 239, 68,20);
              }
              return const Color.fromARGB(255, 239, 68, 20); // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 20,
        ),

        OutlinedButton.icon(
          onPressed: () {
            context.pushNamed(
                OpcionesMenuAlumnoSemestres.opcionesSemestresAlumnosMenu);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.settings,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Opciones Alumno",
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
              return colors.primary; // Por defecto, usa el overlayColor predeterminado
            }),
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 17, 5, 130)),
          ),
        ),

        const SizedBox(
          height: 60,
        ),


        OutlinedButton.icon(
          onPressed: () {
            // context.pushNamed(SemestresDocentesAdd.semestresDocentesAdd);
            context.pushNamed(FomrularioDocente.formularioDocente);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.person,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Registrar Docente",
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
          onPressed: () {
            FomrularioDocente
            context.pushNamed(OpcionesDocente.opcionesDocente);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.settings_accessibility_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Opciones Docente",
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
          onPressed: () {

            FomrularioDocente
OpcionesDocente
            context.pushNamed(FomrularioMaterias.formularioMaterias);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.book_rounded,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Registrar Materia",
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
          onPressed: () {
            context.pushNamed(GetListaMaterias.opcionesMateria);
          },
          icon: FadeAnimation(
              1,
              const Icon(
                Icons.room_preferences_outlined,
                color: Colors.white,
              )),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 23),
              FadeAnimation(
                  1,
                  const Text(
                    "Opciones Materia",
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
  }
}
*/
