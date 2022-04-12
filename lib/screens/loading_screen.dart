import 'package:convida_ai_1/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.buttonsColor,
      body: Center(
        child: SpinKitWave(
          color: AppColors.backgroundColor,
          size: 50,
        ),
      ),
    );
  }
}