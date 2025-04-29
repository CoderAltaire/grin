import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';

import '../../../../core/utils/size_config.dart';

class CourseContainer extends StatefulWidget {
  final String imagePath;
  final String description;
  final String price;
  final String? discountPrice;
  final String lessonsNumber;
  final String time;
  final String status;
  final String teacher;
  final String teacherLogo;

  CourseContainer({
    super.key,
    required this.imagePath,
    required this.description,
    required this.price,
    this.discountPrice,
    required this.time,
    required this.status,
    required this.lessonsNumber,
    required this.teacher,
    required this.teacherLogo,
  });

  @override
  State<CourseContainer> createState() => _CourseContainerState();
}

class _CourseContainerState extends State<CourseContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        focusColor: AppColors.grey2,
        onTap: () {},
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Course Image
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      widget.imagePath,
                      height: he(200),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Status Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.status,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Course Title
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(height: he(16)),
                    // Course Info Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(Icons.book_outlined,
                            "${widget.lessonsNumber} darslar"),
                        _buildInfoItem(Icons.timer_outlined, widget.time),
                        _buildInfoItem(Icons.groups_outlined, widget.status),
                      ],
                    ),
                    SizedBox(height: he(16)),
                    // Price Section
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.price} so'm",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue,
                          ),
                        ),
                        if (widget.discountPrice != null) ...[
                          SizedBox(width: 8),
                          Text(
                            "${widget.discountPrice} so'm",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                    SizedBox(height: he(16)),
                    // Instructor Info
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(widget.teacherLogo),
                        ),
                        SizedBox(width: wi(12)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "O'qituvchi",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              widget.teacher,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
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
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'JOIN NOW',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.5,
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

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue, size: 20),
        SizedBox(width: wi(6)),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
