import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
 

import 'gale_shapely2.dart';

class Allocation extends StatefulWidget {
  const Allocation({Key? key}) : super(key: key);

  @override
  State<Allocation> createState() => _AllocationState();
}

class _AllocationState extends State<Allocation> {
  final double a = 12;
  List<String> list = [];
  String title = "fall 2022";
  List<String> myList = [];

  String dropdownAdmin = 'Home';
  var itemsAdmin = [
    'Home',
    'settings',
    'all departments',
  ];

  List<String> myList2 = [];

  String dropdownDepartment = 'Fall 2022';

  // List of items in our dropdown menu
  var itemsDepartment = [
    'Fall 2022',
    'Spring 2023',
    'Fall 2023',
    'Spring 2024',
    'Fall 2024',
    'Spring 2025',
  ];
  String? theDepartment;

  @override
  void initState() { 
   setDataForAlgo();
   //fetchAllocatedCourses();   
   super.initState();
  }

/////////////////////////////////////////////////////////////////////////////////////////
 

//algorithm

  //** list ofteacher**/

  List<String> t=["Sajad","Shakeel","Shuaib","Akbar","Akmal Javed"];
  
  //** list of course **/

  List<String> c=["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"];

  //**teacherpreference **/

List<List<String>> tp=[
        ["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"],
        ["CS211-DS","CS105-PSP","CS225-DBS","CS103-ICO","CS101-ITC"],
        ["CS103-ICO","CS105-PSP","CS225-DBS","CS101-ITC","CS211-DS"],
        ["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"],
        ["CS211-DS","CS105-PSP","CS225-DBS","CS103-ICO","CS101-ITC"]

      ];

  //** course preference **/

