import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'admin_teachers_of_department.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final double a = 12;
  final user = FirebaseAuth.instance.currentUser!;
  String dropdownAdmin = 'Home';
  List<String> adminHomeList = [
    "Courses",
    "Teachers",
    "Allocation",
    "Settings"
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
              itemCount: adminHomeList.length,
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
                        String a = adminHomeList[index].toLowerCase();

                        switch (a) {
                          case "teachers":
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const AdminAllTeachersInDepartment(
                                          titleOfDepartment: 'title',
                                        )),
                              );
                              break;
                            }

                          case "courses":
                            {
                              Navigator.pushNamed(context, '/all_courses');
                              break;
                            }

                          case "settings":
                            {
                              Navigator.pushNamed(context, '/settings');
                              break;
                            }

                          
                          case "allocation":
                            {
                              Navigator.pushNamed(context, '/allocation_home');
                              break;
                            }  
                        }
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(adminHomeList[index],
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
                TextButton(
                    onPressed: (() => FirebaseAuth.instance.signOut()),
                    child: const Text(
                      '\nSignout',
                      style: TextStyle(fontSize: 20),
                    )),
        ],
      ),
    );
  }
}
