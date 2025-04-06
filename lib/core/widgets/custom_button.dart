import 'package:grin/core/extension/widget_extantion.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grin/core/widgets/custom_loading_widget.dart';
import 'package:scale_button/scale_button.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.radius,
    this.bgColor,
    this.textColor,
    this.isLoading = false,
    this.paddingV,
    this.fontSize,
    this.border,
    this.colorL,
    this.icon,
    this.rightW,
    this.mainAxisAlignment,
    this.textDecarition,
    this.fontWeight,
    this.height,
    this.iconColor,
  });

  final String text;
  final Function()? onTap;
  final double? radius;
  final double? paddingV;
  final double? fontSize;
  final BoxBorder? border;
  final Color? colorL;
  final String? icon;
  final Color? bgColor;
  final Color? textColor;
  final Color? iconColor;
  final bool isLoading;
  final double? height;
  final TextDecoration? textDecarition;

  final Widget? rightW;
  final MainAxisAlignment? mainAxisAlignment;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      bound: 0.030,
      onTap: () {
        if (!isLoading && onTap != null) {
          onTap!();
        }
      },
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 12),
        child: InkWell(
          splashColor: AppColors.white.withOpacity(.2),
          highlightColor: AppColors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 12),
          onTap: () {
            if (!isLoading && onTap != null) {
              onTap!();
            }
          },
          child: Ink(
            height: he(height ?? 50),
            padding: EdgeInsets.symmetric(
                vertical: isLoading ? he(8) : he(paddingV ?? 12),
                horizontal: wi(8)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 12),
                color: bgColor ?? AppColors.primaryColor,
                border: border),
            child: Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isLoading
                    ? SizedBox(
                        height: he(25),
                        width: he(25),
                        child: Center(child: LoadingWidget(color: colorL)))
                    : Center(
                        child: Row(
                          children: [
                            icon != null
                                ? 
                                SvgPicture.asset(
                                    icon ?? "",
                                    colorFilter: iconColor == null
                                        ? null
                                        : ColorFilter.mode(
                                            iconColor!, BlendMode.srcIn),
                                  ).paddingOnly(right: wi(8), left: wi(8))
                                : const SizedBox.shrink(),
                            Text(
                              text,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: textColor ?? AppColors.white,
                                    fontWeight: fontWeight,
                                    fontSize: fontSize ?? he(15),
                                    decoration: textDecarition,
                                  ),
                            ),
                            rightW ?? const SizedBox.shrink()
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onTap,
    this.primaryColor,
    this.textColor,
    this.radius,
    this.isLoading = false,
    this.mainAxisAlignment,
  });

  final String text;
  final Function() onTap;
  final Color? textColor;
  final Color? primaryColor;
  final double? radius;
  final bool isLoading;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      bound: 0.030,
      onTap: () {
        if (!isLoading) {
          onTap();
        }
      },
      child: Material(
        borderRadius: BorderRadius.circular(radius ?? 12),
        child: InkWell(
          splashColor: AppColors.primaryColor.withOpacity(.1),
          highlightColor: AppColors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 12),
          onTap: () {
            if (!isLoading) {
              onTap();
            }
          },
          child: Ink(
            height: he(50),
            padding: EdgeInsets.symmetric(vertical: isLoading ? he(8) : he(14)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius ?? 12),
                border: Border.all(
                    color: primaryColor ?? AppColors.primaryColor,
                    width: wi(1.5)),
                color: AppColors.white),
            child: Row(
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: textColor ?? AppColors.primaryColor,
                        fontSize: he(16)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    this.radius,
    this.bgColor,
    this.paddingV,
    this.icon,
    this.rightW,
    this.height,
    this.borderColor,
    this.iconcolor,
    this.heightIcon,
  });

  final Function() onTap;
  final double? radius;
  final double? paddingV;
  final double? height;
  final String? icon;
  final Color? bgColor;
  final Color? borderColor;
  final Color? iconcolor;
  final Widget? rightW;
  final double? heightIcon;

  @override
  Widget build(BuildContext context) {
    return ScaleButton(
      onTap: onTap,
      bound: 0.030,
      child: Material(
        color: AppColors.transparent,
        borderRadius: BorderRadius.circular(radius ?? 12),
        child: InkWell(
          splashColor: AppColors.primaryColor.withOpacity(.1),
          highlightColor: AppColors.transparent,
          borderRadius: BorderRadius.circular(radius ?? 12),
          onTap: onTap,
          child: Ink(
            height: he(height ?? 45),
            width: wi(height ?? 45),
            padding: EdgeInsets.symmetric(
                vertical: he(paddingV ?? 12), horizontal: wi(8)),
            decoration: BoxDecoration(
                border:
                    Border.all(color: borderColor ?? AppColors.primaryColor),
                borderRadius: BorderRadius.circular(radius ?? 12),
                color: bgColor ?? AppColors.primaryColor),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                      child: SvgPicture.asset(
                    icon ?? "",
                    color: iconcolor,
                    height: heightIcon,
                  ))
                ]),
          ),
        ),
      ),
    );
  }
}
