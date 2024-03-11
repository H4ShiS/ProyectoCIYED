import 'package:flutter/material.dart';

class AsistenciaGrupoA extends StatefulWidget {
  final String idDocenteNavBar;
  final String idMateriaNavBar;
  final int numeroSemestreNavBar;
  const AsistenciaGrupoA({
    super.key, 
    required this.idDocenteNavBar, 
    required this.idMateriaNavBar, 
    required this.numeroSemestreNavBar,
  });

  @override
  State<AsistenciaGrupoA> createState() => _AsistenciaGrupoAState();
}

class _AsistenciaGrupoAState extends State<AsistenciaGrupoA> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Grupo A"),
    );
  }
}