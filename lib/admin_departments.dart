import 'package:flutter/material.dart';
import 'admin_add_new_department.dart';
import 'admin_all_programs_of_department.dart';

class AdminDepartments extends StatefulWidget {
  const AdminDepartments({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AdminDepartments> createState() => _AdminDepartmentsState();
}

class _AdminDepartmentsState extends State<AdminDepartments> {
  final double a = 12;

  String dropdownAdmin = 'Home';
  List<String> departmentsList = [
    "Computer Science",
    "Electrical Engineering",
    "Physics",
    "Add\nNew\nDepartment"
  ];

  // List of items in our dropdown menu
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
  ];
  SnackBar snackBar = const SnackBar(
  content: Text('Yay! A SnackBar!'),
);


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
                  width: 100.0,
                ),
                const Text('Logged in \nas Admin'),
              ],
            ),
          ),
          Flexible(
            child: GridView.builder(
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: departmentsList.length,
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
                        String a = departmentsList[index].toLowerCase();
                        String addNew = "Add\nNew\nDepartment";

                         if (a == addNew.toLowerCase()) {
                           
                          //ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AdminAddNewDepartment()),
                          );
                        }
                        
                        else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminAllProgramsInDepartment(
                                    titleOfDepartment: a,
                                  )),
                        );
                        }

                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(departmentsList[index],
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
          )
        ],
      ),
    );
  }
}
