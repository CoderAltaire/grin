import 'package:animate_do/animate_do.dart';
import 'package:grin/Cubit/profile/profile_bloc.dart';
import 'package:grin/core/constants/constants.dart';
import 'package:grin/core/extension/for_context.dart';
import 'package:grin/core/extension/widget_extantion.dart';
import 'package:grin/core/service/app_version/app_update_service.dart';
import 'package:grin/core/utils/general_functions.dart';
import 'package:grin/core/utils/helper/helper_widget.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_assets.dart';
import 'package:grin/core/values/app_colors.dart';
import 'package:grin/core/widgets/custom_buttom_sheet_bar.dart';
import 'package:grin/core/widgets/custom_button.dart';
import 'package:grin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scale_button/scale_button.dart';

class LanguageButtomSheet extends StatefulWidget {
  const LanguageButtomSheet({super.key});

  @override
  State<LanguageButtomSheet> createState() => _LanguageButtomSheetState();
}

class _LanguageButtomSheetState extends State<LanguageButtomSheet> {
  @override
  void initState() {
    super.initState();
    var bloc = context.read<ProfileCubit>();
    var state = context.read<ProfileCubit>().state;
    bloc.enterLang(state.language);
  }

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
    // var unAuth = context.read<AuthCubit>().state.unAuth;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var bloc = context.read<ProfileCubit>();

        return Container(
          width: context.w,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: he(14)),
              const CustomButtomSheetBar(),
              Text(S.current.strSelectLanguage,
                      style: Theme.of(context).textTheme.titleLarge)
                  .paddingOnly(top: he(20)),
              ListView.separated(
                  itemCount: lanList.length,
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: he(20)),
                  itemBuilder: (context, index) {
                    debugPrint("LLLL => ${state.temporaryLanguage}");
                    return LanguageButtomSheetItemWidget(
                      title: lanList[index].title,
                      onTap: () async {
                        await bloc.enterLang(lanList[index].code);
                      },
                      isSelected:
                          state.temporaryLanguage == lanList[index].code,
                      icon: lanList[index].icon,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(height: he(0))),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          isLoading: state.status == Status.LOADING,
                          text: S.current.strConfirmation,
                          onTap: () {
                            Navigator.pop(context);
                          })),
                  SizedBox(width: wi(12)),
                  Expanded(
                    child: CustomButton(
                      text: S.current.strLogOut,
                      onTap: () => Navigator.pop(context),
                      bgColor: AppColors.secondary2,
                      textColor: AppColors.grey3,
                    ),
                  ),
                ],
              ),
              SizedBox(height: he(customButtonPadding))
            ],
          ).paddingSymmetric(horizontal: wi(16)),
        );
      },
    );
  }

  // Future<void> _sendRequest(
  //   BuildContext context,
  //   ProfileCubit bloc,
  //   ProfileState state,
  //   bool unAuth,
  // ) async {
  //   if (unAuth) {
  //     bloc.saveAppLang();
  //     context.read<MainCubit>().getCategoryM();
  //     context.read<MainCubit>().getCategoryC();
  //     context.read<MainCubit>().getProductGroup();
  //     context.read<MainCubit>().getBanners();
  //   } else {
  //     var res = state.response;
  //     await bloc.editUser(EditUserModel(
  //       language: state.temporaryLanguage,
  //       firstName: res?.firstName,
  //       lastName: res?.lastName,
  //       birthDate: MyFunctions.localDateFormat(res?.birthDate ?? DateTime.now(),
  //           format: "yyyy-MM-dd"),
  //       gender: res?.gender,
  //       mobileVersion: AppUpdateService.appVersion,
  //     ));
  //     bloc.saveAppLang();
  //   }
  // }
}

class LanguageButtomSheetItemWidget extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String icon;
  final Function() onTap;
  const LanguageButtomSheetItemWidget(
      {super.key,
      required this.isSelected,
      required this.onTap,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: ScaleButton(
        bound: 0.05,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: wi(12), vertical: he(12)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isSelected ? AppColors.secondary2 : AppColors.transparent,
              border: Border.all(
                  color: isSelected
                      ? AppColors.secondary
                      : AppColors.transparent)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(icon, height: he(24)),
                  SizedBox(width: wi(12)),
                  Text(title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.black)),
                ],
              ),
              Icon(
                Icons.check,
                color:
                    isSelected ? AppColors.primaryColor : AppColors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
