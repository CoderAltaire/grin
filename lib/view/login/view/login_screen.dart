import '../../../core/routes/imports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final focusNode = FocusNode();

  final focusNode2 = FocusNode();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode.unfocus(),
      child: Scaffold(
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
                    fontWeight: FontWeight.w600,
                    color: AppColors.black1)),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Text(
                textAlign: TextAlign.center,
                "Great to have you back, let's get back \n to our studies.",
                style: TextStyle(fontSize: 16, color: AppColors.black1)),
            SizedBox(height: 20),
            TextFieldCountry(
              // labelText: AppStrings.strNewPhoneNumber,
              hintText: '',
              controller: phoneController,
              focusNode: focusNode,
              validator: ((v) => Validator.phoneChecker(
                  value: v ?? "", message: S.current.strYourPhone)),
              onChangePhone: (v) {
                if (v.toString().length == 14) {
                  focusNode.unfocus();
                }
              },
            ),
            SizedBox(height: he(15)),
            TextFieldCountryPassword(
              // labelText: AppStrings.strPassword,
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
              // visibility: _obscureText,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.05),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.status == Status.SUCCESS) {
                  Navigator.pushNamed(context, AppRoutes.selectLanguage);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () {
                      String phone = MyFunctions.getPhone(phoneController.text);
                      context
                          .read<LoginCubit>()
                          .phoneSend(phone, passwordController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(SizeConfig.screenWidth! * 0.8,
                            SizeConfig.screenHeight! * 0.05),
                        backgroundColor: AppColors.whiteBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    child: state.status == Status.LOADING
                        ? CircularProgressIndicator(
                            strokeWidth: 1,
                            color: AppColors.white,
                          ).paddingSymmetric(vertical: 10)
                        : Text(
                            AppStrings.strLogIn,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white),
                          ));
              },
            )
          ],
        ).paddingSymmetric(horizontal: wi(40)),
      ),
    );
  }
}
