import 'package:flutter/material.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_colors.dart';

class LineContainerWidget extends StatelessWidget {
  const LineContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        height: he(5),
        width: wi(35),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.grey2),
      ),
    ]);
  }
}
