class GaleShapely {
  GaleShapely(List<String> t, List<String> c, List<List<String>> tp,
      List<List<String>> cp) {
    N = tp.length;
    engagedCount = 0;
    teacher = t;
    course = c;
    teacherPref = tp;
    coursePref = cp;
    teacherEngaged = [];
    for (var i = 0; i < t.length; i++) {
      teacherEngaged.insert(i, -1);
    }
    //teacherEngaged = bool;
    coursePartner = [];
    for (int i = 0; i < t.length; i++) {
      coursePartner.insert(i, "-1");
    }
    calcMatches();
  }
  int N = 0;
  int engagedCount = 0;
  late List<List<String>> teacherPref;
  late List<List<String>> coursePref;
  late List<String> teacher;
  late List<String> course;
  late List<String> coursePartner;
  late List<int> teacherEngaged;

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///

  void calcMatches() {
    while (engagedCount < N) {
      int free;
      for (free = 0; free < N; free++) {
        if (!(teacherEngaged[free] != -1)) {
          break;
        }
      }

      for (var i = 0; i < N && !(teacherEngaged[free] != -1); i++) {
        int index = courseIndexOf(teacherPref[free][i]);
        if (coursePartner[index].compareTo("-1") == 0) {
          coursePartner[index] = teacher[free];
          teacherEngaged[free] = 1;
          engagedCount = (engagedCount + 1);
        } else {
          String currentPartner = coursePartner[index];
          if (morePreference(currentPartner, teacher[free], index)) {
            coursePartner[index] = teacher[free];
            teacherEngaged[free] = 1;
            teacherEngaged[teacherIndexOf(currentPartner)] = 1;
          }
        }
      }
    }
    printPairs();
  }

  bool morePreference(String curPartner, String newPartner, int index) {
    for (var i = 0; i < N; i++) {
      if (coursePref[index][i].compareTo(newPartner) == 0) {
        return true;
      }
      if (coursePref[index][i].compareTo(curPartner) == 0) {
        return false;
      }
    }
    return false;
  }

  //** getteacherindex **/
  int teacherIndexOf(String str) {
    for (var i = 0; i < N; i++) {
      if (teacher[i].compareTo(str) == 0) {
        return i;
      }
    }
    return -1;
  }

  //** get course index **/
  int courseIndexOf(String str) {
    for (int i = 0; i < N; i++) {
      if (course[i].compareTo(str) == 0) {
        return i;
      }
    }
    return -1;
  }

  //** print pairs **/
  void printPairs() {
    print("Pairs are : ");
    for (int i = 0; i < N; i++) {
      print("${coursePartner[i]} ${course[i]}");
    }
  }

  List<List<String>> getResults() {
    List<List<String>> tl = [];
    tl.add(coursePartner);
    tl.add(course);
    return tl;
  }
}
