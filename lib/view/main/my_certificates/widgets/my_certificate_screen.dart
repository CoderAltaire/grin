import 'package:flutter/material.dart';
import 'package:grin/core/routes/imports.dart';
import 'package:grin/generated/l10n.dart';
import 'package:grin/view/main/my_certificates/widgets/my_certificate_container.dart';

import '../../../../core/utils/size_config.dart';

class MyCertificateScreen extends StatefulWidget {
  const MyCertificateScreen({super.key});

  @override
  State<MyCertificateScreen> createState() => _MyCertificateScreenState();
}

class _MyCertificateScreenState extends State<MyCertificateScreen> {
  static List<Map<String, String>> certificateList = [
    {
      'image': 'assets/images/certificate1.png',
      'title': 'English Pronunciation Masterclass',
    },
    {
      'image': 'assets/images/certificate1.png',
      'title': 'Web Development Certification',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).strRecCertificate,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600, fontSize: 21),
            ),
            SizedBox(height: he(10)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: certificateList.length,
              itemBuilder: (context, index) {
                final certificate = certificateList[index];
                return CertificateContainer(
                    image: certificate["image"] ?? "no data",
                    title: certificate["title"] ?? "no data");
              },
            ),
          ],
        ).paddingSymmetric(horizontal: wi(16), vertical: he(10)),
      )),
    );
  }
}
