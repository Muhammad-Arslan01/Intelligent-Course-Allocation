import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



import 'teacher_courses_allocated_to_me.dart';

class CoursesAllocatedToMe extends StatefulWidget {
  const CoursesAllocatedToMe({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CoursesAllocatedToMe> createState() => _CoursesAllocatedToMeState();
}

class _CoursesAllocatedToMeState extends State<CoursesAllocatedToMe> {
  final double a = 12;

  String teacherName="";
  String teacherDesig="";
  String dropdownTeacher = 'Home';
  List<String> CoursesAllocatedToMeList = [];

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
     fetchTeachersAndCourses(teacherName);

     
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
 
              itemCount: CoursesAllocatedToMeList.length,
 

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: GestureDetector(
                      
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(CoursesAllocatedToMeList[index],
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

 
 
        ],
      ),
    );
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

      List<String> coursesAllocatedToThisTeacher=await fetchTeachersAndCourses(tName);

      setState(() {
        teacherName=tName;
        teacherDesig=tDesig;
        CoursesAllocatedToMeList=coursesAllocatedToThisTeacher;
      });


        
  }

  Future<List<String>> fetchTeachersAndCourses(String teacherName) async {
     List<String> t=[];
     List<String> c=[];

      String uid=FirebaseAuth.instance.currentUser!.uid;
       print('\n fetch t and c , printing teachername=$teacherName');
      var d=  await FirebaseFirestore.instance
        .collection('allocated_courses')
        .where('teacher_name',isEqualTo: teacherName)
        .get().then((value) => 
        value.docs.forEach((element) {
      DocumentSnapshot docSnap=element;
      
      String cCode=docSnap['course_code'];
       
      
      c.add(cCode);
 

        })
        );
      

   

        
      return c;



        
  }


  /////////////////////////////Circular progress indicator
  ///
  Widget circularPro(){
    return CircularProgressIndicator(
      
    );
  }
}
