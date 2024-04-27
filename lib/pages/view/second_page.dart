// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            context.push("/location1");
            Timer(
              const Duration(milliseconds: 300),
              () {
                // print('worked');
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 20.0).animate(scaleController);
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
        backgroundColor: Colors.grey.withOpacity(0.8),
      ),
      body: Column(
        children: [
          const Row(),
          const SizedBox(height: 20),
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
          ),
          InkWell(
            onTap: () {
              scaleController.forward();
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(10)),
              child: AnimatedBuilder(
                animation: scaleAnimation,
                builder: (c, child) => Transform.scale(
                  scale: scaleAnimation.value,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.push("/animation_size");
            },
            child: const Text("Go Animation page"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.push("/animation_size1");
            },
            child: const Text("Go Animation page center"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.push("/animation_size2");
            },
            child: const Text("Go Animation page left"),
          )
        ],
      ),
    );
  }
}

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

class Destination extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Go Back'),
      ),
    );
  }
}

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        // brightness: Brightness.dark,
        centerTitle: true,
        title: const Text('Size Transition'),
      ),
    );
  }
}
