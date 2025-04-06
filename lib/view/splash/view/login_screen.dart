import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/utils/validator.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/widgets/text_field_country_widget.dart';
import 'package:grin/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.red,
            height: he(300),
            // child: SvgPicture.asset(AppIcons.logo),
            child: Image.asset( AppImages.logo),
          ),
          Text(
            "Welcome back",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: he(30)),
          ),
          Text(
            "Great to have you back, let's get back to our studies.",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: he(16)),
          ),
          Text(
            S.current.strYourPhone,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontSize: he(14)),
          ),
          SizedBox(height: he(10)),
          TextFieldCountry(
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
        ],
      ),
    );
  }
}
