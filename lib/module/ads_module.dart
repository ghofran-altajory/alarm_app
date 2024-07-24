import 'package:flutter/material.dart';

class adsModule {
  String? title;
  String? suTitle;
  String? place;
  String? time;
  String? cost;
 // IconData icon;

  adsModule({
    this.title,
    this.suTitle,
    this.place,
    this.time,
    this.cost,
   // required this.icon,
  });
  adsModule.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    suTitle = json['subTitle'] ?? "";
   place = json['place'] ?? "";
   cost = json['cost'] ?? "";
    time = json['time'] ?? "";
  }
}
