// To parse this JSON data, do
//
//     final allocationModelClass = allocationModelClassFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllocationModelClass allocationModelClassFromMap(String str) => AllocationModelClass.fromMap(json.decode(str));

String allocationModelClassToMap(AllocationModelClass data) => json.encode(data.toMap());

class AllocationModelClass {
    AllocationModelClass({
        required this.teacherName,
        required this.courseCodeFirst,
        required this.scoresForCourseFirst,
        required this.courseCodeSecond,
        required this.scoresForCourseSecond,
    });

    String teacherName;
    String courseCodeFirst;
    int scoresForCourseFirst;
    String courseCodeSecond;
    int scoresForCourseSecond;

    factory AllocationModelClass.fromMap(Map<String, dynamic> json) => AllocationModelClass(
        teacherName: json["teacher_name"],
        courseCodeFirst: json["course_code_first"],
        scoresForCourseFirst: json["scores_for_course_first"],
        courseCodeSecond: json["course_code_second"],
        scoresForCourseSecond: json["scores_for_course_second"],
    );

    Map<String, dynamic> toMap() => {
        "teacher_name": teacherName,
        "course_code_first": courseCodeFirst,
        "scores_for_course_first": scoresForCourseFirst,
        "course_code_second": courseCodeSecond,
        "scores_for_course_second": scoresForCourseSecond,
    };
}
