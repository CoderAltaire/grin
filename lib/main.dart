import 'package:flutter/material.dart';
import 'package:grin/Cubit/Login/login_cubit.dart';
import 'package:grin/cubit/main_tab/main_tab_cubit.dart';
import 'package:grin/cubit/profile/profile_bloc.dart';
import 'package:grin/core/routes/app_pages.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/core/utils/size_config.dart';
import 'package:grin/core/values/app_theme.dart';
import 'package:grin/generated/l10n.dart';
import 'core/utils/helper/helper_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => MainTabCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bir Qadam',
          theme: appThemeData,
          onGenerateRoute: RouteGenerate().generate,
          navigatorKey: navigatorKey,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
          ],
          supportedLocales: const [
            Locale('uz'),
            Locale('en'),
            Locale('ru'),
          ],
          locale: Locale(state.language),
          builder: (context, child) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: child!,
            );
          },
          initialRoute: AppRoutes.login,
        );
      }),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}
