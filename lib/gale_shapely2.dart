//import 'package:dart_application_2/dart_application_2.dart' as dart_application_2;

void main(List<String> arguments) {
  A a1 = A(5);
  a1.myPrint();
  print("hello");
  List<String> m=['M1','M2'];
  List<String> w=['W1','W2'];
  List<List<String>> mp=[
    ['W1','W2'],
    ['W2','W1'],
  ];
  List<List<String>> wp=[
    ['M2','M1'],
    ['M1','M2'],
  ];

  //GaleShapely gp=GaleShapely(m, w, mp, wp);
  //gp.calculateMatches();

  // List<String> t = ["M1", "M2", "M3", "M4", "M5"];
  List<String> t=["Sajad","Shakeel","Shuaib","Akbar","Akmal Javed"];
  // List<String> c = ["W1", "W2", "W3", "W4", "W5"];
  List<String> c=["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"];
  // List<List<String>> tp = [["W5", "W2", "W3", "W4", "W1"], 
  //                        ["W2", "W5", "W1", "W3", "W4"], 
  //                        ["W4", "W3", "W2", "W1", "W5"], 
  //                        ["W1", "W2", "W3", "W4", "W5"],
  //                        ["W5", "W2", "W3", "W4", "W1"]];
          List<List<String>> tp=[
        ["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"],
        ["CS211-DS","CS105-PSP","CS225-DBS","CS103-ICO","CS101-ITC"],
        ["CS103-ICO","CS105-PSP","CS225-DBS","CS101-ITC","CS211-DS"],
        ["CS103-ICO","CS101-ITC","CS211-DS","CS105-PSP","CS225-DBS"],
        ["CS211-DS","CS105-PSP","CS225-DBS","CS103-ICO","CS101-ITC"]

        ];                       



  // List<List<String>> cp = [["M5", "M3", "M4", "M1", "M2"], 
  //                        ["M1", "M2", "M3", "M5", "M4"], 
  //                        ["M4", "M5", "M3", "M2", "M1"],
  //                        ["M5", "M2", "M1", "M4", "M3"], 
  //                        ["M2", "M1", "M4", "M3", "M5"]];

           List<List<String>> cp= [
        ["Akbar","Shakeel","Sajad","Akbar","Akmal Javed"],
        ["Shakeel","Akbar","Akmal Javed","Sajad","Shuaib"],
        ["Shuaib","Shakeel","Akmal Javed","Sajad","Akbar"],
        ["Akmal Javed","Sajad","Shakeel","Shuaib","Akbar"],
        ["Sajad","Shuaib","Akbar","Akmal Javed","Shakeel"]

        ];                       

  GaleShapely gp=GaleShapely(t, c, tp, cp);
  gp.calculateMatches();                                              

}

class A {
  late int a;
  late List<List<int>> b;
  A(this.a) {
    b = [
      [1, 2, 3],
      [4, 5, 6]
    ];
  }

  void myPrint() {
    print('length=${b.length} length');
  }
}

class GaleShapely {
  late int N;
  late int engagedCount;
  late List<List<String>> menPref;
  late List<List<String>> womenPref;
  late List<String> men;
  late List<String> women;
  late List<String> womenPartner;
  late List<bool> menEngaged;

  GaleShapely(List<String> m, List<String> w, List<List<String>> mp,
      List<List<String>> wp) {
    engagedCount=0;    
    N = mp.length;
    men = m;
    women = w;
    menPref = mp;
    womenPref = wp;
    menEngaged = List<bool>.filled(N, false);
    womenPartner = List<String>.filled(N, '');
  }

  void calculateMatches() {
    while (engagedCount < N) {
      int free;
      for (free = 0; free < N; free++) {
        if (!menEngaged[free]) {
          break;
        }
      }

      for (int i = 0; i < N && !menEngaged[free]; i++) {
        int index = womenIndexOf(menPref[free][i]);
        if (womenPartner[index] == '') {
          womenPartner[index] = men[free];
          menEngaged[free] = true;
          engagedCount++;
        } else {
          String currentPartner = womenPartner[index];
          if (morePreference(currentPartner, men[free], index)) {
            womenPartner[index] = men[free];
            menEngaged[free] = true;
            menEngaged[menIndexOf(currentPartner)] = false;
          }
        }
      }
    }
    printCouples();
  }

  //** function to check if women prefers new partner over old assigned partner **/
  bool morePreference(String curPartner, String newPartner, int index) {
    for (int i = 0; i < N; i++) {
      if (womenPref[index][i] == (newPartner)) {
        return true;
      }
      if (womenPref[index][i] == (curPartner)) {
        return false;
      }
    }
    return false;
  }

  //** get men index **/
  int menIndexOf(String str) {
    for (int i = 0; i < N; i++) {
      if (men[i] == (str)) {
        return i;
      }
    }
    return -1;
  }

  //** get women index **/
  int womenIndexOf(String str) {
    for (int i = 0; i < N; i++) {
      if (women[i] == (str)) {
        return i;
      }
    }
    return -1;
  }

  //** print couples **/
  void printCouples() {
    print("Couples are : ");
    for (int i = 0; i < N; i++) {
      print("${womenPartner[i]} ${women[i]}");
    }
  }

  //** Get Pairs **/
  List<List<String>> getPairs() {
    List<List<String>> pairs=[];
    pairs.add(womenPartner);
    pairs.add(women); 
    return pairs;
  }
}
