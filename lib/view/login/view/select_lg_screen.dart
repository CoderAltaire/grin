import 'package:grin/core/routes/imports.dart';

class SelectLgScreen extends StatefulWidget {
  const SelectLgScreen({super.key});

  @override
  State<SelectLgScreen> createState() => _SelectLgScreenState();
}

class _SelectLgScreenState extends State<SelectLgScreen> {
  int selectedIndex = -1;

  final List<LangModel> lanList = [
    LangModel(title: "Russian ", code: 'ru', icon: AppImages.icRusFlag),
    LangModel(title: "English ", code: 'en', icon: AppImages.icEngFlag),
    LangModel(title: "Uzbek ", code: 'uz', icon: AppImages.icUzFlag),
  ];

  final List<Map<String, String>> languages = [
    {
      'image': AppImages.icRusFlag,
      'language': 'Russian',
    },
    {
      'image': AppImages.icEngFlag,
      'language': 'English',
    },
    {
      'image': AppImages.icUzFlag,
      'language': 'Uzbek',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
        listener: (BuildContext context, ProfileState state) {
      if (state.status == Status.SUCCESS) {}
    }, builder: (context, state) {
      var bloc = context.read<ProfileCubit>();
      return Scaffold(
        backgroundColor: Color(0xFFF8FAFC),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: he(30)),
                Image.asset(
                  AppImages.logo,
                  height: he(50),
                  colorBlendMode: BlendMode.srcIn,
                ),
                SizedBox(height: he(20)),
                richText(context),
                ...List.generate(languages.length, (index) {
                  return SelectLgContainerWidget(
                    imagePath: languages[index]['image']!,
                    language: languages[index]['language']!,
                    isSelected: selectedIndex == index,
                    onTap: () async {
                      setState(() {
                        selectedIndex = index;
                        // Only update language preference without affecting Windsurf
                        bloc.enterLang(lanList[selectedIndex].code);
                      });
                    },
                  );
                }),
                CustomButton(
                  height: he(45),
                  radius: 10,
                  bgColor: AppColors.whiteBlue,
                  text: 'Get Started',
                  onTap: () async {
                    if (selectedIndex != -1) {
                      await bloc.enterLang(lanList[selectedIndex].code);
                      Navigator.pushNamed(context, AppRoutes.mainScreen);
                    }
                  },
                ).paddingSymmetric(horizontal: wi(30), vertical: he(10)),
                CustomButton(
                  text: "Back",
                  height: 45,
                  border: Border.all(color: AppColors.whiteBlue),
                  bgColor: AppColors.white,
                  textColor: AppColors.whiteBlue,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ).paddingSymmetric(horizontal: wi(30), vertical: he(10)),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget richText(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          // "Select the" in black
          TextSpan(
            text: 'Select the\n',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
          // "language" with gradient
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline, // Align with the baseline
            baseline: TextBaseline
                .alphabetic, // Use alphabetic baseline for proper text alignment
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.purple], // Gradient colors
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(bounds);
              },
              child: Text(
                'language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      color: Colors
                          .white, // This color will be overridden by the gradient
                    ),
              ),
            ),
          ),
          // "you want to learn" in black
          TextSpan(
            text: ' you\nwant to learn',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 38,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
