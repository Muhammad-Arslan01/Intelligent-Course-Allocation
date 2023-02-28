import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_new_teacher_in_department.dart';

class AdminAllTeachersInDepartment extends StatefulWidget {
  const AdminAllTeachersInDepartment(
      {Key? key, required this.titleOfDepartment})
      : super(key: key);
  final String titleOfDepartment;
  @override
  State<AdminAllTeachersInDepartment> createState() =>
      _AdminAllTeachersInDepartmentState();
}

class _AdminAllTeachersInDepartmentState
    extends State<AdminAllTeachersInDepartment> {
  final double a = 12;

  String title = "electrical engineering";
  List<String> allTeachersInCSList = [
    "Dr. Shuaib",
    "Dr. Rabi",
    "Dr. Khalid",
    "Dr. Akmal",
  ];
  List<String> allTeachersInPhysicsList = [
    "Dr. Ahsan",
    "Dr. Ali",
    "Dr. Mohsin",
    "Dr. Siddique"
  ];
  List<String> allTeachersInEEList = [
    "Dr. Abu Bakar",
    "Dr. Umar",
    "Dr. Usman",
    "Dr. Ali"
  ];
  List<String> myList = [];///for teachers name
  List<String> myList1= [];// for teachers designation

  String dropdownAdmin = 'Home';
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
  ];

  String dropdownDepartment = 'Computer Science';

  // List of items in our dropdown menu
  var itemsDepartment = [
    'Computer Science',
    'Physics',
    'Electrical Engineering'
  ];
  String? theDepartment;

  @override
  void initState() {
 
    fetchTeachers();

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
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
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

          // const SizedBox(height:30.0),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              children: const [
                Text('Department : '),
                SizedBox(
                  width: 20,
                ),
                Text('Computer Science')
 
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminAddNewTeacherInDepartment()),
                  );
                }),
                child: const Text(
                  "Add New Teacher here",
                  style: TextStyle(
                    backgroundColor: Colors.white,
                    color: Colors.blueAccent,
                  ),
                  ),
              ),
            ),
          ),

          Flexible(
            child: GridView.builder(
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: myList.length,
              //physics: const NeverScrollableScrollPhysics(),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Card(
                      color: Colors.lightBlueAccent,
                      elevation: 50.0,
                      child: Center(
                          child: Text("${myList[index]}\n${myList1[index]}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                
                              ))),
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

  void updateListOfTeachers() {
    if (title.toLowerCase() == "computer science") {
      myList = allTeachersInCSList;
    } else if (title.toLowerCase() == "physics") {
      myList = allTeachersInPhysicsList;
    } else if (title.toLowerCase() == "electrical engineering") {
      myList = allTeachersInEEList;
    }
  }

  Future<void> fetchTeachers() async {
    List<String> teachersName=[];
    List<String> teachersDesig=[];
        var teachers = await FirebaseFirestore.instance
        .collection('teacher')
        .get()
        .then((value) {
      value.docs.forEach((result) {
        DocumentSnapshot docSnap = result;
        String tName = docSnap['name'];
        String tDesig= docSnap['designation'];
 
        teachersName.add(tName);
        teachersDesig.add(tDesig);

      });
    });

    setState(() {
      myList=teachersName;
      myList1=teachersDesig;
    });
  }
}
