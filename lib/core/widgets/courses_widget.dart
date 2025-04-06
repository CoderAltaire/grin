import 'package:flutter/material.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/widgets/custom_button.dart';

class CoursesWidget extends StatefulWidget {
  final Function() onTap;
  const CoursesWidget({super.key, required this.onTap});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.icEngFlag),
        Row(
          children: [],
        ),
        Text(""),
        Row(
          children: [],
        ),
        CustomButton(
          text: "",
          onTap: widget.onTap,
        )
      ],
    );
  }
}
