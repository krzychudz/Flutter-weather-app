import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_app/keys/secret.dart';

class SecretLoader {
  final String secretPath;

  SecretLoader({this.secretPath});

  Future<Secret> load() {
    return rootBundle.loadStructuredData(this.secretPath, (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}
