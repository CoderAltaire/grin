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
import 'package:grin/view/main/home/home_screen.dart';

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
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Stack(
          children: [
            TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
                HomeScreen(),
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
                  icon: AppIcons.icHome,
                  onTap: () => tabController.animateTo(0),
                  index: 0,
                  label: S.of(context).main,
                ),
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.icCategory,
                  onTap: () => tabController.animateTo(1),
                  index: 1,
                  label: S.of(context).strCategory,
                ),
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.orders,
                  onTap: () => tabController.animateTo(2),
                  index: 2,
                  label: S.of(context).strOrders,
                ),
                BottomTabItem(
                  index: 3,
                  currentIndex: state.main,
                  icon: AppIcons.icPerson,
                  onTap: () => tabController.animateTo(2),
                  label: S.of(context).strProfile,
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
