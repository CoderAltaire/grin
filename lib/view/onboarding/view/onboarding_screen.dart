import 'package:grin/core/routes/imports.dart';

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
