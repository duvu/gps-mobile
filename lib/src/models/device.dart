import 'dart:core';
class Device {
  int _id;
  String _name;
  String _description;
  String _imei;
  DateTime _expiredDate;

  static Future<Device> fromJson(decode) {}
}