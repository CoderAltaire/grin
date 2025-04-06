// ignore_for_file: use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:grin/core/routes/app_pages.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/core/utils/helper/helper_widget.dart';

class CheckConnection {
  CheckConnection._();

  static Future<void> scheduleRequest() async {
    var connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((connectivityResult) async {
      if (connectivityResult.any((c) {
        return c == ConnectivityResult.wifi ||
            c == ConnectivityResult.mobile ||
            c == ConnectivityResult.ethernet;
      })) {
        if (RouteGenerate.routeName == AppRoutes.noInternet) {
          // navigatorKey.currentState!.context
          //     .read<NotificationsCubit>()
          //     .getNotifications(isRead: false, isNotification: true, page: 1);

          // Navigator.pushNamedAndRemoveUntil(navigatorKey.currentState!.context,
          //     AppRoutes.mainScreen, (route) => false);
        }
      } else {
        // Wait for a second and check again
        await Future.delayed(const Duration(milliseconds: 1000));
        final doubleCheck = await connectivity.checkConnectivity();
        if (doubleCheck.any((c) {
          return c == ConnectivityResult.wifi &&
              c == ConnectivityResult.mobile &&
              c == ConnectivityResult.ethernet;
        })) {
          // Navigate to the no internet screen
          Navigator.pushNamed(
              navigatorKey.currentState!.context, AppRoutes.noInternet);
        }
      }
    });
  }
}
