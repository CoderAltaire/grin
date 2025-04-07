import 'package:flutter/material.dart';
import '../utils/size_config.dart';
import '../values/app_colors.dart';

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
        padding: EdgeInsets.symmetric(vertical: he(30)),
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
        width: SizeConfig.screenWidth! * 0.65,
        height: SizeConfig.screenHeight!*0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: he(70),
              fit: BoxFit.contain,
            ),
            SizedBox(height: he(10)),
            Text(
              language,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
