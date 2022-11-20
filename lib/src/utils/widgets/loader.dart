import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:timepass/src/utils/constants/app_colors.dart';

class Loader extends StatelessWidget {
  double size;
  Color? color;

  Loader({this.size = 30, this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      size: size,
      color: color ?? AppColors.black,
    );
  }
}