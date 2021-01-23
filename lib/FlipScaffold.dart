import 'dart:math';
import 'package:flutter/material.dart';

class FlipScaffold extends StatefulWidget {
  final drawer;
  final homepage;
  FlipScaffold({this.drawer, this.homepage});

  @override
  _FlipScaffoldState createState() => _FlipScaffoldState();
}

class _FlipScaffoldState extends State<FlipScaffold>
    with SingleTickerProviderStateMixin {
  double maxSlide = 300;
  AnimationController controller;
  double minDragStartEdge = 400;
  double maxDragStartEdge = 0;
  bool _canBeDragged;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  void open() {
    controller.forward();
  }

  void close() {
    controller.reverse();
  }

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        controller.isDismissed && details.globalPosition.dx < minDragStartEdge;
    bool isDragCloseFromRight =
        controller.isCompleted && details.globalPosition.dx > maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      controller.value += delta;
    }
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
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          double slide = maxSlide * controller.value;
          double scale = 1 - (controller.value * 0.3);
          return Stack(
            children: <Widget>[
              Container(color: Colors.green[500]),
              Transform.translate(
                offset: Offset(maxSlide * (controller.value - 1), 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(pi / 2 * (1 - controller.value)),
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: maxSlide,
                    child: widget.drawer,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(maxSlide * controller.value, 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(-pi / 2 * controller.value),
                  alignment: Alignment.centerLeft,
                  child: widget.homepage,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
