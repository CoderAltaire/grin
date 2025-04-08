import 'package:flutter/material.dart';
import 'package:grin/core/routes/app_routes.dart';

import '../../../core/utils/size_config.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../widgets/select_lg_container.dart';

class SelectLgScreen extends StatefulWidget {
  const SelectLgScreen({super.key});

  @override
  State<SelectLgScreen> createState() => _SelectLgScreenState();
}

class _SelectLgScreenState extends State<SelectLgScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> languages = [
    {
      'image': AppImages.imgArbFlag,
      'language': 'Arabic',
    },
    {
      'image': AppImages.imgEngFlag,
      'language': 'English',
    },
    {
      'image': AppImages.imgKorFlag,
      'language': 'Korean',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Image.asset(
                  AppImages.logo,
                  height: 50,
                ),
                SizedBox(height: 20),
                richText(context),
                ...List.generate(languages.length, (index) {
                  return SelectLgContainerWidget(
                    imagePath: languages[index]['image']!,
                    language: languages[index]['language']!,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  );
                }),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: wi(30), vertical: he(10)),
                  child: CustomButton(
                    height: 45,
                    radius: 10,
                    bgColor: AppColors.whiteBlue,
                    text: 'Get Started',
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.mainScreen);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: wi(30), vertical: he(10)),
                  child: CustomButton(
                    height: 45,
                    border: Border.all(color: AppColors.whiteBlue),
                    bgColor: AppColors.white,
                    text: 'Back',
                    textColor: AppColors.whiteBlue,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget richText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          // "Select the" in black
          TextSpan(
            text: 'Select the\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
          ),
          // "language" with gradient
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline, // Align with the baseline
            baseline: TextBaseline
                .alphabetic, // Use alphabetic baseline for proper text alignment
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.purple], // Gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: Text(
                'language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: Colors
                          .white, // This color will be overridden by the gradient
                    ),
              ),
            ),
          ),
          // "you want to learn" in black
          TextSpan(
            text: ' you\nwant to learn',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 38,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
