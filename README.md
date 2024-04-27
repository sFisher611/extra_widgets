
## go router

```
go_router: ^14.0.0
```

### Router
#### main.dart
```Dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Router App',
      
      routerConfig: AppRouter.route,
    );
  }
}
```
#### router.dart
~~~Dart
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

~~~

#### Other router 

```Dart
GoRouter(
    initialLocation: '/splash_screen',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorMainKey,
    routes: [
      GoRoute(
        // parentNavigatorKey: _rootNavigatorMainKey,
        path: '/splash_screen',
        builder: (context, state) => const SplashScreen(),
      ),
    ])
```

## Animations Page
```
 animations: ^2.0.11
```

#### button =>
```Dart
OpenContainer(
    closedBuilder: (_, openContainer) {
        return ElevatedButton(
            onPressed: openContainer,
            child: const Text("Open Container"));
    },
    openColor: Colors.white,
    closedElevation: 0.0,
    closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
    ),
    closedColor: Colors.white,
    openBuilder: (_, closeContainer) {
        return AnimatorPage(
        closeContainer: closeContainer,
        );
    },
    )
```

### AnimatorPage

```Dart
class AnimatorPage extends StatelessWidget {
  AnimatorPage({super.key, required this.closeContainer});
  Function() closeContainer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animator Page'),
        leading: IconButton(
          onPressed: closeContainer,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
```
### Router animation

```Dart 
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
```

### Router animation sized
```Dart
GoRoute(
    path: '/animation_size',
    name: "animation_size",
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: AnimationPage(),
        transitionsBuilder:
            (context, animation, secondaryAnimation, child) {
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
```
### 2
```Dart
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
              // textDirection: TextDirection.rtl,  <- right to
              position: Tween(
                begin: const Offset(1.0, 0.0),
                end: const Offset(0.0, 0.0),
              ).animate(animation),
              child: child,
            );
          },
        );
      },
    )
```