import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminAddNewTeacherInDepartment extends StatefulWidget {
  const AdminAddNewTeacherInDepartment({Key? key}) : super(key: key);
  
  @override
  State<AdminAddNewTeacherInDepartment> createState() => _AdminAddNewTeacherInDepartmentState();
}

class _AdminAddNewTeacherInDepartmentState extends State<AdminAddNewTeacherInDepartment> {
  TextEditingController nameController = TextEditingController();
  TextEditingController designationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  var signupSuccessSnackBar = const SnackBar(
  content: Text('Teacher Details added successfully'),
  );
  final double a = 12;

    String dropdownAdmin = 'Home';  
 
  // List of items in our dropdown menu
  var itemsAdmin = [   
    'Home',
    'settings',
    'all departments',
    
  ];

      String dropdownDepartment = 'Electrical Engineering';  
 
  // List of items in our dropdown menu
  var itemsDepartment = [   
    'Physics',
    'Computer Science',
    'Electrical Engineering',
 
    
  ];

        String dropdownProgram = 'BS CS';  
 
  // List of items in our dropdown menu
  var itemsProgram = [   
    'BS CS',
    'MPhil CS',
    'MS IST',
    'PhD CS',
 
    
  ];


          String dropdownCourse = 'CS101';  
 
  // List of items in our dropdown menu
  var itemsCourse = [   
    'CS101',
    'CS102',
    'CS103',
    'CS104',
    'CS105',
 
    
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: const Icon(Icons.arrow_back_ios),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children:  [
                 DropdownButton(
               
              // Initial Value
              value: dropdownAdmin,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsAdmin.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownAdmin = newValue!;
                });
              },
            ),
                const SizedBox(
                  width: 118,
                ),
                const Text('Logged in \nas Admin'),
              ],
            ),
          ),
          const SizedBox(height:30.0),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Add New Teacher in Department',
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
                  obscureText: true,
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
                  obscureText: true,
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
 
         

        

 
                
                const SizedBox(height: 20.0,),
             
              
               
 

                        Container(
                           
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(115, 0, 130, 0),
                  child: ElevatedButton(
                    onPressed: signUp,
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Add Teacher',
                      style: TextStyle(fontSize: 15.0, height: 1.0),
                    ),
                  )),
 
                  
 

 
        ],
      ),
    );


  }


  Future signUp() async{
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

    setState(() {
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmpasswordController.clear();
      designationController.clear();
    });


  } on FirebaseAuthException catch(e){
    print(e);
  }

   
}

}