import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/cubit/profile/profile_bloc.dart';
import 'package:grin/generated/l10n.dart';
import 'package:grin/view/login/widgets/select_lg_container.dart';
import '../../../core/routes/imports.dart';

class SelectLgScreen extends StatefulWidget {
  const SelectLgScreen({super.key});

  @override
  State<SelectLgScreen> createState() => _SelectLgScreenState();
}

class _SelectLgScreenState extends State<SelectLgScreen> {
  int selectedIndex = -1;

  final List<Map<String, String>> languages = [
    {
      'image': AppImages.imgArbFlag,
      'language': 'Uzbek',
    },
    {
      'image': AppImages.imgEngFlag,
      'language': 'Russian',
    },
    {
      'image': AppImages.imgKorFlag,
      'language': 'English',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<LangModel> lanList = [
      LangModel(
          title: S.of(context).strUzbek, code: 'uz', icon: AppImages.icUzFlag),
      LangModel(
          title: S.of(context).strRussian,
          code: 'ru',
          icon: AppImages.icRusFlag),
      LangModel(
          title: S.of(context).strEnglish,
          code: 'en',
          icon: AppImages.icEngFlag),
    ];
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
                    await bloc.enterLang(lanList[selectedIndex].code);
                    Navigator.pushNamed(context, AppRoutes.mainScreen);
                  },
                ).paddingSymmetric(horizontal: wi(30), vertical: he(10)),
                CustomButton(
                  height: 45,
                  border: Border.all(color: AppColors.whiteBlue),
                  bgColor: AppColors.white,
                  text: 'Back',
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
