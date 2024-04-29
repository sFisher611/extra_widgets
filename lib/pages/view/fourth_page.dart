import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../animation_splash.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Fourth Page")),
      body: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                height: 20,
              ),
            ],
          ),
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
        ],
      ),
    );
  }
}
