import 'package:flutter/material.dart';

class AdminAllTeachersInDepartment extends StatefulWidget {
  const AdminAllTeachersInDepartment({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<AdminAllTeachersInDepartment> createState() => _AdminAllTeachersInDepartmentState();
}

class _AdminAllTeachersInDepartmentState extends State<AdminAllTeachersInDepartment> {

    final double a = 12;
    List<String> allTeachersInCSList=["Dr Rabi","Dr Mudasar\nSindhu","Dr Akmal"];
    List<String> allTeacherssInPhysicsList=["Dr Ali","Dr Muhammad","Dr Ahsan"];
    
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
 
    
  ];
  String? theDepartment;
  @override
  void initState() {
    //fetchTeachers();
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
                  width: 50.0,
                ),
                const Text('Logged in \nas Admin'),
              ],
            ),
          ),
          
                   // const SizedBox(height:30.0),

         Padding(
           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
           child: Row(
             children:  [

                const Text('Select Department'),
                const SizedBox(
                 width: 20,
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
                 theDepartment=dropdownDepartment;
               });
             },
           ),
               
               
             ],
           ),
         ),

        Flexible(
          child: GridView.builder(
            //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
            itemCount: allTeachersInCSList.length,
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
                      
                      allTeachersInCSList[index],
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
}