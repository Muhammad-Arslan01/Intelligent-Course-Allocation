import 'package:flutter/material.dart';

class AdminAddCourseInSemester extends StatefulWidget {
  const AdminAddCourseInSemester({Key? key,required this.titleOfDepartment,required this.titleOfProgram,required this.semester}) : super(key: key);
  final String titleOfDepartment;
  final String titleOfProgram;
  final String semester;
  @override
  State<AdminAddCourseInSemester> createState() => _AdminAddCourseInSemesterState();
}

class _AdminAddCourseInSemesterState extends State<AdminAddCourseInSemester> {
  final double a = 12;

    String dropdownAdmin = 'Home';  
 
  // List of items in our dropdown menu
  var itemsAdmin = [   
    'Home',
    'settings',
    'all departments',
    
  ];

      String dropdownDepartment = 'Electrical Engineering';  
 
  // List of items in our dropdown menu
  var itemsDepartment = [   
    'Physics',
    'Computer Science',
    'Electrical Engineering',
 
    
  ];

        String dropdownProgram = 'BS CS';  
 
  // List of items in our dropdown menu
  var itemsProgram = [   
    'BS CS',
    'MPhil CS',
    'MS IST',
    'PhD CS',
 
    
  ];


          String dropdownCourse = 'CS101';  
 
  // List of items in our dropdown menu
  var itemsCourse = [   
    'CS101',
    'CS102',
    'CS103',
    'CS104',
    'CS105',
 
    
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: const Icon(Icons.arrow_back_ios),
          ),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Row(
              children:  [
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
                  width: 118,
                ),
                const Text('Logged in \nas Admin'),
              ],
            ),
          ),
          const SizedBox(height:30.0),

         Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children:  [

                 const Text('Select Department'),
                 const SizedBox(
                  width: 6,
                ), 

                 DropdownButton(
               
              // Initial Value
              value: dropdownDepartment,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsDepartment.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownDepartment = newValue!;
                });
              },
            ),
                
                
              ],
            ),
          ),
                           

          const SizedBox(height:20.0),

         Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children:  [

                 const Text('Select Program'),
                 const SizedBox(
                  width: 70,
                ), 

                 DropdownButton(
               
              // Initial Value
              value: dropdownProgram,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsProgram.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownProgram = newValue!;
                });
              },
            ),
                
                
              ],
            ),
          ),

          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children:  [

                 const Text('Select Semester'),
                 const SizedBox(
                  width: 70,
                ), 

                 DropdownButton(
               
              // Initial Value
              value: dropdownProgram,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsProgram.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownProgram = newValue!;
                });
              },
            ),
                
                
              ],
            ),
          ),
          
                   const SizedBox(height:20.0),

         Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children:  [

                 const Text('Select Course'),
                 const SizedBox(
                  width: 78,
                ), 

                 DropdownButton(
               
              // Initial Value
              value: dropdownCourse,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsCourse.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownCourse = newValue!;
                });
              },
            ),
                
                
              ],
            ),
          ),  

          const SizedBox(height:20.0),

                        Container(
                           
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(130, 0, 130, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Add Course',
                      style: TextStyle(fontSize: 15.0, height: 1.0),
                    ),
                  )),
 
                  
 

 
        ],
      ),
    );


  }
}