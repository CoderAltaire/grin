import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/generated/l10n.dart';
import 'package:grin/view/main/profile/widget/language_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    _showLanguageBottomSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(AppIcons.logo),
          Text(
            "Welcome back",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            "Great to have you back, let's get back to our studies.",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(S.current.strYourPhone,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: he(14))),
        ],
      ),
    );
  }

  Future<void> navigate(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(INITIAL_ONBOARDING, true);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.login, (route) => false);
  }

  Future<void> _showLanguageBottomSheet(context) async {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (BuildContext context) => const LanguageButtomSheet(),
    );
  }
}
