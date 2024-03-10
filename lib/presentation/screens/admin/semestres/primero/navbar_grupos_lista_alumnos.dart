import 'package:app_ciyed/presentation/screens/admin/semestres/primero/semestres_lista_a.dart';
import 'package:app_ciyed/presentation/screens/admin/semestres/primero/semestres_lista_b.dart';
import 'package:flutter/material.dart';



class NavbarListaGrupoAlumnos extends StatefulWidget {
  final int semestre;

  const NavbarListaGrupoAlumnos({super.key, required this.semestre});

  @override
  State<NavbarListaGrupoAlumnos> createState() => _NavbarListaGrupoAlumnosState();
  
}

class _NavbarListaGrupoAlumnosState extends State<NavbarListaGrupoAlumnos> {
  
  int selectIndex = 0;



  @override
  Widget build(BuildContext context) {

  final screens = [ListSemestreGrupoA(numeroSemestre: widget.semestre ), ListSemestreGrupoB(numeroSemestre: widget.semestre)];

    return Scaffold(
      body: IndexedStack(
        index: selectIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectIndex,
        onTap: (value) {
          
          setState(() {
            selectIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.font_download),
            activeIcon: Icon(Icons.font_download),
            label: "Grupo",
            backgroundColor: Color.fromARGB(255, 17, 5, 130),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.format_bold_rounded),
            activeIcon: Icon(Icons.format_bold_rounded),
            label: "Grupo",
            backgroundColor: Color.fromARGB(255, 17, 5, 130),
          ),

          
        ]
      ),
    );
    
  }
}