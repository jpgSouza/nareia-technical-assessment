import 'package:flutter/material.dart';

import '../../../../domain_layer/domain_layer.dart';
import '../../../../infra/infra.dart';
import 'post_action_button_widget.dart';
import 'user_avatar_widget.dart';

enum PostActions {
  refresh(AppSvgs.refreshIcon),
  like(AppSvgs.likeIcon),
  dislike(AppSvgs.dislikeIcon),
  save(AppSvgs.saveIcon);

  final String iconPath;

  const PostActions(this.iconPath);
}

class PostWidget extends StatelessWidget {
  final IdeasEntity ideas;

  const PostWidget({super.key, required this.ideas});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            ideas.highLightText,
            style: AppTextStyles.titleMedium,
          ),
        ),
        const SizedBox(height: 22.0),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: UserAvatar(
                userImage: ideas.userImage,
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Text(
              ideas.userNickname,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Container(
          height: 400.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.network(ideas.imageUrl).image,
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: ideas.userNickname,
                  style: AppTextStyles.bodyCompactLarge.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const WidgetSpan(
                  child: SizedBox(
                    width: 6.0,
                  ),
                ),
                TextSpan(
                  text: ideas.description,
                  style: AppTextStyles.bodyCompactLarge,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PostActionButton(
                  actions: [PostActions.refresh],
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                flex: 2,
                child: PostActionButton(
                  actions: [PostActions.like, PostActions.dislike],
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: PostActionButton(
                  actions: [PostActions.save],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
