import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../infra/infra.dart';

class PostShimmerWidget extends StatelessWidget {
  const PostShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomShimmer(
              width: 300 + Random().nextDouble() * (120 - 20),
              height: 18.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomShimmer(
              width: 160 + Random().nextDouble() * (120 - 90),
              height: 18.0,
            ),
          ),
          const SizedBox(height: 22.0),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 18.0),
                child: CustomShimmer(
                  width: 45.0,
                  height: 45.0,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              CustomShimmer(
                width: 90 + Random().nextDouble() * (120 - 90),
                height: 16.0,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const CustomShimmer(
            width: double.maxFinite,
            height: 400.0,
            borderRadius: 0.0,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
