import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ContainerColumn(),
      ),
    );
  }
}

class ContainerColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            size: Size(264, 99.5),
            painter: MyPainter(
              leftConvex: false,
              rightConvex: true,
            ),
          ),
          SizedBox(height: 30.0),
          CustomPaint(
            size: Size(214, 100),
            painter: MyPainter(
              leftConvex: false,
              rightConvex: false,
            ),
          ),
          SizedBox(height: 30.0),
          CustomPaint(
            size: Size(314, 100),
            painter: MyPainter(
              leftConvex: true,
              rightConvex: true,
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final bool leftConvex;
  final bool rightConvex;

  MyPainter({this.leftConvex = false, this.rightConvex = false});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    final double borderRadius = size.height / 2;

    final leftPath = Path()
      ..moveTo(0, 0);

    if (leftConvex) {
      leftPath.lineTo(0, size.height);
      leftPath.arcToPoint(
        Offset(borderRadius, size.height),
        radius: Radius.circular(borderRadius),
        clockwise: false,
      );
    } else {
      leftPath.lineTo(borderRadius, size.height);
    }

    leftPath.lineTo(size.width - borderRadius, size.height);
    leftPath.lineTo(size.width, 0);
    leftPath.lineTo(0, 0);

    final rightPath = Path()
      ..moveTo(size.width, 0);

    if (rightConvex) {
      rightPath.lineTo(size.width, size.height);
      rightPath.arcToPoint(
        Offset(size.width - borderRadius, 0),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
    } else {
      rightPath.lineTo(size.width - borderRadius, 0);
    }

    rightPath.lineTo(borderRadius, 0);
    rightPath.lineTo(0, size.height);
    rightPath.lineTo(size.width, size.height);

    final Path combinedPath = Path.combine(
      PathOperation.union,
      leftPath,
      rightPath,
    );

    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}