import 'package:extra_widgets/pages/home_page.dart';
import 'package:extra_widgets/pages/view/first_page.dart';
import 'package:extra_widgets/pages/view/fourth_page.dart';
import 'package:extra_widgets/pages/view/third_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/animation_splash.dart';
import '../pages/view/animation_splash2.dart';
import '../pages/view/second_page.dart';

class AppRouter {
  static final _rootNavigatorMain = GlobalKey<NavigatorState>();
  static final _rootNavigatorFirst = GlobalKey<NavigatorState>();
  static final _rootNavigatorSecond = GlobalKey<NavigatorState>();
  static final _rootNavigatorThird = GlobalKey<NavigatorState>();
  static final _rootNavigatorFourth = GlobalKey<NavigatorState>();

  static final GoRouter route = GoRouter(
    initialLocation: '/first',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorMain,
    routes: [
      GoRoute(
        path: '/location1',
        name: "location1",
        // builder: (context, state) => Destination(),
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: Destination(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInBack).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_size',
        name: "animation_size",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: Duration(milliseconds: 1000),
            reverseTransitionDuration: Duration(milliseconds: 200),
            child: AnimationPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: child,
                ),
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_size1',
        name: "animation_size1",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            child: AnimationPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.center,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: child,
                ),
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_size2',
        name: "animation_size2",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            child: AnimationPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.centerLeft,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: child,
                ),
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_size3',
        name: "animation_size3",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            child: const AnimationPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                // textDirection: TextDirection.rtl,
                position: Tween(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_background',
        name: "animation_background',",
        builder: (context, state) => AnimatingBg1(),
      ),
      GoRoute(
        path: '/animation_background1',
        name: "animation_background1',",
        builder: (context, state) => const AnimationBackground(),
      ),
      GoRoute(
        path: '/animation_splash',
        name: "animation_splash",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: NextPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              // animation = CurvedAnimation(
              //     curve: Curves.fastLinearToSlowEaseIn,
              //     parent: animation,
              //     reverseCurve: Curves.fastOutSlowIn);
              return FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 12).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: '/animation_splash1',
        name: "animation_splash1",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 1000),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            child: ThirdPage1(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation = CurvedAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  parent: animation,
                  reverseCurve: Curves.fastOutSlowIn);
              return Align(
                alignment: Alignment.bottomCenter,
                child: SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: 0,
                  child: child,
                ),
              );
            },
          );
        },
      ),
      StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) => HomePage(
                navigationShell: navigationShell,
              ),
          branches: [
            StatefulShellBranch(navigatorKey: _rootNavigatorFirst, routes: [
              GoRoute(
                path: '/first',
                name: "first",
                builder: (context, state) => const FirstPage(),
              )
            ]),
            StatefulShellBranch(navigatorKey: _rootNavigatorSecond, routes: [
              GoRoute(
                path: '/second',
                name: "second",
                builder: (context, state) => const SecondPage(),
              )
            ]),
            StatefulShellBranch(navigatorKey: _rootNavigatorThird, routes: [
              GoRoute(
                path: '/third',
                name: "third",
                builder: (context, state) => const ThirdPage(),
              )
            ]),
            StatefulShellBranch(navigatorKey: _rootNavigatorFourth, routes: [
              GoRoute(
                path: '/fourth',
                name: "fourth",
                builder: (context, state) => const FourthPage(),
              )
            ]),
          ])
    ],
  );
}
