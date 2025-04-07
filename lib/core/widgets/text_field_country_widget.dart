import 'package:grin/core/extension/widget_extantion.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:grin/core/widgets/custom_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TextFieldCountry extends StatelessWidget {
  const TextFieldCountry({
    super.key,
    this.validator,
    required this.labelText,
    required this.onChangePhone,
    required this.focusNode,
    this.controller,
    this.readOnly = false,
    this.fillColor,
    this.hintText,
    this.suffixIcon,
  });

  final Function(dynamic v) onChangePhone;

  final FormFieldValidator<String>? validator;
  final FocusNode focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final String? hintText;
  final String labelText;
  final Color? fillColor;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: he(20)),
      child: CustomPrefixTextField(
        labelText: labelText,

        // inputFormatters: [
        //   MaskTextInputFormatter(
        //     mask: '(##) ###-##-##',
        //     filter: {"#": RegExp(r'[0-9]')},
        //     type: MaskAutoCompletionType.lazy,
        //   )
        // ],
        textEditingController: controller,
        focusNode: focusNode,
        hintText: hintText ?? S.current.strEnterYourPhone,
        textInputAction: TextInputAction.done,
        validator: validator,
        readOnly: readOnly,
        fillColor: fillColor,

        suffixIcon: suffixIcon,
        onChange: onChangePhone,
        textInputType: TextInputType.text,
      ),
    );
  }
}
