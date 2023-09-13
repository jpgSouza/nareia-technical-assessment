import 'package:flutter/material.dart';

import '../../infra.dart';

class CustomError extends StatelessWidget {
  final String errorMessage;

  final VoidCallback? onRetry;

  const CustomError({super.key, required this.errorMessage, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          const Icon(
            Icons.error_outline,
            color: AppColors.textPrimary,
            size: 48.0,
          ),
          const SizedBox(height: 12.0),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.titleMedium,
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.textPrimary,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14.0,
                  ),
                ),
                child: Text(
                  'retry'.translate(),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
