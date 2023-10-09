
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
      path: '/semestrealumnoadd',
      name: SemestresAlumnosAdd.semestresAlumnosAdd,
      builder: (context, state) => const SemestresAlumnosAdd(),
    ),
    
    GoRoute(
        path: '/formularioalumno',
        name: FomrularioAlumno.formularioAlumno,
        builder: (context, state) => const FomrularioAlumno(),
    ),
    GoRoute(
      path: '/semestresdocentesadd',
      name: SemestresDocentesAdd.semestresDocentesAdd,
      builder: (context, state) => const SemestresDocentesAdd(),
    ),

    GoRoute(
      path: '/formulariodocente',
      name: FomrularioDocente.formularioDocente,
      builder: (context, state) => const FomrularioDocente(),
    )

  ],
  
);