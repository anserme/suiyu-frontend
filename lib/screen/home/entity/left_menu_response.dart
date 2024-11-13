import 'dart:convert';

LeftMenuResponse leftMenuResponseFromJson(String str) => LeftMenuResponse.fromJson(json.decode(str));

String leftMenuResponseToJson(LeftMenuResponse data) => json.encode(data.toJson());

class LeftMenuResponse {
  String icon;
  String itemName;
  bool isSelect;

  LeftMenuResponse({
    required this.icon,
    required this.itemName,
    this.isSelect = false,
  });

  factory LeftMenuResponse.fromJson(Map<String, dynamic> json) => LeftMenuResponse(
    icon: json["icon"],
    itemName: json["itemName"],
    isSelect: json["isSelect"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "itemName": itemName,
    "isSelect": isSelect,
  };
}