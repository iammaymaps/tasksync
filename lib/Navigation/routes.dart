import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routemaster/routemaster.dart';
import 'package:tasksync/Authentication/Auth%20Screens/GoogleLoginScreen.dart';
import 'package:tasksync/Authentication/Profile/ProfileScreen.dart';
import 'package:tasksync/Constants/FirebaseProviders.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/LongProjectsScreen.dart';
import 'package:tasksync/HomeFeed/Screens/AddProjetcts/addProjectWidget/shortProjectsScreen.dart';
import 'package:tasksync/HomeFeed/Screens/HomeCommonWidget/LongProjets.dart';
import 'package:tasksync/HomeFeed/Screens/HomeFeed.dart';
import 'package:tasksync/Navigation/routesContants.dart';
import 'package:tasksync/Testing%20Stuff/HomeScreen.dart';

final loggedInRoute = GoRouter(routes: [
  GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child:HomeFeed(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
  GoRoute(
      path: '/shortProjects',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: ShortProjectsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
  GoRoute(
      path: '/longProjects',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: LongProjectsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
  GoRoute(
      path: '/profile',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: ProfileScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      }),
]);

final loggedOutRoute = GoRouter(routes: [
  GoRoute(
      name: RoutesConstants.home,
      path: '/',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
            key: state.pageKey,
            child: GoogleLoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
                child: child,
              );
            });
      })
]);
