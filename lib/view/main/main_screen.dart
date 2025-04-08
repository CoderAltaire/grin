import 'dart:io';
import 'package:grin/Cubit/main_tab/main_tab_cubit.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/extension/widget_extantion.dart';
import 'package:grin/core/utils/log_service.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/core/widgets/custom_bottom_tab_item.dart';

import 'package:grin/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grin/view/drawer/view/my_drawer_screen.dart';
import 'package:grin/view/main/home/view/home_screen.dart';
import 'package:grin/view/main/my_certificates/view/my_certificate_screen.dart';
import 'package:grin/view/main/my_courses/view/my_courses_screen.dart';
import 'package:grin/view/main/profile/view/my_settinges_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    var state = context.read<MainTabCubit>().state;
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: state.main,
    );
    tabController.addListener(() {
      var bloc = context.read<MainTabCubit>();
      bloc.isMainTab(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTabCubit, MainTabState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Kelvin Klein',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: wi(10)),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => tabController.animateTo(3),
                child: CircleAvatar(
                  backgroundImage: AssetImage(AppImages.lesson1),
                ),
              ),
            ],
          ),
        ),
        drawer: MyDrawerScreen(),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(
          children: [
            TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                MyCoursesScreen(),
                MyCertificateScreen(),
                MySettingsScreen(),
              ],
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          bottom: false,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: he(85),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(width: wi(1.5), color: AppColors.secondary),
              ),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              enableFeedback: true,
              indicator: const BoxDecoration(),
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.ic_home,
                  onTap: () => tabController.animateTo(0),
                  index: 0,
                  label: "Home",
                ),
                BottomTabItem(
                    currentIndex: state.main,
                    icon: AppIcons.ic_course,
                    onTap: () => tabController.animateTo(1),
                    index: 1,
                    label: "My Courses"),
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.ic_certificate,
                  onTap: () => tabController.animateTo(2),
                  index: 2,
                  label: 'Certificate',
                ),
                BottomTabItem(
                  index: 3,
                  currentIndex: state.main,
                  icon: AppIcons.ic_settinges,
                  onTap: () => tabController.animateTo(3),
                  label: "Settings",
                ),
              ],
            ).paddingOnly(
              bottom: Platform.isAndroid ? he(8) : he(16),
              top: he(6),
            ),
          ),
        ),
      );
    });
  }
}

// Future<void> _showRegistrationBottomSheet(BuildContext context) async {
//   return showModalBottomSheet<void>(
//     context: context,
//     useSafeArea: true,
//     isDismissible: true,
//     enableDrag: true,
//     isScrollControlled: true,
//     backgroundColor: AppColors.transparent,
//     builder: (BuildContext context) => const RegistrationRequest(),
//   );
// }

//BirQadamClient-01-01-2025.apk
