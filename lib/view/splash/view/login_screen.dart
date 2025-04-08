import '../../../core/routes/imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // final formKey = GlobalKey<FormState>();
  final focusNode1 = FocusNode();
  final focusNode2 = FocusNode();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.logo,
            height: he(60),
            colorBlendMode: BlendMode.srcIn,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.015),
          Text("Welcome back",
              style: TextStyle(
                  fontSize: he(38),
                  fontWeight: FontWeight.w700,
                  color: AppColors.black1)),
          SizedBox(height: SizeConfig.screenHeight! * 0.02),
          Text(
              textAlign: TextAlign.center,
              "Great to have you back, let's get back \n to our studies.",
              style: TextStyle(fontSize: 16, color: AppColors.black1)),
          // Text(
          //   S.current.strYourPhone,
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodySmall
          //       ?.copyWith(fontSize: he(14)),
          // ),
          SizedBox(height: SizeConfig.screenHeight! * 0.05),

          TextFieldCountry(
            labelText: AppStrings.strEmail,
            hintText: 'johanns@gmail.com',
            controller: emailController,
            focusNode: focusNode1,
            onChangePhone: (v) {
              // if (v.toString().length == 14) {
              //   focusNode.unfocus();
              // }
            },
          ),
          TextFieldCountry(
            labelText: AppStrings.strPassword,
            controller: passwordController,
            focusNode: focusNode2,
            hintText: '********',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            onChangePhone: (v) {},
            visibility: _obscureText,
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.05),

          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.selectLanguage);
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(SizeConfig.screenWidth! * 0.8,
                      SizeConfig.screenHeight! * 0.05),
                  backgroundColor: AppColors.whiteBlue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                AppStrings.strLogIn,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white),
              ))
        ],
      ).paddingSymmetric(horizontal: wi(40)),
    );
  }
}
