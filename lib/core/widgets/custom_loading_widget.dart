import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              color: color ?? AppColors.white,
              strokeWidth: wi(2.5),
              backgroundColor: AppColors.black.withOpacity(.1),
            )
          : CupertinoActivityIndicator(color: color ?? AppColors.white),
    );
  }
}
