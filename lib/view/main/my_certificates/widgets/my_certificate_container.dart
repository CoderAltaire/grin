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
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Certificate Image
            Image.asset(
              image,
              height: he(250), // Rasm balandligi rasmga moslashtirildi
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Title and Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: wi(16), vertical: he(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: he(15)),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
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
