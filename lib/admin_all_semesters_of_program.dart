import 'package:flutter/material.dart';
 
import 'admin_all_courses_in_semester.dart';

class AdminAllSemestersInProgram extends StatefulWidget {
  const AdminAllSemestersInProgram(
      {Key? key, required this.titleOfDepartment, required this.titleOfProgram})
      : super(key: key);
  final String titleOfDepartment;
  final String titleOfProgram;
  @override
  State<AdminAllSemestersInProgram> createState() =>
      _AdminAllSemestersInProgramState();
}

class _AdminAllSemestersInProgramState
    extends State<AdminAllSemestersInProgram> {
  final double a = 12;

  String dropdownAdmin = 'Home';
  List<String> allSemestersInBS = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
    "Semester 5",
    "Semester 6",
    "Semester 7",
    "Semester 8",
  ];

  List<String> allSemestersInMphil = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
  ];

  List<String> allSemestersInPhD = [
    "Semester 1",
    "Semester 2",
    "Semester 3",
    "Semester 4",
    "Semester 5",
    "Semester 6",
    "Semester 7",
    "Semester 8",
    "Semester 9",
    "Semester 10"
  ];

  // List of items in our dropdown menu
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
  ];

  String dropdownSemester = '1';

  // List of items in our dropdown menu
  var itemsSemester = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];

  String dropdownProgram = 'BS CS';

  // List of items in our dropdown menu
  var itemsProgram = [
    'BS CS',
    'MPhil CS',
    'MS IST',
    'PhD CS',
  ];

  List<String> myList = [];

  @override
  void initState() {
    String program = widget.titleOfProgram;
    if (program[0] == 'B') {
      myList = allSemestersInBS;
    } else if (program[0] == 'M') {
      myList = allSemestersInMphil;
    } else {
      myList = allSemestersInPhD;
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
            padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
            child: Row(
              children: [
                const Text('Department :  '),
                const SizedBox(
                  width: 49,
                ),
                Text(widget.titleOfDepartment),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
            child: Row(
              children: [
                const Text('Program :  '),
                const SizedBox(
                  width: 70,
                ),
                Text(widget.titleOfProgram),
              ],
            ),
          ),

          Flexible(
            child: GridView.builder(
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: myList.length,
              //allSemestersInMPhil.length,
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
                        String semesterNum = myList[index].toLowerCase();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AdminAllCoursesInSemester(
                                    titleOfDepartment: widget.titleOfDepartment,
                                    titleOfProgram: widget.titleOfProgram,
                                    semester: semesterNum,
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
