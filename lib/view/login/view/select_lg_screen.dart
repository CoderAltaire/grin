import 'package:grin/core/routes/imports.dart';

class SelectLgScreen extends StatefulWidget {
  const SelectLgScreen({super.key});

  @override
  State<SelectLgScreen> createState() => _SelectLgScreenState();
}

class _SelectLgScreenState extends State<SelectLgScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> languages = [
    {
      'image': AppImages.imgEngFlag,
      'language': 'Russian',
    },
    {
      'image': AppImages.imgKorFlag,
      'language': 'English',
    },
    {
      'image': AppImages.imgArbFlag,
      'language': 'Uzbek',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<LangModel> lanList = [
      LangModel(
          title: S.of(context).strRussian,
          code: 'ru',
          icon: AppImages.icRusFlag),
      LangModel(
          title: S.of(context).strEnglish,
          code: 'en',
          icon: AppImages.icEngFlag),
      LangModel(
          title: S.of(context).strUzbek, code: 'uz', icon: AppImages.icUzFlag),
    ];

    final List<Map<String, String>> languages = lanList.map((lang) {
      return {
        'image': lang.icon,
        'language': lang.title,
      };
    }).toList();

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
                        bloc.enterLang(
                            lanList[selectedIndex].code); // Tilni o‘zgartirish
                      });
                    },
                  );
                }),
                CustomButton(
                  height: he(45),
                  radius: 10,
                  bgColor: AppColors.whiteBlue,
                  text: S.of(context).strGetStarted,
                  onTap: () async {
                    await bloc.enterLang(lanList[selectedIndex].code);
                    Navigator.pushNamed(context, AppRoutes.mainScreen);
                  },
                ).paddingSymmetric(horizontal: wi(30), vertical: he(10)),
                CustomButton(
                  text: S.of(context).strBack,
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
                  fontWeight: FontWeight.w700,
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
                      fontWeight: FontWeight.w700,
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
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
