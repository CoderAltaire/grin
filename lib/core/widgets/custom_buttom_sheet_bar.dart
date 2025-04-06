import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/core/widgets/line_container_widget.dart';
import 'package:scale_button/scale_button.dart';

class CustomButtomSheetBar extends StatelessWidget {
  const CustomButtomSheetBar({super.key, this.xTap});
  final Function()? xTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: SizedBox.shrink()),
        const Expanded(child: LineContainerWidget()),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              xTap == null
                  ? const SizedBox.shrink()
                  : ScaleButton(
                      onTap: xTap ?? () => Navigator.pop(context),
                      child: const Icon(Icons.close, color: AppColors.grey5))
            ],
          ),
        )
      ],
    );
  }
}
