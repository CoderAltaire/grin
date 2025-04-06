import 'package:flutter/material.dart';
import 'package:grin/core/values/app_colors.dart';

Widget customDivider =
    const Divider(color: AppColors.secondary, thickness: 1.5, height: 0);

final double customButtonPadding =
    MediaQuery.of(navigatorKey.currentState!.context).padding.bottom + 20;
final double customButtonPadding10 =
    MediaQuery.of(navigatorKey.currentState!.context).padding.bottom + 10;
final double customBarPadding =
    MediaQuery.of(navigatorKey.currentState!.context).padding.top;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
