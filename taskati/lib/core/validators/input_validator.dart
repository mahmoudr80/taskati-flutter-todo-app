import 'package:flutter/material.dart';

class InputValidator{
  static String? titleTask(String?value){
    if(value==null||value==""){
      return "title is required";
    }
    else if(value.length<=4){
      return "title should be more than 4 characters";
    }
    else{
      return null;
    }
  }
  static String? descriptionTask(String?value){
    if(value==null||value==""){
      return "description is required";
    }
    else if(value.length<=10){
      return "title should be more than 10 characters";
    }
    else{
      return null;
    }
  }
 static String?startTime(String?value){
    return value==null||value==""?"start time is required":null;
  }
  static String?endTime(String?value,TimeOfDay ?start,TimeOfDay ?end){
    if(start!=null&&end!=null){
      return start.isAfter(end)?"end time not before start time":null;
    }
    if(value==null||value ==""){
      return "end time is required";
    }

    return null;
  }
  }
