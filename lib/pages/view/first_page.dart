import 'package:animator/animator.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("First Page")),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            SizedBox(
              height: 200,
              child: AvatarGlow(
                repeat: true,
                animate: true,
                glowColor: Colors.red,
                glowRadiusFactor: 0.1,
                glowCount: 10,
                child: CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 60,
                    child: const FlutterLogo(size: 80)),
              ),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: Animator<double>(
                duration: Duration(milliseconds: 1500),
                cycles: 0,
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: 55.0),
                builder: (context, animatorState, child) => Container(
                  margin: EdgeInsets.all(animatorState.value),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFF5757),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFFF5757).withOpacity(0.5),
                        offset: Offset(0, 5),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
