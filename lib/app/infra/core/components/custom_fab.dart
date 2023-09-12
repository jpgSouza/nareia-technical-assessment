import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../infra.dart';

class CustomFab extends StatelessWidget {
  final bool visible;

  const CustomFab({super.key, required this.visible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        padding: const EdgeInsets.all(18.0),
        width: 56.0,
        height: 56.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.roseQuartz,
              AppColors.cottonCandyPink,
              AppColors.skyBlue,
            ],
            stops: [
              0.2,
              0.5,
              1.0,
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0.0, 4.0),
              blurRadius: 30.0,
              color: Colors.black.withOpacity(0.1),
            ),
            BoxShadow(
              offset: const Offset(0.0, 10.0),
              blurRadius: 40.0,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: SvgPicture.asset(AppSvgs.magicWandIcon),
      ),
    );
  }
}
