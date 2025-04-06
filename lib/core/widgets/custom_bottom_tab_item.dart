import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomTabItem extends StatelessWidget {
  const BottomTabItem({
    super.key,
    required int currentIndex,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.index,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;
  final int index;
  final VoidCallback onTap;
  final String label;
  final String icon;

  @override
  Widget build(BuildContext context) {
    bool isSelected = index == _currentIndex;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: isSelected ? he(26) : he(22),
            curve: Curves.easeIn,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primaryColor : AppColors.grey3,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(height: he(6)),
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: isSelected ? 14 : 12,
                  color: isSelected ? AppColors.primaryColor : AppColors.grey3,
                  fontWeight: FontWeight.w500,
                ),
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(height: he(8)),
        ],
      ),
    );
  }
}
