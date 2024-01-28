import 'package:flutter/material.dart';

class Utils {
  static bool isMobileDevice(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 800;
  }
}
