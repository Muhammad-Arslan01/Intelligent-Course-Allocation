import 'package:flutter/material.dart';
 
import 'admin_all_semesters_of_program.dart';

import 'admin_all_courses_in_program.dart';

class AdminProgram extends StatefulWidget {
  const AdminProgram(
      {Key? key, required this.titleOfDepartment, required this.titleOfProgram})
      : super(key: key);
  final String titleOfDepartment;
  final String titleOfProgram;
  @override
  State<AdminProgram> createState() => _AdminProgramState();
}

class _AdminProgramState extends State<AdminProgram> {
  final double a = 12;

  String dropdownAdmin = 'Home';
 
  List<String> optionsInProgram = ["Semesters", "Courses"];

  // List of items in our dropdown menu
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
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
                  width: 100.0,
                ),
                const Text('Logged in \nas Admin'),
              ],
            ),
          ),

          Padding(
           padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
           child: Row(
             children:   [

                const Text('Department :  '),
                const SizedBox(
                 width: 49,
               ), 

                 Text(widget.titleOfDepartment),
               
               
             ],
           ),
           
         ), 
                           Padding(
           padding: const EdgeInsets.fromLTRB(40, 15, 20, 0),
           child: Row(
             children:   [

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
              itemCount: optionsInProgram.length,
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
                        String option= optionsInProgram[index];
                        if(option.toLowerCase()=="semesters"){
                           Navigator.push(context, MaterialPageRoute(builder: ((context) => 
                           AdminAllSemestersInProgram(titleOfDepartment: widget.titleOfDepartment,titleOfProgram: widget.titleOfProgram,)
                           ))); 
                        }
                        else{
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => 
                           AdminAllCoursesInProgram()
                           ))); 
                        }

  
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(optionsInProgram[index],
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
