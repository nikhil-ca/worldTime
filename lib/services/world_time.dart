import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;    //location name for UI
  String time = '';        //time in that location
  String flag;        //url to asset of icon
  String url;         //location url for API endpoint
  bool isDayTime = true;

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try{

      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data =jsonDecode(response.body);

      String dateTime = data['utc_datetime'];
      String offset_hour = data['utc_offset'].substring(0,3);
      String offset_minute = data['utc_offset'].substring(4,6);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset_hour)));
      now = now.add(Duration(minutes: int.parse(offset_minute)));

      isDayTime = now.hour >= 6 && now.hour <=20 ? true:false;

      time = DateFormat.jm().format(now);  //set time property

    }

    catch(e) {
      print(e);
      time = 'couldn\'t get time';
    }


  }
}