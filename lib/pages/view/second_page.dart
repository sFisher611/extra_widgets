import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
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
