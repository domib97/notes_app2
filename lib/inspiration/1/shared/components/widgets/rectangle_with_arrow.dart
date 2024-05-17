import 'package:flutter/material.dart';

class RectangleWithArrow extends StatelessWidget {
  final Widget child;

  RectangleWithArrow({required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RectangleWithArrowPainter(),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

class RectangleWithArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final rectWidth = size.width - 20.0;
    final rectHeight = size.height - 120.0;
    final rect = Rect.fromLTWH(8.0, 60.0, rectWidth, rectHeight);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(8.0),
        topRight: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      ),
      paint,
    );

    final arrowPath = Path();
    arrowPath.moveTo(rect.center.dx - 40.0, rect.bottom + 10.0);
    arrowPath.lineTo(rect.center.dx + 40.0, rect.bottom + 10.0);
    arrowPath.lineTo(rect.center.dx, rect.bottom + 110.0);
    arrowPath.close();

    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}