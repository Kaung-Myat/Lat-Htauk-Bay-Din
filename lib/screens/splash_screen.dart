import 'package:flutter/material.dart';
import 'package:lat_htauk_day_din/screens/home_screen.dart';
import 'package:lat_htauk_day_din/utils/colors.dart';
import 'package:lat_htauk_day_din/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  mintheinkhaImgPath,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            CircularProgressIndicator(
              strokeWidth: 3.5,
              color: primary,
            )
          ],
        ),
      ),
    );
  }
}