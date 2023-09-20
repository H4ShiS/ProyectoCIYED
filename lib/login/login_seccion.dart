import 'package:flutter/material.dart';


class loginUser  extends StatelessWidget {
  const loginUser ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio  de Sesion"),
        centerTitle: true,
      ),
      body:  Container(
      
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.ac_unit_sharp)),

          const SizedBox(width: 150,),

          

        ],
      ),
      
        
      ),
    );

  }
}



