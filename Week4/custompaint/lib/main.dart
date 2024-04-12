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
      ..moveTo(borderRadius, 0);

    if (leftConvex) { //왼쪽 경계면이 볼록한 경우
      leftPath.arcToPoint(
        Offset(borderRadius, size.height),
        radius: Radius.circular(borderRadius),
        clockwise: false,
      );
      leftPath.lineTo(size.width - borderRadius, size.height);
    }

    else {  //왼쪽 경계면이 오목한 경우
      leftPath.lineTo(0, 0);
      leftPath.arcToPoint(
        Offset(0, size.height),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
      leftPath.lineTo(size.width - borderRadius, size.height);
    }

    final rightPath = Path()
      ..moveTo(size.width - borderRadius, size.height);

    if (rightConvex) {  //오른쪽 경계면이 볼록한 경우
      rightPath.arcToPoint(
        Offset(size.width - borderRadius, 0),
        radius: Radius.circular(borderRadius),
        clockwise: false,
      );
      rightPath.lineTo(borderRadius, 0);
    }

    else {  //오른쪽 경계면이 오목한 경우
      rightPath.lineTo(size.width, size.height);
      rightPath.arcToPoint(
        Offset(size.width, 0),
        radius: Radius.circular(borderRadius),
        clockwise: true,
      );
      rightPath.lineTo(borderRadius, 0);
    }

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