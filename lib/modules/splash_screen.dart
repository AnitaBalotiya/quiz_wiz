import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_wiz/helper/pref.dart';

import '../../utils/widgets/logo_img.dart';
import '../helper/global.dart';
import 'auth/auth_controller.dart';
import 'auth/auth_screen.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  final authC = Get.put(AuthController());

  late AnimationController _animationC;

  @override
  void initState() {
    _animationC = AnimationController(
        vsync: this, duration: const Duration(seconds: 3))
      ..addListener(() {
        setState(() {});
        if (_animationC.isCompleted) {
          Get.offAll(
              () => Pref.skipIntro ? const HomeScreen() : const AuthScreen());
        }
      });
    _animationC.animateTo(1.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pColor,

        //
        body: Center(
            child: Column(children: [
          const Spacer(flex: 6),

          //
          const LogoImg(),

          //
          const Spacer(flex: 4),

          //
          Container(
              margin: EdgeInsets.symmetric(horizontal: mq.width * .12),

              //
              decoration: BoxDecoration(
                  borderRadius: borderRadius(20),
                  border: Border.all(color: Colors.white)),

              //
              child: LinearProgressIndicator(
                  value: _animationC.value,
                  minHeight: 6,
                  color: sColor,
                  backgroundColor: const Color(0xffe5e5e5),
                  borderRadius: borderRadius(22))),

          //
          const Spacer()
        ])));
  }
}
