import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../infra/infra.dart';
import 'post_widget.dart';

class PostActionButton extends StatelessWidget {
  final List<PostActions> actions;

  const PostActionButton({super.key, required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(
          color: AppColors.textPrimary.withOpacity(0.13),
        ),
      ),
      child: Row(
        children: actions.map(
          (action) {
            final displayDivider =
                actions.indexOf(action) % 2 == 0 && actions.length > 1;

            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SvgPicture.asset(
                      action.iconPath,
                    ),
                  ),
                  displayDivider
                      ? VerticalDivider(
                          width: 0.0,
                          thickness: 1.0,
                          color: AppColors.textPrimary.withOpacity(0.13),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
