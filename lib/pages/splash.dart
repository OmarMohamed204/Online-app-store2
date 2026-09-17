import 'package:flutter/material.dart';
import 'package:loginpages/pages/home.dart';
import 'package:loginpages/pages/profile.dart';
import 'package:loginpages/pages/register.dart';
import 'package:loginpages/shared/colors.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Register()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: BTNgreen),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("assets/images/splash.png", height: 829,),
            ],
          ),
        ),
      ),
    );
  }
}
