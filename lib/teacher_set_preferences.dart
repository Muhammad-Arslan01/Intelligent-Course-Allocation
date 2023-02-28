import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intelligent_course_allocation/preferences_model.dart';

class TeacherSetPreferences extends StatefulWidget {
  const TeacherSetPreferences({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<TeacherSetPreferences> createState() => _TeacherSetPreferencesState();
}

class _TeacherSetPreferencesState extends State<TeacherSetPreferences> {
  final double a = 12;
  late int noOfPreferences;

  var prefSelected = const SnackBar(
    content: Text('Preference selected'),
  );

  String dropdownTeacher = 'Home';

  // List of items in our dropdown menu
  var itemsTeacher = [
    'Home',
    'Set Preferences',
  ];

///////////////////                                 PREFERENCES

  @override
  void initState() {
    fetchPreferences();
    fetchCourses();

    super.initState();
  }

  void fetchPreferences() async {
    var records = await FirebaseFirestore.instance
        .collection('preferences')
        .doc('preferences')
        .get()
        .then((value) {
      DocumentSnapshot docSnap = value;
      String noOfPref = docSnap['no_of_preferences'];

      noOfPreferences = int.parse(noOfPref);

      print('no of Pref= $noOfPreferences');

      setState(() {
        itemsPreference = [];
        for (int i = 0; i < noOfPreferences; i++) {
          int j = i + 1;
          itemsPreference.add("Preference");
          String s = " ";
          s += j.toString();

          itemsPreference[i] += s;
        }
      });
    });
  }

  String dropdownPreference = 'Preference 1';

  // List of items in our dropdown menu
  var itemsPreference = [
    'Preference 1',
    'Preference 2',
    'Preference 3',
  ];

  String dropdownCourseLevel = 'Undergraduate';

  // List of items in our dropdown menu
  var itemsCourseLevel = [
    'Undergraduate',
    'Postgraduate',
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

  String dropdownResearchArticles = '1-5';

  // List of items in our dropdown menu
  var itemsResearchArticles = [
    '1-5',
    '6-10',
    '11-15',
    '16-20',
    '> 20',
    '0',
  ];

  String dropdownTeachingTimes = '1-5';

  // List of items in our dropdown menu
  var itemsTeachingTimes = [
    '1-5',
    '6-10',
    '11-15',
    '16-20',
    '> 20',
    '0',
  ];

  String dropdownPhDPaper = 'Somewhat Related';

  // List of items in our dropdown menu
  var itemsPhDPaper = [
    'Somewhat Related',
    'Related',
    'Highly Related',
    'Not Related',
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
              children: [
                DropdownButton(
                  // Initial Value
                  value: dropdownTeacher,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsTeacher.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownTeacher = newValue!;
                    });
                  },
                ),
                const SizedBox(
                  width: 110,
                ),
                const Text('Logged in \nas Teacher'),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children: [
                const Text('Preference'),
                const SizedBox(
                  width: 6,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownPreference,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsPreference.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownPreference = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children: [
                const Text('Under/Postgraduate'),
                const SizedBox(
                  width: 30,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownCourseLevel,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsCourseLevel.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownCourseLevel = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children: [
                const Text('Course'),
                const SizedBox(
                  width: 95,
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
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children: [
                const Text('Research Articles'),
                const SizedBox(
                  width: 37,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownResearchArticles,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsResearchArticles.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownResearchArticles = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            alignment: Alignment.center,
            width: 100.0,
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 0),
            child: Row(
              children: [
                const Text('No of Times Taught'),
                const SizedBox(
                  width: 25,
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownTeachingTimes,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: itemsTeachingTimes.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownTeachingTimes = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(120, 0, 130, 0),
              child: ElevatedButton(
                onPressed: () {
                  // print('preference= $dropdownPreference');
                  // print(' =$dropdownCourseLevel');
                  // print(' =$dropdownCourse');
                  // print(' =$dropdownResearchArticles');
                  // print(' =$dropdownTeachingTimes');
                  setPreference();

                  ScaffoldMessenger.of(context).showSnackBar(prefSelected);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.blue)))),
                child: const Text(
                  'Set Preference ',
                  style: TextStyle(fontSize: 15.0, height: 1.0),
                ),
              )),
        ],
      ),
    );
  }

  void setPreference() {
    int scoreForResearch = getScores(dropdownResearchArticles);
    int scoreForTeaching = getScores(dropdownTeachingTimes);
    int score = scoreForResearch + scoreForTeaching;
    String pref = dropdownPreference;
    String scoreForPref="scores_for_$pref";
    final scoresForCourse = {scoreForPref: score};
    

    final prefForCourse = {pref: dropdownCourse};

    final data = {
      "undergraduate_course_preference_scores": scoresForCourse,
      "undergraduate_courses_preferred": prefForCourse,
    };
    String? uid = FirebaseAuth.instance.currentUser?.uid;
     FirebaseFirestore.instance
        .collection('teacher')
        .doc(uid)
        .set(data, SetOptions(merge: true));
  }

  int getScores(String str) {
    if (str.compareTo("1-5") == 0) {
      return 5;
    }

    if (str.compareTo("6-10") == 0) {
      return 10;
    }

    if (str.compareTo("11-15") == 0) {
      return 15;
    }

    if (str.compareTo("16-20") == 0) {
      return 20;
    }

    return 25;
  }

   
    void fetchCourses() async {
    List<String> coursesList=[];
      
    var courses =
        await FirebaseFirestore.instance.collection('courses').get().then((value) {
          value.docs.forEach((result) {
            DocumentSnapshot docSnap = result;
            String courseCode = docSnap['course_code'];
 
            coursesList.add(courseCode);

          });
        });

        setState(() {
          itemsCourse=coursesList;
          dropdownCourse=coursesList.first;

        });
    }
 
 
 
  

}
