import 'package:flutter/material.dart';

import '../../core.dart';

class PullToRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;

  final Widget child;

  const PullToRefresh({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      strokeWidth: 2,
      color: AppColors.textPrimary,
      backgroundColor: Colors.white,
      child: child,
    );
  }
}
