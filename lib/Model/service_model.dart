
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceModel{
   String? name;
   Icon? sicon;
   Color? scolor;
   String? sroute;

   ServiceModel.fromJson(Map<String, dynamic> json) {
      name = json['name'];
      scolor = json['scolor'];
      sicon=json['sicon'];
      sroute=json['sroute'];
   }

   Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['name'] = name;
      data['scolor'] = scolor;
      data['sicon'] = sicon;
       data['sroute']=sroute;

      return data;
   }
}



final babynama='''
[
   {
   "name": "Questions & Answers",
   "sicon": {"icon": "vaccination_icon"},
   "scolor": {"color": "#4CAF50"},
   "sroute": "/q-a"
   },
   {
   "name": "Consult a doctor",
   "sicon": {"icon": "autism_detection_icon"},
   "scolor": {"color": "#2196F3"},
   "sroute": "/consult"
   },
   {
   "name": "White Noise",
   "sicon": {"icon": "emergency_services_icon"},
   "scolor": {"color": "#FF9800"},
   "sroute": "/white-noise"
   },
   {
   "name": "Autism detection test (18m+)",
   "sicon": {"icon": "health_records_icon"},
   "scolor": {"color": "#E91E63"},
   "sroute": "/autism"
   },
   {
      "name": "Track Vaccination",
      "sicon": {"icon": "health_records_icon"},
      "scolor": {"color": "#673AB7"},
      "sroute": "/track-vaccination"
   },
   {
      "name": "Join Community",
      "sicon": {"icon": "health_records_icon"},
      "scolor": {"color": "#FF5722"},
      "sroute": "/community"
   }
]''';
