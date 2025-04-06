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
    required this.onChangePhone,
    required this.focusNode,
    this.controller,
    this.readOnly = false,
    this.fillColor,
    this.hintText,
  });

  final Function(dynamic v) onChangePhone;

  final FormFieldValidator<String>? validator;
  final FocusNode focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final String? hintText;

  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return CustomPrefixTextField(
      inputFormatters: [
        MaskTextInputFormatter(
          mask: '(##) ###-##-##',
          filter: {"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.lazy,
        )
      ],
      textEditingController: controller,
      focusNode: focusNode,
      hintText: hintText ?? S.current.strEnterYourPhone,
      textInputAction: TextInputAction.done,
      validator: validator,
      readOnly: readOnly,
      fillColor: fillColor,
      prefixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: wi(12)),
          ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: Image.asset(AppImages.imgUzbFlagBig, height: he(16))),
          SizedBox(width: wi(8)),
          Text(
            "+998",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: AppColors.black),
          ),
          Container(height: he(21), width: wi(1), color: AppColors.secondary)
              .paddingSymmetric(horizontal: wi(8)),
        ],
      ),
      onChange: onChangePhone,
      textInputType: TextInputType.phone,
    );
  }
}
