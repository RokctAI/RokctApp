import 'dart:convert';

import 'package:core_sdk/core_sdk.dart';
import '../../models/data/links.dart';
import '../../models/data/career_data.dart';

CareerDataResponse careerDataResponseFromJson(String str) =>
    CareerDataResponse.fromJson(json.decode(str));

class CareerDataResponse {
  List<CareerData>? data;
  Links? links;
  Meta? meta;

  CareerDataResponse({this.data, this.links, this.meta});

  factory CareerDataResponse.fromJson(Map<String, dynamic> json) {
    return CareerDataResponse(
      data: json["data"] == null
          ? []
          : List<CareerData>.from(
              json["data"].map((x) => CareerData.fromJson(x)),
            ),

      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }
}
