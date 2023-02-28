// To parse this JSON data, do
//
//     final teacher = teacherFromMap(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

Teacher teacherFromMap(String str) => Teacher.fromMap(json.decode(str));

String teacherToMap(Teacher data) => json.encode(data.toMap());

class Teacher {
    Teacher({
        required this.postgraduateCoursePreferenceScores,
        required this.postgraduateCoursesPreferred,
        required this.undergraduateCoursePreferenceScores,
        required this.undergraduateCoursesPreferred,
    });

    GraduateCoursePreferenceScores postgraduateCoursePreferenceScores;
    GraduateCoursesPreferred postgraduateCoursesPreferred;
    GraduateCoursePreferenceScores undergraduateCoursePreferenceScores;
    GraduateCoursesPreferred undergraduateCoursesPreferred;

    factory Teacher.fromMap(Map<String, dynamic> json) => Teacher(
        postgraduateCoursePreferenceScores: GraduateCoursePreferenceScores.fromMap(json["postgraduate_course_preference_scores"]),
        postgraduateCoursesPreferred: GraduateCoursesPreferred.fromMap(json["postgraduate_courses_preferred"]),
        undergraduateCoursePreferenceScores: GraduateCoursePreferenceScores.fromMap(json["undergraduate_course_preference_scores"]),
        undergraduateCoursesPreferred: GraduateCoursesPreferred.fromMap(json["undergraduate_courses_preferred"]),
    );

    Map<String, dynamic> toMap() => {
        "postgraduate_course_preference_scores": postgraduateCoursePreferenceScores.toMap(),
        "postgraduate_courses_preferred": postgraduateCoursesPreferred.toMap(),
        "undergraduate_course_preference_scores": undergraduateCoursePreferenceScores.toMap(),
        "undergraduate_courses_preferred": undergraduateCoursesPreferred.toMap(),
    };
}

class GraduateCoursePreferenceScores {
    GraduateCoursePreferenceScores({
        required this.cs201,
        required this.cs202,
        required this.cs203,
        required this.cs204,
    });

    String cs201;
    String cs202;
    String cs203;
    String cs204;

    factory GraduateCoursePreferenceScores.fromMap(Map<String, dynamic> json) => GraduateCoursePreferenceScores(
        cs201: json["CS201"],
        cs202: json["CS202"],
        cs203: json["CS203"],
        cs204: json["CS204"],
    );

    Map<String, dynamic> toMap() => {
        "CS201": cs201,
        "CS202": cs202,
        "CS203": cs203,
        "CS204": cs204,
    };
}

class GraduateCoursesPreferred {
    GraduateCoursesPreferred({
        required this.first,
        required this.second,
        required this.third,
        required this.fourth,
    });

    String first;
    String second;
    String third;
    String fourth;

    factory GraduateCoursesPreferred.fromMap(Map<String, dynamic> json) => GraduateCoursesPreferred(
        first: json["first"],
        second: json["second"],
        third: json["third"],
        fourth: json["fourth"],
    );

    Map<String, dynamic> toMap() => {
        "first": first,
        "second": second,
        "third": third,
        "fourth": fourth,
    };
}
