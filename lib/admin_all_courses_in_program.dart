import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'add_new_course_in_program.dart';

class AdminAllCoursesInProgram extends StatefulWidget {
  const AdminAllCoursesInProgram({Key? key}) : super(key: key);
 
  @override
  State<AdminAllCoursesInProgram> createState() => _AdminAllCoursesInProgramState();
}

class _AdminAllCoursesInProgramState extends State<AdminAllCoursesInProgram> {
  
  final double a = 12;
    List<String> courseCodes=[];
    List<String> courseNames=[];
  String titleOfDepartment="Computer Science";
  
    String dropdownAdmin = 'Home';  
    List<String> allCoursesInBSCS=[ 
      "Problem Solving and Programming ",
      "Object Oreiented Programming",
      "Data Structures and Algorithms",
      "Analysis and Design of Algorithms ",
      "Compiler Construction",
      "Computer Graphics",
      "Artificial Intelligence",
      "Mobile Application Development",
      
    ];

        List<String> allCoursesInBSPhysics=[ 
          "Quantum Mechanics",
          "Theory of Relativity",
          "Special Thoery of Relativity"
      
    ];

        List<String> allCoursesInBEE=[ 
 
      "Magnets",
      "Circuits",
      "Sensors",
      
    ];

    List<String> allCoursesInMphilCS=[
       "Graph Theory",
       "Advanced Analysis of Algorithms",
       " Advanced Computer Architecture",
       "Machine Learning II ", 
    ];

        List<String> allCoursesInMphilPhysics=[
          "Quantum Mechanics II",
          "Theory of Relativity II",
          "Special Thoery of Relativity II"
    ];

    List<String> allCoursesInMTechEE=[

      "Magnets II",
      "Circuits II",
      "Sensors II",
    ];
    List<String> allCoursesInPhDCS=[ 
        "Deep Learning",
        "Natural Language Processing",
        "Data Science",
        "Advanced Computer Networks",
        
        
        ];

         List<String> allCoursesInPhDPhysics=[ 
         "Nuclear Physics",
         "Super Computers",
         "Wave Mechanics",
         "Plasma Physics"
          
        
        
        ]; 


         List<String> allCoursesInPhDEE=[ 
          "Computer Engineering",
          "Power Engineering",
          "Telecom Engineering",
          "5G"
        
        
        ];     


    List<String> myList=[];
 
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

  @override
  void initState() {
 
     
    fetchCourses();
     

     



 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
         
        children: <Widget>[
          const SizedBox(height: 20.0,),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: const Icon(Icons.arrow_back_ios),
          ),
           
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 20),
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
             children:   [

                const Text('Department :  '),
                const SizedBox(
                 width: 49,
               ), 

                 Text(titleOfDepartment),
               
               
             ],
           ),
           
         ),  

 

                     const SizedBox(
              height: 10.0,
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0,0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminAddNewCourseInProgram(                                
                                )),
                      );
                    }),
                    child: const Text(
                      "Add New Course ",
                      style: TextStyle(
                        backgroundColor: Colors.white,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                ),
 
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
            itemBuilder: (BuildContext context,int index) {
              return  GridTile(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child:  Card(
                    color: Colors.lightBlueAccent,
                    elevation: 50.0,
                     child: Center(child: Text(
                      
                      myList[index],
                      textAlign: TextAlign.center,
                     style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      
                     )
                     
                     )),
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

    Future<void> fetchCourses() async {
    List<String> cCodes=[];
    List<String> cNames=[];
        var courses = await FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((value) {
      value.docs.forEach((result) {
        DocumentSnapshot docSnap = result;
        String cCode = docSnap['course_code'];
        String cName= docSnap['course_name'];
        
 
        cCodes.add(cCode);
        cNames.add(cName);
         

      });
    });

     

      setState(() {
      courseCodes=cCodes;
      courseNames=cNames;
      myList=courseNames;
      });
     
  }

}