 List<List<String>> cp= [
        ["Sajad","Shakeel","Shuaib","Akbar","Akmal Javed"],
        ["Shuaib","Akbar","Akmal Javed","Sajad","Shakeel"],
        ["Shuaib","Akbar","Akmal Javed","Sajad","Shakeel"],
        ["Sajad","Akmal Javed","Shakeel","Shuaib","Akbar"],
        ["Sajad","Shuaib","Akbar","Akmal Javed","Shakeel"]

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

           
                const SizedBox(
                  height: 50.0,
                ),

           
 

          Flexible(
            child: GridView.builder(
 
              itemCount: 1,
  

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 8.0 / 10.0,
                crossAxisCount: 1,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GridTile(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: const Card(
                      color: Colors.lightBlueAccent,
                      elevation: 50.0,
                      child: Center(
                          child: Text('Courses Allocated Successfully',
                          textAlign: TextAlign.center,
                              style: TextStyle(                                
                                fontWeight: FontWeight.w500,
                                fontSize: 40.0,
                                color: Colors.white,
                              ))),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

 



  /////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///                                   FETCH DETAILS FOR ALGO
  /// 
  /// 
  
  void setDataForAlgo() async{

    List<List<String>> teachersDataByCourses=await getTeachersDataByCourses();
    List<List<String>> coursesDataByTeachers=await getCoursesDataByTeachers();
    for(int i=0;i<teachersDataByCourses.length;i++){
      print('\n teachers data by courses ${teachersDataByCourses[i]}');
    }

    for(int i=0;i<teachersDataByCourses.length;i++){
      print('\n teachers data by courses ${coursesDataByTeachers[i]}');
    }
    List<List<String>> cp=[];
    List<List<String>> tp=[];
    List<String> c=[];
    List<String> t=[];
    for(int i=0;i<teachersDataByCourses.length-1;i++){
      cp.addAll([teachersDataByCourses[i]]);
    }
    c.addAll(teachersDataByCourses[teachersDataByCourses.length-1]);

    for(int i=0;i<coursesDataByTeachers.length-1;i++){
      tp.addAll([coursesDataByTeachers[i]]);
    }

    t.addAll(coursesDataByTeachers[coursesDataByTeachers.length-1]);

    GaleShapely gp=GaleShapely(t,c,tp,cp);
    gp.calculateMatches();
    List<List<String>> pairs=gp.getPairs();
    List<String> teachers=pairs[0];
    List<String> courses=pairs[1];  
   
    List<String> uids=await fetchIdsOfAllTeachers();
 
    for(int i=0;i<teachers.length;i++){  
      final data = {
      "teacher_name":teachers[i],
      "course_code":  courses[i],
      };
      
    print('\n IN THE LOOP OF SETTING ALLOCATED COURSES');
     
     FirebaseFirestore.instance
        .collection('allocated_courses')
        .doc(uids[i])
        .set(data);

    }   


    
  }

    Future<List<String>> fetchIdsOfAllTeachers() async{
           List<String> uids=[];
      var d=  await FirebaseFirestore.instance
        .collection('teacher')
        .get().then((value) => 
        value.docs.forEach((element) {
      DocumentSnapshot docSnap=element;
      String uid=docSnap.id; 
 
       
      uids.add(uid);
      
 

        })
        );

        return uids;
    }

    Future<void> fetchAllocatedCourses() async {
     List<String> t=[];
     List<String> c=[];
      var d=  await FirebaseFirestore.instance
        .collection('allocated_courses')
        .get().then((value) => 
        value.docs.forEach((element) {
      DocumentSnapshot docSnap=element;
      String tName=docSnap['teacher_name']; 
      String cCode=docSnap['course_code'];
       
      t.add(tName);
      c.add(cCode);
 

        })
        );
      

 
 
        setState(() {        
        myList=t;
        myList2=c;
      });




        
  }


  void deleteDocsInAllocatedCourses(){
    
      FirebaseFirestore.instance.collection('allocated_courses').get().then((snapshot) {
  for (DocumentSnapshot ds in snapshot.docs){
    if(ds.exists){
    ds.reference.delete().then((value) => 
    print('deleted '));
    }
  }
  });
  


  return;

  }
  Future<List<List<String>>> getTeachersDataByCourses() async{
    
    List<String> courses= await fetchCourses();     
    List<List<String>> allTeachers=[];
  
  print('\n printing courses in getTeachersdatabycourses $courses');


    for(int i=0;i<courses.length;i++){

      List<String> teachers= await fetchTeachersForCourse(courses[i]);
      if(teachers.isNotEmpty){
      allTeachers.add(teachers);
      }
    }

     print('teachers By Course');
   for(int i=0;i<allTeachers.length;i++){
    print(' ${allTeachers[i]}\n');
   }
    List<String> cCodes=[];
    List<List<String>> myAllTeachers=[];
   for(int i=0;i<allTeachers.length;i++){
    String cCode=allTeachers[i][0];
    allTeachers[i].removeAt(0);
    cCodes.add(cCode);
    myAllTeachers.addAll([allTeachers[i]]);
    
    }
  print('\n printing myAllTeachers\n');
    for(int i=0;i<myAllTeachers.length;i++){
    print(' ${myAllTeachers[i]}\n');
   }

    List<String> allT=[];
    List<Set<String>> tSet=[];
    for(int i=0;i<myAllTeachers.length;i++){
    Set<String> s={};
    for(int j=0;j<myAllTeachers[i].length;j++){
    s.add(myAllTeachers[i][j]);
     
    }

    tSet.add(s);
    for(int j=0;j<myAllTeachers[i].length;j++){
    allT.add(myAllTeachers[i][j]);
     
    }



    }

    print('\n allT');
    for(int i=0;i<allT.length;i++){
        print(allT[i]);
    }

    for(int h=0;h<tSet.length;h++){
    for(int i=0;i<allT.length;i++){
      tSet[h].add(allT[i]);
    }

    }

    //print('\n tSet');
    myAllTeachers=[];
    for(int i=0;i<tSet.length;i++){
      List<String> a=[];
      a.addAll(tSet[i]);
      myAllTeachers.add(a);
      a=[];
      
    }

    




    myAllTeachers.addAll([courses]);

         print('teachers By Course');
   for(int i=0;i<myAllTeachers.length;i++){
    print(' ${myAllTeachers[i]}\n');
   }
    return myAllTeachers;
     
  }


  Future<List<String>> fetchTeachers() async{
    List<String> tea=[];
     
        var doc1=await FirebaseFirestore.instance.collection("teacher")        
        .get().then((value) {
       
        value.docs.forEach((element) { 
          DocumentSnapshot docSnap=element;          
 
          String tName=docSnap['name'];
          tea.add(tName);

        });    
    });
    return tea;

  }

  Future<List<List<String>>> getCoursesDataByTeachers() async {
    List<String> teachers=[];
    List<List<String>> coursesByTeachers=[];
    teachers=await fetchTeachers();
    coursesByTeachers= await fetchCoursesByTeachersDetails();    
    coursesByTeachers.add(teachers);//adding teachers name to coursesByTeachers
    print('Courses By Teachers');
   for(int i=0;i<coursesByTeachers.length;i++){
    print(' ${coursesByTeachers[i]}\n');
   }

   return coursesByTeachers;
  }




    Future<List<String>> fetchCourses() async {
    
    List<String> cList=[];
     
        var teachers = await FirebaseFirestore.instance
        .collection('courses')
        .get()
        .then((value) {
      value.docs.forEach((result) {
        DocumentSnapshot docSnap = result;
        String cCode = docSnap['course_code'];
        cList.add(cCode);
      });
      
    });
   
    return cList;
  }

 

  Future<List<List<String>>> fetchCoursesByTeachersDetails() async{
        List<List<String>> coursesByTeachers=[];
        
        
         
        var doc1=await FirebaseFirestore.instance.collection("teacher")        
        .get().then((value) {
       
        value.docs.forEach((element) { 
          DocumentSnapshot docSnap=element;  
          String courseCode1=docSnap['undergraduate_courses_preferred']['Preference 1'];
          String courseCode2=docSnap['undergraduate_courses_preferred']['Preference 2'];          
          
          coursesByTeachers.add([courseCode1,courseCode2]);

        });    
    });
    List<String> allC=await fetchCourses();
    List<Set<String>> tSet=[];
    for(int i=0;i<coursesByTeachers.length;i++){
    Set<String> s={};
    s.add(coursesByTeachers[i][0]);
    s.add(coursesByTeachers[i][1]);
    tSet.add(s);
 
    }
    for(int h=0;h<tSet.length;h++){
    for(int i=0;i<allC.length;i++){
      tSet[h].add(allC[i]);
    }


    coursesByTeachers=[];
    for(int i=0;i<tSet.length;i++){
      List<String> a=[];
      a.addAll(tSet[i]);
      coursesByTeachers.add(a);
      a=[];      
    }   
  }
  return coursesByTeachers;

  }
   
  Future<List<String>> fetchTeachersForCourse(String cCode) async {
   List<String> pref= await fetchPreferences();
   int noOfPref=pref.length;
  // List<List<String>> f=await fetch1(cCode);
  // List<List<String>> s=await fetch2(cCode);
  List<List<String>> myfs=[];
  for(int i=0;i<noOfPref;i++){
    List<List<String>> fs=await fetch(cCode,pref[i],noOfPref);
    myfs+=fs;
  }
  

   //print('\n printing f=$f');
   print('\n printing myfs=$myfs');
   print('\n ending myfs');
   List<List<String>> allTeachers=myfs;
   if(allTeachers.isEmpty){
    return [];
   }
  int comparisonIndex = 2;

  List<List<dynamic>> teachers = allTeachers
  ..sort((x, y) => (x[comparisonIndex] as dynamic)
    .compareTo((y[comparisonIndex] as dynamic)));

  List<String> teachersByCourse=[];
  teachersByCourse.add(teachers[0][1]);//adding courseCode to list
   for(int i=teachers.length-1;i>=0;i--){
    teachersByCourse.add(teachers[i][3]);//adding teacher name 
   
   }

  // for(int i=0;i<teachers.length;i++){
  //   teachersByCourse.add(teachers[i][3]);//adding teacher name 
   
  //  }

  return teachersByCourse;
}

   

  Future<List<List<String>>> fetch(String cCode,String pref,int noOfPreferences) async{
        List<List<String>> teacherDetails=[];
                
        print('\n in testing');
        var doc1=await FirebaseFirestore.instance.collection("teacher")
        .where('undergraduate_courses_preferred.$pref',isEqualTo: cCode)
        .orderBy('undergraduate_course_preference_scores.scores_for_$pref',descending: true )
        .limit(noOfPreferences)
        .get().then((value) {
       
        value.docs.forEach((element) { 
          DocumentSnapshot docSnap=element;          
          String cCode=docSnap['undergraduate_courses_preferred'][pref];
          int score=docSnap['undergraduate_course_preference_scores']['scores_for_$pref'];     
          String id=docSnap.id;
          String tName=docSnap['name'];
          teacherDetails.add([id,cCode,score.toString(),tName]);

        });    
    });
    return teacherDetails;
  }



 

  Future<List<List<String>>> fetch1(String cCode) async{
        List<List<String>> teacherDetails=[];

        print('\n in testing');
        var doc1=await FirebaseFirestore.instance.collection("teacher")
        .where('undergraduate_courses_preferred.first',isEqualTo: cCode)
        .orderBy('undergraduate_course_preference_scores.scores_for_first',descending: true )
        .limit(2)
        .get().then((value) {
       
        value.docs.forEach((element) { 
          DocumentSnapshot docSnap=element;          
          String cCode=docSnap['undergraduate_courses_preferred']['first'];
          int score=docSnap['undergraduate_course_preference_scores']['scores_for_first'];     
          String id=docSnap.id;
          String tName=docSnap['name'];
          teacherDetails.add([id,cCode,score.toString(),tName]);

        });    
    });
    return teacherDetails;
  }


    Future<List<List<String>>> fetch2(String cCode) async{
        List<List<String>> teacherDetails=[];
        
        print('\n in testing');
        var doc1=await FirebaseFirestore.instance.collection("teacher")
        .where('undergraduate_courses_preferred.second',isEqualTo: cCode)
        .orderBy('undergraduate_course_preference_scores.scores_for_second',descending: true )
        .limit(2)
        .get().then((value) {
       
        value.docs.forEach((element) { 
          DocumentSnapshot docSnap=element;          
          String cCode=docSnap['undergraduate_courses_preferred']['second'];
          int score=docSnap['undergraduate_course_preference_scores']['scores_for_second'];     
          String id=docSnap.id;
          String tName=docSnap['name'];
          teacherDetails.add([id,cCode,score.toString(),tName]);

        });    
    });
    return teacherDetails;

  }

 
   Future<List<String>> fetchPreferences() async {
    int noOfPreferences;
    List<String> itemsPreference=[];
    var records = await FirebaseFirestore.instance
        .collection('preferences')
        .doc('preferences')
        .get()
        .then((value) {
      DocumentSnapshot docSnap = value;
      String noOfPref = docSnap['no_of_preferences'];

      noOfPreferences = int.parse(noOfPref);

      print('no of Pref= $noOfPreferences');

      
        itemsPreference = [];
        for (int i = 0; i < noOfPreferences; i++) {
          int j = i + 1;
          itemsPreference.add("Preference");
          String s = " ";
          s += j.toString();

          itemsPreference[i] += s;
        }
      
    });

    return itemsPreference;
  }

 


}
