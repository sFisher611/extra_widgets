import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:particles_flutter/particles_flutter.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> with TickerProviderStateMixin {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation Page"),
        backgroundColor: Colors.grey.withOpacity(0.8),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          const Row(),
          const SizedBox(height: 20),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onHighlightChanged: (value) {
              setState(() {
                isTapped = value;
              });
            },
            onTap: () {},
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastLinearToSlowEaseIn,
              height: isTapped ? 55 : 60,
              width: isTapped ? 150 : 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 30,
                    offset: Offset(3, 7),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'TAP HERE',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.push('/animation_background');
              },
              child: Text("Animation page1")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                context.push('/animation_background1');
              },
              child: Text("Animation page2"))
        ],
      ),
    );
  }
}

class AnimatingBg1 extends StatefulWidget {
  @override
  _AnimatingBg1State createState() => _AnimatingBg1State();
}

class _AnimatingBg1State extends State<AnimatingBg1>
    with TickerProviderStateMixin {
  List<Color> colorList = [
    Color(0xff171B70),
    Color(0xff410D75),
    Color(0xff032340),
    Color(0xff050340),
    Color(0xff2C0340),
  ];
  List<Alignment> alignmentList = [Alignment.topCenter, Alignment.bottomCenter];
  int index = 0;
  Color bottomColor = Color(0xff092646);
  Color topColor = Color(0xff410D75);
  Alignment begin = Alignment.bottomCenter;
  Alignment end = Alignment.topCenter;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(microseconds: 0),
      () {
        setState(
          () {
            bottomColor = Color(0xff33267C);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: () {
        setState(
          () {
            index = index + 1;
            bottomColor = colorList[index % colorList.length];
            topColor = colorList[(index + 1) % colorList.length];
          },
        );
      },
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [bottomColor, topColor],
        ),
      ),
    );
  }
}

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
