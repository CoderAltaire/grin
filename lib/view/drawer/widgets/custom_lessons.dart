import 'package:flutter/material.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_colors.dart';

class CustomLessons extends StatefulWidget {
  final List<Map<String, String>> lessons;
  const CustomLessons({super.key, required this.lessons});

  @override
  State<CustomLessons> createState() => _CustomLessonsState();
}

class _CustomLessonsState extends State<CustomLessons> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.lessons.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(height: he(15)),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(
                    Icons.play_circle_outline,
                    color: Colors.blue,
                  ),
                  title: Text(
                    widget.lessons[index]['title'] ?? "empty",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.whiteBlueText),
                  ),
                  trailing: Text(
                    widget.lessons[index]['duration'] ?? "no data",
                    style: TextStyle(
                        color: AppColors.grey4,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                ),
              ),
              Divider(
                color: AppColors.black,
              ),
            ],
          );
        },
      ),
    );
  }
}
