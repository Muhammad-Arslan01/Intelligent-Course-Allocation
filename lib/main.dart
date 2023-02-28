 
import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart';
import 'package:intelligent_course_allocation/admin_all_courses_in_program.dart';
import 'package:intelligent_course_allocation/admin_allocation_home.dart';
import 'package:intelligent_course_allocation/allocation.dart';
import 'package:intelligent_course_allocation/firebase_options.dart';
import 'package:intelligent_course_allocation/login.dart';
import 'package:intelligent_course_allocation/main_page.dart';
import 'admin_home.dart';
import 'admin_preferences_settings.dart';
import 'signup2.dart';
import 'teacher_home.dart'; 
import 'login2.dart';
import 'signup.dart';
import 'start.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const StartScreen(title:'Start Screen'),
        '/login': (context) => const LoginScreen(title: 'Login Screen'),
        '/signup': (context) => const SignupScreen(title: 'Signup Screen'),
        '/login2': (context) => const LoginScreen2(title: 'Login Screen'),
        '/signup2': (context) => const SignupScreen2(title: 'Signup Screen'),
        '/admin_home': (context) => const AdminHome(title: 'Admin Home'),
        '/settings':(context)=>const AdminPreferencesSettings(title:'Admin Preferences Screen'),         
        '/all_courses':((context) => const AdminAllCoursesInProgram()),
        '/teacher_home':(context) => const TeacherHome(title:'Admin Departments Screen'),
        '/main_page':(context) => const MainPage(),
        '/allocation':(context) => const Allocation(),
        '/allocation_home':(context) => const AdminAllocationHome(title: 'Allocation Home',),

      },
      debugShowCheckedModeBanner: false,
      title: 'Intelligent Course Allocation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const StartScreen(title: 'Start Screen'),
    );
  }
}



