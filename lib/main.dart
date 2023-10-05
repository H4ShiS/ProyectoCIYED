import 'package:app_ciyed/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'config/theme/app_theme.dart';


void main(){
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: appRouter,
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme(selectColor: 0).getTheme(),
    //   // home: const Scaffold(
    //   //   body: LoginUser(),
    //   // ),
    // );

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: 0).getTheme(),
      // theme: ThemeData(

      //   brightness: Brightness.light,
      //   primaryColor: Colors.white,
        

      // ),
      
    );
  }
}


