// To parse this JSON data, do
//
//     final tableBookingResponse = tableBookingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:rokctapp/manager/infrastructure/models/data/table_bookings_data.dart';

TableBookingResponse tableBookingResponseFromJson(String str) =>
    TableBookingResponse.fromJson(json.decode(str));

String tableBookingResponseToJson(TableBookingResponse data) =>
    json.encode(data.toJson());

class TableBookingResponse {
  List<TableBookingData> data;

  TableBookingResponse({required this.data});

  factory TableBookingResponse.fromJson(Map<String, Dyn> json) =>
      TableBookingResponse(
        data: List<TableBookingData>.from(
          json["data"].map((x) => TableBookingData.fromJson(x)),
        ),
      );

  Map<String, Dyn> toJson() => {
    "data": List<Dyn>.from(data.map((x) => x.toJson())),
  };
}

typedef Dyn = dynamic;
