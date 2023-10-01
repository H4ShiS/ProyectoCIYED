// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuAdmin extends StatelessWidget {

static const menuAdmin = "admin";
   
  const MenuAdmin({
    Key? key,});

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Administracion"),
      ),

      body: Container(
        child: const Text("Hola a todos"),
      ),
    );
  }
} 
