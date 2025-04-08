import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';

import '../../../../core/utils/size_config.dart';

class CourseContainer extends StatefulWidget {
  final String imagePath;
  final String description;
  final String lessonsNumber;
  final String time;
  final String status;
  final String teacher;
  final String teacherLogo;

  CourseContainer(
      {super.key,
      required this.imagePath,
      required this.description,
      required this.time,
      required this.status,
      required this.lessonsNumber,
      required this.teacher,
      required this.teacherLogo});
  @override
  State<CourseContainer> createState() => _CourseContainerState();
}

class _CourseContainerState extends State<CourseContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        focusColor: AppColors.grey2,
        onTap: () {},
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Course Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  widget.imagePath,
                  height: he(200),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: wi(16), vertical: he(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icons and Info Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.book, color: Colors.blue, size: 20),
                            SizedBox(width: wi(4)),
                            Text(
                              widget.lessonsNumber,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer, color: Colors.blue, size: 20),
                            SizedBox(width: wi(4)),
                            Text(
                              widget.time,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.person, color: Colors.blue, size: 20),
                            SizedBox(width: wi(4)),
                            Text(
                              widget.status,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: he(12)),
                    // Course Title
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: he(12)),
                    // Instructor Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            widget.teacherLogo,
                          ),
                        ),
                        SizedBox(width: wi(8)),
                        Text(
                          widget.teacher,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: he(16)),
                    // Join Now Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your join now action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'JOIN NOW',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
