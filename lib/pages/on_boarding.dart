import 'package:flutter/material.dart';
import 'package:fruit_recognition/pages/camera_boarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CameraBoarding(),
    );
  }
}
