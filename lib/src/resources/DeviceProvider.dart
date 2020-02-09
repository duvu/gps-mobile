import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/device.dart';
class DeviceProvider {
  Client client = Client();

  Future<Device> fetchDeviceList() async {
    print("starting to load Device ...");
    final response = await client.get("");
    if (response.statusCode == 200) {
      return Device.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load devices');
    }
  }
}