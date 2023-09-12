import 'package:flutter/material.dart';

import '../../core.dart';

class CustomSegmentedPicker<T> extends StatelessWidget {
  final T selected;

  final String Function(T) titleBuilder;

  final ValueChanged<T> onChanged;

  final List<T> options;

  const CustomSegmentedPicker({
    Key? key,
    required this.selected,
    required this.onChanged,
    required this.titleBuilder,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: AppColors.boxColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: options.map((item) {
          final isSelected = item == selected;

          final isEven = options.indexOf(item) % 2 == 0;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(item),
              child: AnimatedContainer(
                curve: Curves.easeIn,
                margin: EdgeInsets.only(right: isEven ? 4.0 : 0.0),
                padding: const EdgeInsets.all(10.0),
                duration: const Duration(milliseconds: 250),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : AppColors.boxColor,
                  borderRadius: BorderRadius.circular(11.0),
                  border: isSelected
                      ? Border.all(
                          width: 0.5,
                          color: Colors.black.withOpacity(0.04),
                        )
                      : null,
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(0.04),
                            blurStyle: BlurStyle.inner,
                          ),
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 8.0,
                            color: Colors.black.withOpacity(0.12),
                            blurStyle: BlurStyle.inner,
                          ),
                        ]
                      : [],
                ),
                child: Center(
                  child: Text(
                    titleBuilder(item),
                    style: AppTextStyles.bodyCompactMedium,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
