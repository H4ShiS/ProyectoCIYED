import 'package:app_ciyed/config/theme/app_theme.dart';
import 'package:app_ciyed/src/pages/login/login_seccion.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: AppTheme(selectColor: 0).getTheme(),
      home: Scaffold(
        body: loginUser(),
      ),
    );
  }
}


