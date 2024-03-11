import 'package:app_ciyed/presentation/screens/docente/ListaDeGruposAlumnos/lista_grupo_a.dart';
import 'package:app_ciyed/presentation/screens/docente/ListaDeGruposAlumnos/lista_grupo_b.dart';
import 'package:flutter/material.dart';



class NavBarAlumnosMateria extends StatefulWidget {
  final String idDocente;
  final String idMateria;
  final int numeroSemestre;
  const NavBarAlumnosMateria({
    super.key, 
    required this.idDocente, 
    required this.idMateria, 
    required this.numeroSemestre
  });

  @override
  State<NavBarAlumnosMateria> createState() => _NavBarAlumnosMateriaState();
  
}

class _NavBarAlumnosMateriaState extends State<NavBarAlumnosMateria> {
  int selectIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("${widget.idDocente}");
    // print("${widget.idMateria}");
    // print("${widget.numeroSemestre}");


  }


  @override
  Widget build(BuildContext context) {

    final screens = [
      AsistenciaGrupoA(
          idDocenteNavBar: widget.idDocente,
          idMateriaNavBar: widget.idMateria,
          numeroSemestreNavBar: widget.numeroSemestre
        ),
      const AsistenciaGrupoB()
    ];
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
        items: const[
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