import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_course_allocation/admin_home.dart';

import 'login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body:StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              return const AdminHome(title: 'Admin Home',);
            }
            else{
              return const LoginScreen(title:'Login');
            }
    
          })
          )
      );
  
  }
}