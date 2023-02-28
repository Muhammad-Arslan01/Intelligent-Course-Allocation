import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPreferencesSettings extends StatefulWidget {
  const AdminPreferencesSettings({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  State<AdminPreferencesSettings> createState() => _AdminPreferencesSettingsState();
}

class _AdminPreferencesSettingsState extends State<AdminPreferencesSettings> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final double a = 12;

  @override
  void initState() {
    fetchPreferences(); 
    super.initState();
  }

    String dropdownAdmin = 'Home';  
 
  // List of items in our dropdown menu
  var itemsAdmin = [   
    'Home',
    'settings',
    'all departments',
    
  ];

  var dropdownCoursePreferences='2';
    var itemsCoursePreferences = [   
    '2',
    '3',
    '4',
    '5',
    
 
    
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
           const SizedBox(height: 20.0,),
          Container(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: const Text('How many course Preferences do you want teacher to give')),

                                         const SizedBox(height: 20.0,),

                 Container(
                 
                  padding: const EdgeInsets.fromLTRB(130, 0, 180, 0),
                   child: DropdownButton(
               
              // Initial Value
              value: dropdownCoursePreferences,
               
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),   
               
              // Array list of items
              items: itemsCoursePreferences.map((String items) {
                return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                    dropdownCoursePreferences = newValue!;
                });
              },
            ),
                 ),
                
                const SizedBox(height: 20.0,),
 
 

                        Container(
                           
                  height: 60,
                  padding: const EdgeInsets.fromLTRB(115, 0, 130, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      updatePreferenceSettings(dropdownCoursePreferences);
                      
                      //dialog();
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(color: Colors.blue)))),
                    child: const Text(
                      'Update Preference Settings',
                      style: TextStyle(fontSize: 15.0, height: 1.0),
                    ),
                  )),
 
                  
 

 
        ],
      ),
    );


  }

 

    void updatePreferenceSettings(String noOfPreferences) async {
    final data = {
      "no_of_preferences": noOfPreferences,
    };

      await FirebaseFirestore.instance
      .collection('preferences')
      .doc('preferences')
      .set(data, SetOptions(merge: true));

  }

  Future<void> fetchPreferences() async {
        String pref="";
 
   var p = await FirebaseFirestore.instance
        .collection('preferences')
        .doc('preferences').get();
        DocumentSnapshot docSnap=p;
        pref=docSnap['no_of_preferences'];
 

        setState(() {
          dropdownCoursePreferences=pref;
        });

        //print("dropdownCoursePreferences=$pref");


  }

}