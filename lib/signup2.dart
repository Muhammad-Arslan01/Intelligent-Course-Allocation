import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignupScreen2 extends StatefulWidget {
  const SignupScreen2({Key? key,required this.title}) : super(key: key);
  final String title;
  

  @override
  State<SignupScreen2> createState() => _SignupScreen2State();
}

class _SignupScreen2State extends State<SignupScreen2> {

  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  var signupSuccessSnackBar = const SnackBar(
  content: Text('Signed up successfully,Go login now'),
  );

  

    @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Create Account ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
                  const SizedBox(
                    height: 20.0,
                  ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  )),

              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: nameController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Name',
                    isDense: true,
                    
                  ),
                ),
              ),

              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: designationController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Designation',
                    isDense: true,
                    
                  ),
                ),
              ),  
              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: emailController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Email',
                    isDense: true,
                    
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 60.0,
                child: TextField(
                  autofocus: false, 
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Password',
                     isDense: true,
                  ),
                ),
              ),
                Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 60.0,
                child: TextField(
                  autofocus: false, 
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Confirm Password',
                     isDense: true,
                  ),
                ),
              ),
              const SizedBox(height: 30.0,),
 

              
              Container(
                  height: 60.0,
                  padding: const EdgeInsets.fromLTRB(129, 0, 129, 0),
                  child: ElevatedButton(
                    onPressed: SignUp,
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Sign Up',
                     // style: TextStyle(fontSize: 15.0, height: 0.5),
                    ),
                  )),
                  const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Already have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                      Navigator.of(context).popAndPushNamed('/login2');
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

Future SignUp() async{
  String name=nameController.text.trim();
   
  String designation=designationController.text.trim();

  final data={
      "undergraduate_course_preference_scores": {},
      "undergraduate_courses_preferred": {},
      "postgraduate_course_preference_scores": {},
      "postgraduate_courses_preferred": {},
  };
  try{
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:emailController.text.trim() ,
       password: passwordController.text.trim()
       
      ).then((value) {
        FirebaseFirestore
        .instance
        .collection('teacher')
        .doc(value.user?.uid)
        .set({
          "name":name,
          "email":value.user?.email ,
          "designation":designation,
          "undergraduate_course_preference_scores": {"default":""},
          "undergraduate_courses_preferred": {"default":""},
          "postgraduate_course_preference_scores": {"default":""},
          "postgraduate_courses_preferred": {"default":""},
          });
      });
    
    //emailController.dispose();
    //passwordController.dispose();
    //confirmpasswordController.dispose();
    //super.dispose();
    ScaffoldMessenger.of(context).showSnackBar(signupSuccessSnackBar);


  } on FirebaseAuthException catch(e){
    print(e);
  }

   
}

}