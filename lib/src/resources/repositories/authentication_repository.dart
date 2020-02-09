import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:ng_client/src/models/auth.dart';

class AuthenticationRepository {


  Future<Auth> authenticate({
    @required String username,
    @required String password
  }) async {
    var URL = GlobalConfiguration().get("SERVER_URL") + "/oauth/token";
    var map = new Map<String, dynamic>();
    map['grant_type'] = 'password';
    map['scope'] = 'read write';
    map['username'] = username.trim();
    map['password'] = password.trim();

    var headers = {
      HttpHeaders.authorizationHeader: 'Basic ' + base64.encode(utf8.encode('webapp:123456')),
      HttpHeaders.contentTypeHeader: 'application/x-www-form-urlencoded'
    };

    return http.post(URL, headers: headers, body:map).then((http.Response response) {
      return Auth.fromJson(json.decode(response.body));
    });
  }

  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}