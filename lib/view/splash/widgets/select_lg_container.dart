import 'package:flutter/material.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/values/app_colors.dart';

class SelectLgContainerWidget extends StatelessWidget {
  final String imagePath;
  final String language;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectLgContainerWidget({
    super.key,
    required this.imagePath,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: he(10)),
        padding: EdgeInsets.symmetric(vertical: he(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        width: wi(210),
        height: he(133),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: he(56),
              fit: BoxFit.contain,
            ),
            Text(
              language,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
