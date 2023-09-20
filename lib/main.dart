import 'package:app_ciyed/config/theme/app_theme.dart';
import 'package:app_ciyed/login/login_seccion.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: 0).getTheme(),
      home: const Scaffold(
        body: loginUser(),
      ),
    );
  }
}


