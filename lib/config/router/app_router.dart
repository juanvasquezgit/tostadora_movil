import 'package:digital_coffee/views/auth/graph_page.dart';
import 'package:digital_coffee/views/auth/login_page.dart';
import 'package:digital_coffee/views/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:digital_coffee/views/widgets/drawer_page_statefull.dart';


// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
     GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const DrawerPageStateFull(),
    ),
    GoRoute(
      path: '/graph',
      builder: (context, state) => const GraphPage(),  
    )
  ],
);