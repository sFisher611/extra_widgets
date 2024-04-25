import 'package:extra_widgets/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Extra Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomNavigationBarTheme:  BottomNavigationBarThemeData(
          selectedItemColor: Color(0xff343941),
          unselectedItemColor: Color(0xff60656D),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          enableFeedback: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      routerConfig: AppRouter.route,
    );
  }
}
    // Color(0xff505863),
    // Color(0xff424a53),
    // Color(0xff343941),
    // Color(0xff60656D),
    // Color(0xff4D565F),
    // Color(0xff464D57),