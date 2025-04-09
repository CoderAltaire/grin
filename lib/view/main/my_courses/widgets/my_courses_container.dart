import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';

import '../../../../core/routes/imports.dart';
import '../../../../core/utils/size_config.dart';

class MyCoursesContainer extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const MyCoursesContainer({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<MyCoursesContainer> createState() => _MyCoursesContainerState();
}

class _MyCoursesContainerState extends State<MyCoursesContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        focusColor: AppColors.grey2,
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.myResults);
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              Padding(
                padding: EdgeInsets.only(
                    left: wi(16), right: wi(16), top: he(16), bottom: he(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    4,
                  ),
                  child: Image.asset(
                    widget.image,
                    height: he(150),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Title and Description
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: he(4)),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.5, // Matn orasidagi bo'shliqni sozlash
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
