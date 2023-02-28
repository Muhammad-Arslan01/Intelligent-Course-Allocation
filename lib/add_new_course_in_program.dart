import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminAddNewCourseInProgram extends StatefulWidget {
  const AdminAddNewCourseInProgram({Key? key}) : super(key: key);
 
  @override
  State<AdminAddNewCourseInProgram> createState() => _AdminAddNewCourseInProgramState();
}

class _AdminAddNewCourseInProgramState extends State<AdminAddNewCourseInProgram> {
  TextEditingController cCodeController = TextEditingController();
  TextEditingController cDescriptionController = TextEditingController();
  var addCourseSuccessSnackBar = const SnackBar(
  content: Text('course added Successfully'),
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
                    'Add New Course ',
                    style: TextStyle(fontSize: 20),
                  )),

        

                  
                
                const SizedBox(height: 20.0,),
             
              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: cCodeController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Course Code',
                    isDense: true,
                    
                  ),
                ),
              ),
 
              const SizedBox(height:20.0),
              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: cDescriptionController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Course Name',
                    isDense: true,
                    
                  ),
                ),
              ),
              const SizedBox(height: 80.0,),

                        Container(
                           
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(115, 0, 130, 0),
                  child: ElevatedButton(
                    onPressed:  addCourse,
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Add Course',
                      style: TextStyle(fontSize: 15.0, height: 1.0),
                    ),
                  )),
 
                  
 

 
        ],
      ),
    );


  }


  Future addCourse() async{
  String cCode=cCodeController.text.trim();
   
  String cName=cDescriptionController.text.trim();

 
  try{
 
        FirebaseFirestore
        .instance
        .collection('courses')
        .doc()
        .set({
          "course_code":cCode,
          "course_name":cName,     
 
          });
      
    
   
    ScaffoldMessenger.of(context).showSnackBar(addCourseSuccessSnackBar);

    setState(() {
      cCodeController.clear();
      cDescriptionController.clear();
    });


  } on FirebaseAuthException catch(e){
    print(e);
  }

   
}

}