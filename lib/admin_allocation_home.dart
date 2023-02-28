import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_course_allocation/allocation.dart';
import 'package:intelligent_course_allocation/courses_allocated.dart';

import 'admin_courses_allocated.dart';
import 'admin_teachers_of_department.dart';

class AdminAllocationHome extends StatefulWidget {
  const AdminAllocationHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AdminAllocationHome> createState() => _AdminAllocationHomeState();
}

class _AdminAllocationHomeState extends State<AdminAllocationHome> {
  final double a = 12;
  final user = FirebaseAuth.instance.currentUser!;
  String dropdownAdmin = 'Home';
  List<String> AdminAllocationHomeList = [
    "View Allocated Courses",
    "Apply Algorithm", 
  ];

  // List of items in our dropdown menu
  var itemsAdmin = [
    'Home',
    'settings',
    'all\ndepartments',
  ];

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
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: AdminAllocationHomeList.length,
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
                        String a = AdminAllocationHomeList[index].toLowerCase();

                        switch (a) {
                          case "view allocated courses":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdminCoursesAllocated(
                                          title: 'Courses Allocated',
                                        )),
                              );
                              break;
                            }

                          case "apply algorithm":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Allocation()),
                              );
                              break;
                            }

  
                        }
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(AdminAllocationHomeList[index],
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
                                    //Text('Logged in \nas admin as \n${user.email}'),
 
        ],
      ),
    );
  }
}
