import 'package:grin/core/api/main_app/api_service.dart';
import 'package:grin/core/routes/imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isLoading = true;

class _HomeScreenState extends State<HomeScreen> {
  static List<Map<String, String>> list = [
    {
      'imagePath': 'assets/images/lessons1.png',
      'description': 'THE ENGLISH MASTER COURSE:\nENGLISH GRAMMAR',
      'lessonsNumber': '18 Lessons',
      'time': '1h 30m',
      'status': 'Beginner',
      'teacher': 'Mr Samira',
      'teacherLogo':
          'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&dpr=1',
    },
    {
      'imagePath': 'assets/images/lessons2.jpg',
      'description': 'ADVANCED MATH FOR BEGINNERS:\nALGEBRA BASICS',
      'lessonsNumber': '20 Lessons',
      'time': '2h 15m',
      'status': 'Intermediate',
      'teacher': 'Dr John',
      'teacherLogo':
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&auto=format&fit=crop&w=50&h=50&q=80',
    },
    {
      'imagePath': 'assets/images/lessons3.png',
      'description': 'INTRODUCTION TO PROGRAMMING:\nPYTHON ESSENTIALS',
      'lessonsNumber': '15 Lessons',
      'time': '1h 45m',
      'status': 'Beginner',
      'teacher': 'Ms Aisha',
      'teacherLogo':
          'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&dpr=1',
    },
  ];

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
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final course = list[index];
                    return CourseContainer(
                      imagePath: course['imagePath'] ?? "no data",
                      description: course['description'] ?? "no data",
                      lessonsNumber: course['lessonsNumber'] ?? "no data",
                      time: course['time'] ?? "no data",
                      status: course['status'] ?? "no data",
                      teacher: course['teacher'] ?? "no data",
                      teacherLogo: course['teacherLogo'] ?? "no data",
                    );
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
