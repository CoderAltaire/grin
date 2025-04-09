import 'package:grin/core/routes/imports.dart';

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
