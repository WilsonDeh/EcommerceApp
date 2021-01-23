import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:get/get.dart';
import 'package:version1/Controllers.dart';
import 'package:version1/screens/SignInPage.dart';
import 'dart:math';

import 'package:version1/widgets.dart';

class DraggableObject extends StatefulWidget {
  @override
  _DraggableObjectState createState() => _DraggableObjectState();
}

class _DraggableObjectState extends State<DraggableObject>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  var scaleAnimation;
  var fadeAnimation;

  void _onDragUpdate(DragUpdateDetails details) {
    double delta = details.primaryDelta / 50;
    controller.value += delta;
  }

  void _onDragEnd(DragEndDetails details) {
    if (controller.isDismissed || controller.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      controller.fling(velocity: visualVelocity);
    } else if (controller.value < 0.5) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..forward();

    scaleAnimation = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut))
          ..addListener(() {
            setState(() {});
          });

    fadeAnimation = Tween(begin: 0.5, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut))
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                  scale: scaleAnimation.value,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          print("tapped");
                        });
                      },
                      child: PopCircle(controller: controller)),
                ),
                Transform.scale(
                  scale: scaleAnimation.value,
                  child: GestureDetector(
                      onTap: () {
                        //Get.to(dssPage());
                      },
                      child: PopCircle(controller: controller)),
                ),
                Transform.scale(
                    scale: scaleAnimation.value,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  transitionsBuilder: (context, animation,
                                      secAnimation, child) {
                                    animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeOutQuart);

                                    return ScaleTransition(
                                      scale: animation,
                                      alignment: Alignment.center,
                                      child: FadeTransition(
                                          opacity: animation, child: child),
                                    );
                                  },
                                  pageBuilder: (
                                    context,
                                    animation,
                                    secAnimation,
                                  ) {
                                    return null;
                                  }));
                        },
                        child: PopCircle(controller: controller))),
              ],
            ),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
