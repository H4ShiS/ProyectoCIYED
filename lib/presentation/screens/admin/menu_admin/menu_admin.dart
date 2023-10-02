// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuAdmin extends StatelessWidget {

static const menuAdmin = "admin";
   
  const MenuAdmin({
    Key? key,});

  @override
  Widget build(BuildContext context,) {
    
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Menu Administracion", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: colors.primary,
        leading: const Icon(Icons.account_circle_rounded, color: Colors.white,),
      ),

      

      body:  Column(
        children: [

          const SizedBox(
            height: 30,
          ),

            

          Container(
            
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            decoration: BoxDecoration(
              color:  const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [

                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset.zero,
                  ),

              ]
            ),

            
            child:  const Column(
              
              children: [
                
                ButtosAdmin()


              ],
              
            ),

          ),
          
          

        ],
      )
      
    );
  }

}






class ButtosAdmin extends StatelessWidget {
  const ButtosAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    const SizedBox(width: 50,);
    
    final colors = Theme.of(context).colorScheme;
    return  Column(
      
      children: [
        
        
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Agregar Alumno ',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),


        const SizedBox(height: 20,),
        
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Opciones Alumno',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),

        const SizedBox(height: 60,),



        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Agregar Docente ',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),


        const SizedBox(height: 20,),

        
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Opciones Docente',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),



        const SizedBox(height: 60,),



        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Agregar Materia ',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),

        const SizedBox(height: 20,),

        
        TextButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(250, 40)),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.focused))
                  return const Color.fromARGB(255, 0, 0, 0);
                return null; // Defer to the widget's default.
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const Color.fromARGB(255, 255, 255, 255).withOpacity(
                      0.5); // Color de fondo cuando está deshabilitado
                }
                return colors.primary; // Color de fondo cuando está habilitado
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Ajusta el radio de borde según sea necesario
              ),
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Opciones Materia',
            style: TextStyle(
              color: Colors.white,
            ), // Cambia el color del texto aquí
          ),
        ),



        







        
      ],

    );
  }
}






class _BackgroundBubbles extends StatelessWidget {
  const _BackgroundBubbles({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
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
              opacity: 0.09,
              child: Container(
                width: 350,
                height: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(250),
                  color: Color.fromARGB(248, 109, 24, 199),
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
      ),
    );
  }
}