import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../infra/infra.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppSvgs.ideasIcon,
          width: 51.0,
          colorFilter: const ColorFilter.mode(
            AppColors.textQuartiary,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 32.0),
        Text(
          'ideas_storage'.translate(),
          style: AppTextStyles.labelBoldLarge,
        ),
        const SizedBox(height: 16.0),
        Text(
          'ideas_storage_description'.translate(),
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyCompactMedium.copyWith(
            fontFamily: 'Lato',
            fontWeight: FontWeight.w400,
            color: AppColors.textTertiary,
          ),
        ),
      ],
    );
  }
}
