import 'package:cached_network_image/cached_network_image.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
            if (ideas.verified) ...[
              const SizedBox(
                width: 4.0,
              ),
              const Icon(
                Icons.verified,
                size: 18.0,
                color: AppColors.cerulanSpark,
              ),
            ],
          ],
        ),
        const SizedBox(height: 16.0),
        Stack(
          children: [
            CachedNetworkImage(
              height: 400.0,
              imageUrl: ideas.imageUrl,
              fit: BoxFit.cover,
            ),
            Positioned(
              right: 12.0,
              top: 16.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white.withOpacity(0.82),
                  border: Border.all(
                    color: AppColors.textPrimary.withOpacity(0.08),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.file_download_sharp,
                      size: 18.0,
                      color: AppColors.textPrimary,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'try_own_photo'.translate(),
                      style: AppTextStyles.labelExtraSmall.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        const SizedBox(height: 36.0),
      ],
    );
  }
}
