import 'package:flutter/material.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/view/drawer/widgets/custom_lessons.dart';

class MyResultsScreen extends StatefulWidget {
  const MyResultsScreen({super.key});

  @override
  State<MyResultsScreen> createState() => _MyResultsScreenState();
}

class _MyResultsScreenState extends State<MyResultsScreen> {
  final List<Map<String, String>> lessons = [
    {'title': 'Intro', 'duration': '34 min'},
    {'title': 'Lesson 1', 'duration': '34 min'},
    {'title': 'Lesson 2', 'duration': '34 min'},
    {'title': 'Lesson 3', 'duration': '34 min'},
    {'title': 'Lesson 4', 'duration': '34 min'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wi(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: wi(30), vertical: he(15)),
                  child: Text(
                    'The English Master Course',
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black1),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Chip(
                    label: Text('18 Lesson'),
                    labelStyle: TextStyle(
                        color: AppColors.whiteBlue2,
                        fontWeight: FontWeight.w400),
                    backgroundColor: AppColors.whiteBlue3,
                  ),
                  SizedBox(width: wi(12)),
                  Chip(
                    label: Text('1h 30m'),
                    labelStyle: TextStyle(
                        color: AppColors.whiteBlue2,
                        fontWeight: FontWeight.w400),
                    backgroundColor: AppColors.whiteBlue3,
                  ),
                  SizedBox(width: wi(12)),
                  Chip(
                    label: Text('Beginner'),
                    labelStyle: TextStyle(
                        color: AppColors.whiteBlue2,
                        fontWeight: FontWeight.w400),
                    backgroundColor: AppColors.whiteBlue3,
                  ),
                ],
              ),
              SizedBox(height: he(15)),

              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: he(176),
                  width: wi(330),
                  decoration: BoxDecoration(
                    color: AppColors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.play_circle_outlined,
                    size: he(83),
                    color: AppColors.white,
                  )),
                ),
              ),
              SizedBox(height: he(15)),
              Text(
                'Course Materials',
                style: TextStyle(
                    color: AppColors.black1,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              SizedBox(height: he(15)),

              Text(
                '148 sections • 722 lectures',
                style: TextStyle(color: AppColors.black3, fontSize: 12),
              ),
              SizedBox(height: 16),
              // Darslar ro'yxati
              CustomLessons(lessons: lessons),
            ],
          ),
        ),
      ),
    );
  }
}
