import 'package:flutter/material.dart';

import '../../../domain_layer/domain_layer.dart';
import '../../../infra/infra.dart';
import 'widgets/post_widget.dart';

class DailyPage extends StatefulWidget {
  final ScrollController scrollController;

  const DailyPage({super.key, required this.scrollController});

  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'expires_in'.translate(),
              style: AppTextStyles.bodyCompactSmall,
            ),
          ),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              'daily_ideas'.translate(),
              style: AppTextStyles.bodyCompactLarge,
            ),
          ),
          const SizedBox(height: 36.0),
          PostWidget(
            ideas: IdeasEntity(
              userNickname: 'kimkardashian',
              userImage:
                  'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              imageUrl:
                  'https://images.pexels.com/photos/18036794/pexels-photo-18036794/free-photo-of-a-cup-and-a-book-laying-on-a-bed-with-white-sheets.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              highLightText:
                  'Promoting my company\'s new collection with a photoshoot',
              description:
                  'Time for a coffee break ☕️ Loving this new drink from @localcoffeeshop #supportlocal #coffeelover',
            ),
          ),
        ],
      ),
    );
  }
}
