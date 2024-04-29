
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
<img src="https://github.com/sFisher611/extra_widgets/assets/61547104/91ddabb8-b062-47cc-b5ef-dcc85bc02fd0" width="200" height="400" />
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
### Background 
<img src="https://github.com/sFisher611/extra_widgets/assets/61547104/cff3980c-98ed-47da-a928-06b6f2aae7cc" width="200" height="400" />

```Dart
import 'package:particles_flutter/particles_flutter.dart';
class AnimationBackground extends StatelessWidget {
  const AnimationBackground({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CircularParticle(
        width: w,
        height: h,
        awayRadius: w / 5,
        numberOfParticles: 150,
        speedOfParticles: 1.5,
        maxParticleSize: 7,
        particleColor: Colors.white.withOpacity(.7),
        awayAnimationDuration: Duration(milliseconds: 600),
        awayAnimationCurve: Curves.easeInOutBack,
        onTapAnimation: false,
        isRandSize: true,
        isRandomColor: false,
        connectDots: false,
        // randColorList: [
        // Colors.red.withAlpha(210),
        // Colors.white.withAlpha(210),
        // Colors.yellow.withAlpha(210),
        // Colors.green.withAlpha(210),
        // ],
        enableHover: true,
        hoverColor: Colors.black,
        hoverRadius: 90,
      ),
    );
  }
}
```

### AppSplash
<img src="https://github.com/sFisher611/extra_widgets/assets/61547104/c902f5c7-ef11-4a91-8614-f8295db9a1ba" width="200" height="400" />

```Dart 
class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  double _opacity = 0;
  bool _value = true;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            context.push('/animation_splash');

            Timer(
              const Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(milliseconds: 600), () {
      setState(() {
        _opacity = 1.0;
        _value = false;
      });
    });
    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Here will be your app\'s logo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(seconds: 6),
              opacity: _opacity,
              child: AnimatedContainer(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(seconds: 2),
                height: _value ? 50 : 200,
                width: _value ? 50 : 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(.2),
                      blurRadius: 100,
                      spreadRadius: 10,
                    ),
                  ],
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent, shape: BoxShape.circle),
                    child: Stack(
                      children: [
                        AnimatedBuilder(
                          animation: scaleAnimation,
                          builder: (c, child) => Transform.scale(
                            scale: scaleAnimation.value,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepPurpleAccent,
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: FlutterLogo(
                            size: 110,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Back'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}

```

### button
```Dart
OpenContainer(
    closedBuilder: (_, openContainer) {
      return const SizedBox(
        height: 80,
        width: 80,
        child: Center(
          child: Text(
            'App Logo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    },
    openColor: Colors.white,
    closedElevation: 20,
    closedShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    transitionDuration: const Duration(milliseconds: 700),
    openBuilder: (_, closeContainer) {
      return SecondClass();
    },
  )
```

## App Splash 2
<img src="https://github.com/sFisher611/extra_widgets/assets/61547104/74eff0e1-eebc-4096-9c7c-9878d1914e0e" width="200" height="400" />
```
page_transition:
```

```
animated_text_kit:
```
### Widget
```Dart
OpenContainer(
    closedBuilder: (_, openContainer) {
      return Container(
        height: 80,
        width: 80,
        child: const Center(
          child: Text(
            'App Logo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
    openColor: Color(0xff412EEF),
    closedElevation: 20,
    closedShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    transitionDuration: Duration(milliseconds: 700),
    openBuilder: (_, closeContainer) {
      return SecondClass1();
    },
  )
```
### Splash
```Dart
class SecondClass1 extends StatefulWidget {
  @override
  _SecondClass1State createState() => _SecondClass1State();
}

class _SecondClass1State extends State<SecondClass1>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            context.push('/animation_splash1');
            Timer(
              Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(const Duration(seconds: 2), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff412EEF),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 30.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'YOUR APP\'S NAME',
                speed: Duration(milliseconds: 150),
              ),
            ],
            isRepeatingAnimation: false,
            repeatForever: false,
            displayFullTextOnTap: false,
          ),
        ),
      ),
    );
  }
}
```
### Next Page

```Dart

class ThirdPage1 extends StatelessWidget {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Go Back'),
        centerTitle: true,
        
        backgroundColor: Color(0xff412EEF),
      ),
      body: Center(
        child: Text(
          "APP HOME PAGE",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

```