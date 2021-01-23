import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double maxSlide = 225.0;
  double minDragStartEdge = 400;
  double maxDragStartEdge = 200;
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

  void toggle() {
    controller.isDismissed ? controller.forward() : controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        double slide = maxSlide * controller.value;
        double scale = 1 - (controller.value * 0.3);
        return Stack(
          children: <Widget>[
            Container(color: Colors.blue),
            Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onHorizontalDragStart: _onDragStart,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    onTap: () {
                      //Drawer
                      toggle();
                    },
                    child: Container(
                      color: Colors.blue[900],
                    )))
          ],
        );
      },
    );
  }
}
