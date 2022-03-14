import 'package:flutter/material.dart';
import 'package:all_for_my_pet/style/colors/colors_views.dart';
import '../pages/on_boarding.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _toOnbording();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: CustomPaint(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.asset(
                    "assets/images/splash.png",
                    alignment: Alignment.center,
                    height: 150,
                  ),
                ),
              ],
            ),
            painter: _SplashCanvas(),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }

  _toOnbording() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => OnBoarding(),
      ),
    );
  }
}

class _SplashCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = ColorsSelect.btnBackgroundBo2;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final p = Path();

    p.lineTo(0, size.height * 0.10);

    p.quadraticBezierTo(size.width * 0.1, size.height * 0.20, size.width / 3,
        size.height * 0.12);

    p.quadraticBezierTo(size.width / 2.1, size.height * 0.08,
        2 * (size.width / 3), size.height * 0.12);

    p.quadraticBezierTo(size.width / 1.2, size.height * 0.15,
        3 * (size.width / 3), size.height * 0.1);

    p.lineTo(size.width, 0);

    canvas.drawPath(p, paint);
    final paint1 = Paint();

    paint1.color = ColorsSelect.btnBackgroundBo2;
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 5;

    final p1 = Path();
    p1.lineTo(0, size.height);
    p1.quadraticBezierTo(
        size.width * 0.70, size.height * 0.80, size.width, size.height);
    p1.lineTo(size.width, size.height);
    p1.lineTo(0, size.height);
    canvas.drawPath(p1, paint1);
    canvas.scale(0.30, 0.30);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
