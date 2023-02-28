import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'courses_allocated.dart';
import 'teacher_set_preferences.dart';
import 'teacher_courses_allocated_to_me.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<TeacherHome> createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome> {
  final double a = 12;

  String teacherName="";
  String teacherDesig="";
  String dropdownTeacher = 'Home';
  List<String> teacherHomeList = [
    "Preferences",    
    "Courses\nAllocated\nto Me",
    "Courses\nAllocated",
  ];

  // List of items in our dropdown menu
  var itemsTeacher = [
    'Home',
    'Preferences',
    'Courses Allocated',
    'Courses\nAllocated\nTo Me',
  ];

    var signoutSnackBar = SnackBar(
  content: Text('Signed out'),
);


@override
  void initState() {
     fetchNameAndDesig();

     
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: const Icon(Icons.arrow_back_ios),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownTeacher,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsTeacher.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownTeacher = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 25.0,
                ),
                Text('Logged in \nas $teacherName'),
              ],
            ),
          ),
 
 
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
              child: Row(children: [
                Text("Name: "),
                Text(''),
                const SizedBox(
                    width: 70.0,
                  ),
                Text(teacherName,
              style: TextStyle(color: Colors.lightBlueAccent),),
              ],),
            ),
          

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Row(children: [
              Text("Designation: "),
              Text(''),
              const SizedBox(
                    width: 30.0,
                  ),
              Text(teacherDesig,
              style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ],),
          ),
 

          Flexible(
            child: GridView.builder(
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: teacherHomeList.length,
              //physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: GestureDetector(
                      onTap: (() {
                        String str = teacherHomeList[index].toLowerCase();
                        switch (str) {
                          case "preferences":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherSetPreferences(
                                          title: 'title',
                                        )),
                              );
                              break;
                            }

                          case "courses\nallocated":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CoursesAllocated(
                                          title: 'title',
                                        )),
                              );
                              break;
                            }

                          case "courses\nallocated\nto me":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CoursesAllocatedToMe(
                                          title: 'title',
                                        )),
                              );
                              break;
                            }
                        }
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(teacherHomeList[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ))),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
                          TextButton(
                    onPressed: (() => signOutFun()
                     


                    ),
                    child: const Text(
                      '\nSignout',
                      style: TextStyle(fontSize: 20),
                    )),
        ],
      ),
    );
  }

  Future signOutFun() async{
    try{
      FirebaseAuth.instance.signOut();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(signoutSnackBar);


    
    } on FirebaseAuthException catch(e){
      print (e);
    }
  }

  Future<void> fetchNameAndDesig() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
      var d=  await FirebaseFirestore.instance
        .collection('teacher')
        .doc(uid).get();
      DocumentSnapshot docSnap=d;
      String tName=docSnap['name'];
      String tDesig=docSnap['designation'];
      print("tName=$tName");
      print("tDesig=$tDesig");

      setState(() {
        teacherName=tName;
        teacherDesig=tDesig;
      });


        
  }
}
