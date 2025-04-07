import 'package:flutter/material.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/core/values/app_strings.dart';
import 'package:grin/core/widgets/custom_button.dart';
import 'package:grin/core/widgets/text_field_country_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: wi(40)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logo,
              height: 50,
            ),
            // SizedBox(height: he(20)),
            Text("Welcome back",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
            // SizedBox(height: he(20)),
            Text(
              textAlign: TextAlign.center,
              "Great to have you back, let's get back \n to our studies.",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: he(17), color: AppColors.black2),
            ),
            // Text(
            //   S.current.strYourPhone,
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodySmall
            //       ?.copyWith(fontSize: he(14)),
            // ),
            SizedBox(height: he(50)),

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
              suffixIcon: AppIcons.icEye_off,
              onChangePhone: (v) {},
            ),
            SizedBox(height: 50),
            CustomButton(
              fontSize: 20,
              bgColor: AppColors.whiteBlue,
              radius: 12,
              text: AppStrings.strLogIn,
              textColor: AppColors.white,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.selectLanguage);
              },
            )
          ],
        ),
      ),
    );
  }
}
