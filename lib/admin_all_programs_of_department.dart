import 'package:flutter/material.dart';
import 'admin_program.dart';

class AdminAllProgramsInDepartment extends StatefulWidget {
  const AdminAllProgramsInDepartment(
      {Key? key, required this.titleOfDepartment})
      : super(key: key);
  final String titleOfDepartment;
  @override
  State<AdminAllProgramsInDepartment> createState() =>
      _AdminAllProgramsInDepartmentState();
}

class _AdminAllProgramsInDepartmentState
    extends State<AdminAllProgramsInDepartment> {
  final double a = 12;
  List<String> allProgramsInCSList = [
    "BS CS",
    "MS IST",
    "MPhil CS",
    "PhD CS",
    "PostDoc CS"
  ];
  List<String> allProgramsInPhysicsList = [
    "BS Physics",
    "MPhil Physics",
    "PhD Physics",
    "PostDoc Nuclear Physics"
  ];
  List<String> allProgramsInEEList = [
    "BE Mechatronics",
    "ME Electrical",
    "DPhil Electrical",
    "PostDoc Electrical"
  ];
  List<String> myList = [];

  String dropdownAdmin = 'Home';
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
  ];

  String dropdownDepartment = 'Electrical Engineering';

  // List of items in our dropdown menu
  var itemsDepartment = [
    'Computer Science',
    'Physics',
    'Electrical Engineering'
  ];
  String? theDepartment;

  @override
  void initState() {
    if (widget.titleOfDepartment.toLowerCase() == "computer science") {
      myList = allProgramsInCSList;
    } else if (widget.titleOfDepartment.toLowerCase() == "physics") {
      myList = allProgramsInPhysicsList;
    } else if (widget.titleOfDepartment.toLowerCase() ==
        "electrical engineering") {
      myList = allProgramsInEEList;
    }

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
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 20),
            child: Row(
              children: [
                const Text('Department: '),
                const SizedBox(
                  width: 20,
                ),
                Text(widget.titleOfDepartment),
              ],
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
                    child: GestureDetector(
                      onTap: (() {
                        String program = myList[index];
                        String department=widget.titleOfDepartment;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminProgram(
                                    titleOfDepartment: department,
                                    titleOfProgram: program,
                                  )),
                        );
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(myList[index],
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
