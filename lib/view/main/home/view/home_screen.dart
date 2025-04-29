import 'package:grin/Cubit/get_all_courses/get_all_courses_cubit.dart';
import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/routes/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isLoading = true;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetAllCoursesCubit>().getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(16), vertical: he(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).strCourseProgram,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 21,
                      ),
                ),
                SizedBox(height: he(20)),
                BlocConsumer<GetAllCoursesCubit, GetAllCoursesState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is GetAllCoursesState) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: state.allCourses?.data?.length ?? 0,
                        itemBuilder: (context, index) {
                          final courses = state.allCourses?.data?[index];
                          return CourseContainer(
                            price: courses?.price ?? "0",
                            status: courses?.status ?? "",
                            description: courses?.title ?? "",
                            lessonsNumber:
                                courses?.videoLessonCount.toString() ?? "",
                            time: courses?.duration ?? "",
                            teacher: "Mr Samira",
                            imagePath: 'assets/images/lessons1.png',
                            teacherLogo:
                                "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&dpr=1",
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
