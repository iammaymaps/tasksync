import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tasksync/Authentication/Auth%20Screens/GoogleLoginScreen.dart';
import 'package:tasksync/Constants/FirebaseProviders.dart';
import 'package:tasksync/Testing%20Stuff/HomeScreen.dart';

final loggedOutRoute = RouteMap(
    routes: {'/': (_) => const MaterialPage(child: GoogleLoginScreen())});

final loggedInRoute =
    RouteMap(routes: {'/': (_) => const MaterialPage(child: HomeScreen())});
