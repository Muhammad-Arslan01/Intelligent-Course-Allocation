import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

 
class AdminCoursesAllocated extends StatefulWidget {
  const AdminCoursesAllocated({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AdminCoursesAllocated> createState() => _AdminCoursesAllocatedState();
}

class _AdminCoursesAllocatedState extends State<AdminCoursesAllocated> {
  final double a = 12;

  String teacherName="";
    final user = FirebaseAuth.instance.currentUser!;
  String dropdownAdmin = 'Home';
  List<String> teachersList = [];

  List<String> coursesList=[];

  // List of items in our dropdown menu
  var itemsAdmin = [
    'Home',
    'settings',
    'all\ndepartments',
  ];

 


@override
  void initState() {
     fetchTeachersAndCourses();

     
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
                  width: 11.0,
                ),

                Text('Logged in \nas admin as \n${user.email}'),

              ],
            ),
          ), 
 
 
 
          
 

          Flexible(
            child: GridView.builder(
 
              itemCount: teachersList.length,
 

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
                            child: Text('${teachersList[index]}\n${coursesList[index]}',
                            textAlign: TextAlign.center,
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

 

  Future<void> fetchTeachersAndCourses() async {
     List<String> t=[];
     List<String> c=[];
      var d=  await FirebaseFirestore.instance
        .collection('allocated_courses')
        .get().then((value) => 
        value.docs.forEach((element) {
      DocumentSnapshot docSnap=element;
      String tName=docSnap['teacher_name']; 
      String cCode=docSnap['course_code'];
       
      t.add(tName);
      c.add(cCode);
 

        })
        );
      

 
    
 
 

      setState(() {
       
        teachersList=t;
        coursesList=c;
      });



        
  }
}
