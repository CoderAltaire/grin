import 'package:flutter/material.dart';
import 'package:grin/core/common/pagination/custom_empty_widget.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/generated/l10n.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomEmptyWidget(
          icon: AppIcons.icNoInternet,
          title: S.current.strAttentionError,
          subTitle: S.current.strNoConnectionInternet,
          buttonText: S.current.strRetry),
    );
  }
}
