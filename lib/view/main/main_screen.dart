import 'package:grin/Cubit/get_all_courses/get_all_courses_cubit.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/routes/imports.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    var state = context.read<MainTabCubit>().state;
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: state.main,
    );
    tabController.addListener(() {
      var bloc = context.read<MainTabCubit>();
      bloc.isMainTab(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainTabCubit, MainTabState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                HiveBoxes.userDatas.isNotEmpty
                    ? HiveBoxes.userDatas.values.first.fullname
                    : "no data",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              SizedBox(width: wi(10)),
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => tabController.animateTo(3),
                child: ValueListenableBuilder(
                  valueListenable: HiveBoxes.profilePhoto.listenable(),
                  builder: (context, Box box, child) {
                    final path = box.get("profilePhoto");

                    return CircleAvatar(
                      backgroundImage: path != null
                          ? FileImage(File(path))
                          : AssetImage(AppImages.no_photo) as ImageProvider,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        drawer: MyDrawerScreen(),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: BlocConsumer<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Stack(
              children: [
                TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    HomeScreen(),
                    MyCoursesScreen(),
                    MyCertificateScreen(),
                    MySettingsScreen(),
                  ],
                ),
              ],
            );
          },
          listener: (BuildContext context, Object? state) {},
        ),
        bottomNavigationBar: SafeArea(
          bottom: false,
          child: Container(
            alignment: Alignment.bottomCenter,
            height: he(85),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                top: BorderSide(width: wi(1.5), color: AppColors.secondary),
              ),
            ),
            child: TabBar(
              dividerColor: Colors.transparent,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              enableFeedback: true,
              indicator: const BoxDecoration(),
              labelPadding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.tab,
              controller: tabController,
              tabs: [
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.ic_home,
                  onTap: () => tabController.animateTo(0),
                  index: 0,
                  label: S.of(context).strHome,
                ),
                BottomTabItem(
                    currentIndex: state.main,
                    icon: AppIcons.ic_course,
                    onTap: () => tabController.animateTo(1),
                    index: 1,
                    label: S.of(context).strCourses),
                BottomTabItem(
                  currentIndex: state.main,
                  icon: AppIcons.ic_certificate,
                  onTap: () => tabController.animateTo(2),
                  index: 2,
                  label: S.of(context).strCertificate,
                ),
                BottomTabItem(
                  index: 3,
                  currentIndex: state.main,
                  icon: AppIcons.ic_settinges,
                  onTap: () => tabController.animateTo(3),
                  label: S.of(context).strSettinges,
                ),
              ],
            ).paddingOnly(
              bottom: Platform.isAndroid ? he(8) : he(16),
              top: he(6),
            ),
          ),
        ),
      );
    });
  }
}

// Future<void> _showRegistrationBottomSheet(BuildContext context) async {
//   return showModalBottomSheet<void>(
//     context: context,
//     useSafeArea: true,
//     isDismissible: true,
//     enableDrag: true,
//     isScrollControlled: true,
//     backgroundColor: AppColors.transparent,
//     builder: (BuildContext context) => const RegistrationRequest(),
//   );
// }

//BirQadamClient-01-01-2025.apk
