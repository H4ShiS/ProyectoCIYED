
import 'package:app_ciyed/presentation/screens/admin/formulariosMaterias/formulario_materias.dart';
import 'package:app_ciyed/presentation/screens/barril.dart';
import 'package:app_ciyed/presentation/screens/login/login_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const LoginScreen(),
    ),

    GoRoute(
      path: '/menuadmin',
      name: MenuAdmin.menuAdmin,
      builder: (context, state) => const MenuAdmin(),
    ),
    
    GoRoute(
        path: '/formularioalumno',
        name: FomrularioAlumno.formularioAlumno,
        builder: (context, state) => const FomrularioAlumno(),
    ),


    GoRoute(
      path: '/formulariodocente',
      name: FomrularioDocente.formularioDocente,
      builder: (context, state) => const FomrularioDocente(),
    ),
    GoRoute(
      path: '/formulariomaterias',
      name: FomrularioMaterias.formularioMaterias,
      builder: (context, state) => const FomrularioMaterias(),
    ),
    GoRoute(
      path: '/semestresopcionesmenualumnos',
      name: OpcionesMenuAlumnoSemestres.opcionesSemestresAlumnosMenu,
      builder: (context, state) => const OpcionesMenuAlumnoSemestres(),
    ),




    //---------------------------------------------------------------- Docente Router
    GoRoute(
      path: '/menudocentehome',
      name: MenuDocente.menuDocenteHome,
      builder: (context, state) => const MenuDocente(),
    ),
    GoRoute(
      path: '/opcionesdocente',
      name: OpcionesDocente.opcionesDocente,
      builder: (context, state) => const OpcionesDocente(),
    )

  ],
  
);