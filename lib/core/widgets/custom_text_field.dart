// ignore_for_file: must_be_immutable

import 'package:grin/core/extension/widget_extantion.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grin/core/widgets/custom_loading_widget.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onChange,
    required this.hintText,
    this.maxLines,
    this.minLines,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.obscure,
    this.textInputAction,
    this.fillColor,
    this.initialValue,
    this.preIconColor,
    this.textEditingController,
    this.readOnly = false,
    this.onTap,
    this.formatter,
    required this.textInputType,
    this.maxLength,
    this.focusNode,
  });

  final TextEditingController? textEditingController;
  Function(String value)? onChange;
  final String hintText;
  final String? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscure;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final Color? preIconColor;
  final String? initialValue;
  FormFieldValidator<String>? validator;
  final int? maxLines;
  final TextInputType textInputType;
  final int? minLines;
  final int? maxLength;
  final FocusNode? focusNode;
  final Function()? onTap;
  final List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      validator: validator,
      readOnly: readOnly,
      focusNode: focusNode,
      inputFormatters: formatter,
      onTap: onTap,
      initialValue: initialValue,
      style: Theme.of(context)
          .textTheme
          .displayMedium
          ?.copyWith(color: AppColors.black, fontWeight: FontWeight.w400),
      obscureText: obscure ?? false,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      onChanged: onChange,
      controller: textEditingController,
      cursorColor: AppColors.primaryColor,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(horizontal: wi(16), vertical: he(12)),
        counterText: '',
        suffixIconConstraints:
            BoxConstraints(minHeight: he(25), minWidth: wi(25)),
        prefixIcon: prefixIcon == null
            ? null
            : SvgPicture.asset(
                prefixIcon ?? "",
                colorFilter: ColorFilter.mode(
                    preIconColor ?? AppColors.grey3, BlendMode.srcIn),
              ).paddingAll(13),
        suffixIcon: suffixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(color: AppColors.grey3, fontWeight: FontWeight.w400),
        hintText: hintText,
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.grey1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.red),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.grey1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: AppColors.grey1,
            width: 1.2,
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.grey1),
        ),
      ),
    );
  }
}

class CustomPrefixTextField extends StatelessWidget {
  CustomPrefixTextField(
      {super.key,
      this.textEditingController,
      required this.labelText,
      required this.onChange,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.obscure,
      this.textInputAction,
      required this.textInputType,
      this.validator,
      this.readOnly = false,
      this.fillColor,
      required this.focusNode,
      this.prefixText,
      this.inputFormatters});

  final TextEditingController? textEditingController;
  final Function(String value) onChange;
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final bool readOnly;
  final Color? fillColor;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextInputAction? textInputAction;
  final TextInputType textInputType;
  final FocusNode focusNode;
  final String? prefixText;
  final List<TextInputFormatter>? inputFormatters;

  FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      validator: validator,
      focusNode: focusNode,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: AppColors.black),
      obscureText: obscure ?? false,
      textInputAction: textInputAction,
      onChanged: onChange,
      controller: textEditingController,
      keyboardType: textInputType,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.grey3,
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        prefixStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: AppColors.black),
        hintStyle: Theme.of(context)
            .textTheme
            .headlineSmall
            ?.copyWith(color: AppColors.grey3),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: AppColors.grey1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.whiteBlue, width: 1.2),
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.grey1),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField(
      {super.key,
      this.onTap,
      this.focus,
      this.onChange,
      this.controller,
      this.autoFocus,
      this.readOnly,
      required this.hintText,
      this.suffixIcon,
      this.suffixOnTap,
      this.onSubmitted,
      this.isLoading = false});
  final VoidCallback? onTap;
  final FocusNode? focus;
  final Function(String word)? onChange;
  final TextEditingController? controller;
  final bool? autoFocus;
  final bool? readOnly;
  final String hintText;
  final IconData? suffixIcon;
  final Function()? suffixOnTap;
  final Function(dynamic v)? onSubmitted;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputBorder() => const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: AppColors.grey1),
        );
    return TextFormField(
      focusNode: focus,
      onTap: onTap,
      textInputAction: TextInputAction.done,
      controller: controller,
      readOnly: readOnly ?? false,
      autofocus: autoFocus ?? false,
      onChanged: onChange,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: AppColors.black),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        contentPadding: EdgeInsets.symmetric(vertical: 40.0),
        hintText: hintText,
        prefixIconConstraints: BoxConstraints(
          maxHeight: he(100),
          minHeight: he(10),
        ),
        prefixIcon: isLoading
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                    height: he(16),
                    width: he(16),
                    child: const LoadingWidget(color: AppColors.grey3)))
            : SvgPicture.asset(AppIcons.icSearch).paddingAll(12),
        filled: true,
        fillColor: AppColors.secondary2,
        border: inputBorder(),
        focusedBorder: inputBorder(),
        enabledBorder: inputBorder(),
      ),
    );
  }
}
