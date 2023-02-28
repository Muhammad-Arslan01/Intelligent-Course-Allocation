import 'package:flutter/material.dart';

class AdminAddNewProgramInDepartment extends StatefulWidget {
  const AdminAddNewProgramInDepartment({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<AdminAddNewProgramInDepartment> createState() => _AdminAddNewProgramInDepartmentState();
}

class _AdminAddNewProgramInDepartmentState extends State<AdminAddNewProgramInDepartment> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Add New Program in  Department',
                    style: TextStyle(fontSize: 20),
                  )),

        

                 Container(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                   child: DropdownButton(
               
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
                 ),
                
                const SizedBox(height: 20.0,),
             
              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: emailController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Program Name',
                    isDense: true,
                    
                  ),
                ),
              ),
              const SizedBox(height:20.0),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                height: 60.0,
                child: TextField(
                  autofocus: false, 
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Program ID',
                     isDense: true,
                  ),
                ),
              ),
              const SizedBox(height:20.0),
              Container(
                height: 60.0,
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
                child: TextField(
                  autofocus:false,
                  controller: emailController,
 
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    labelText: 'Program Description',
                    isDense: true,
                    
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),

                        Container(
                           
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(115, 0, 130, 0),
                  child: ElevatedButton(
                    onPressed: () {
 
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Add Program',
                      style: TextStyle(fontSize: 15.0, height: 1.0),
                    ),
                  )),
 
                  
 

 
        ],
      ),
    );


  }
}