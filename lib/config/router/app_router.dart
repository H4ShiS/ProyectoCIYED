
import 'package:app_ciyed/presentation/screens/barril.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const LoginUser(),
    ),

    GoRoute(
      path: '/menuadmin',
      name: MenuAdmin.menuAdmin,
      builder: (context, state) =>  MenuAdmin(),
    ),

  ],
  
);