import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';

import '../../../../core/utils/size_config.dart';

class CertificateContainer extends StatelessWidget {
  final String image;
  final String title;

  const CertificateContainer({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(10)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Certificate Image
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: wi(16), vertical: he(16)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  image,
                  height: he(250),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title and Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: wi(16), vertical: he(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: he(25)),
                  // Download Certificate Button
                  SizedBox(
                    width: double.infinity,
                    height: he(56),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Download funksiyasini bu yerga qo'shishingiz mumkin
                      },
                      icon: const Icon(
                        Icons.picture_as_pdf,
                        color: Colors.blue,
                        size: 20,
                      ),
                      label: const Text(
                        'Download Certificate',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blue),
                        padding: EdgeInsets.symmetric(vertical: he(12)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
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
    );
  }
}
