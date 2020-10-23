part of 'parsl_scaffold.dart';

class ParslBottomNavigationBar extends StatelessWidget {
  final ParslBottomBarAction leftBottomBarAction;
  final ParslBottomBarAction rightBottomBarAction;

  ParslBottomNavigationBar(
      {this.leftBottomBarAction, this.rightBottomBarAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          _ClipShadowPath(
            shadow: Shadow(
                blurRadius: 4,
                offset: Offset(0, 4),
                color: Colors.black.withOpacity(0.25)),
            child: Container(
              height: 80,
            ),
          ),
          CustomPaint(
            painter: _CustomPainter(),
            child: Container(
              height: 80,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(height: 11),
                          leftBottomBarAction.buttonIcon,
                          SizedBox(height: 7),
                          Text(
                            leftBottomBarAction.buttonTitle,
                            style: TextStyle(
                                color: Color(0xff808084), fontSize: 12),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      onTap: () => leftBottomBarAction.buttonAction(),
                    ),
                  ),
                  Container(width: 72),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(height: 11),
                          rightBottomBarAction.buttonIcon,
                          SizedBox(height: 7),
                          Text(
                            rightBottomBarAction.buttonTitle,
                            style: TextStyle(
                                color: Color(0xff808084), fontSize: 12),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      onTap: () => rightBottomBarAction.buttonAction(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.10);
    path.quadraticBezierTo(
        size.width * -0.00, size.height * -0.00, size.width * 0.03, 0);
    path.lineTo(size.width / 2 - 34, 0);
    path.arcToPoint(Offset(size.width / 2 + 34, 0),
        radius: Radius.circular(34), clockwise: false);
    path.lineTo(size.width * 0.97, 0);
    path.quadraticBezierTo(
        size.width * 1.00, size.height * 0.00, size.width, size.height * 0.10);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

@immutable
class _ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final Widget child;

  _ClipShadowPath({
    @required this.shadow,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
        shadow: this.shadow,
      ),
      child: ClipPath(child: child),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;

  _ClipShadowShadowPainter({@required this.shadow});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    Path path = Path();
    path.moveTo(0 + shadow.offset.dx, size.height + shadow.offset.dy);
    path.lineTo(0 + shadow.offset.dx, size.height * 0.10 + shadow.offset.dy);
    path.quadraticBezierTo(
        size.width * -0.00 + shadow.offset.dx,
        size.height * -0.00 + shadow.offset.dy,
        size.width * 0.03 + shadow.offset.dx,
        0 + shadow.offset.dy);
    path.lineTo(size.width / 2 - 34 + shadow.offset.dx, 0 + shadow.offset.dy);
    path.arcToPoint(
        Offset(size.width / 2 + 34 + shadow.offset.dx, 0 + shadow.offset.dy),
        radius: Radius.circular(34),
        clockwise: false);
    path.lineTo(size.width * 0.97 + shadow.offset.dx, 0 + shadow.offset.dy);
    path.quadraticBezierTo(
        size.width * 1.00 + shadow.offset.dx,
        size.height * 0.00 + shadow.offset.dy,
        size.width + shadow.offset.dx,
        size.height * 0.10 + shadow.offset.dy);
    path.lineTo(size.width + shadow.offset.dx, size.height + shadow.offset.dy);
    path.lineTo(0 + shadow.offset.dx, size.height + shadow.offset.dy);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
