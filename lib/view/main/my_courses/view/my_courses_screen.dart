import 'package:grin/core/routes/imports.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> {
  static List<Map<String, String>> simpleList = [
    {
      'image': 'assets/images/lessons1.png',
      'title': 'THE ENGLISH MASTER COURSE:',
      'description':
          'A Complete English Language Course: English Grammar, Speaking, Pronunciation, and Writing.',
    },
    {
      'image': 'assets/images/lessons2.jpg',
      'title': 'ADVANCED MATH FOR BEGINNERS:',
      'description':
          'Learn Algebra Basics with Step-by-Step Lessons and Practical Examples.',
    },
    {
      'image': 'assets/images/lessons3.png',
      'title': 'INTRODUCTION TO PROGRAMMING:',
      'description':
          'Master Python Essentials with Hands-On Coding Projects for Beginners.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: wi(16), vertical: he(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).strStartedCourses,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.black,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: he(20)),
                ListView.builder(
                  shrinkWrap: true, // Column ichida ListView uchun zarur
                  physics:
                      const NeverScrollableScrollPhysics(), // ListView o'z scroll mexanizmini o'chirish
                  itemCount: simpleList.length,
                  itemBuilder: (context, index) {
                    final mycourse = simpleList[index];
                    return MyCoursesContainer(
                      image: mycourse["image"] ?? "no data",
                      title: mycourse["title"] ?? "no data",
                      description: mycourse["description"] ?? "no data",
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
