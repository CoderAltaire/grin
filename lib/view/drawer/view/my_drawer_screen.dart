import 'package:flutter/material.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';

class MyDrawerScreen extends StatelessWidget {
  const MyDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Image.asset(
              AppImages.grin_uz_logo,
              width: wi(95),
              height: he(26),
            ), // Hozircha logo shu
          ),
          Divider(
            color: AppColors.black,
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Results'),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.myResults);
              // Navigatsiya qilmoqchi bo‘lsang, shu yerda qilasan
            },
          ),
        ],
      ),
    );
  }
}
