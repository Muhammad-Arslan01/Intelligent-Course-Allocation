import 'package:flutter/material.dart';

class AdminSingleDepartment extends StatefulWidget {
  const AdminSingleDepartment({Key? key, required this.title}): super(key: key);
  final String title;
  @override
  State<AdminSingleDepartment> createState() => _AdminSingleDepartmentState();
}

class _AdminSingleDepartmentState extends State<AdminSingleDepartment> {
  final double a = 12;

  String dropdownAdmin = 'Home';
  List<String> singleDepartmentList = ["Programs", "Courses"];

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

          Flexible(
            child: GridView.builder(
              //shrinkWrap: true,
              //    physics: NeverScrollableScrollPhysics(),
              itemCount: singleDepartmentList.length,
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
                        String a = singleDepartmentList[index].toLowerCase();
                        Navigator.pushNamed(context, '/$a');
                      }),
                      onLongPress: (() {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Deleting Department"),
                        ));
                      }),
                      child: Card(
                        color: Colors.lightBlueAccent,
                        elevation: 50.0,
                        child: Center(
                            child: Text(singleDepartmentList[index],
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

          // const Padding(
          //           padding: EdgeInsets.fromLTRB(20, 0, 20, 20),

          //           child:  Card(

          //             color: Colors.lightBlueAccent,
          //             elevation: 50.0,
          //              child: Center(child: Text('Delete this Department' ,
          //              style: TextStyle(
          //               fontWeight: FontWeight.w500,
          //               color: Colors.white,

          //              )

          //              )),
          //            ),
          //         ),
        ],
      ),
    );
  }
}
