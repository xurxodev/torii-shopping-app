import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class Credentials {
  final String username;
  final String password;

  Credentials(this.username, this.password);

  factory Credentials.fromJson(Map<String, dynamic> jsonMap) {
    return new Credentials(jsonMap["username"], jsonMap["password"]);
  }
}

class ApiCredentialsLoader {
  final String credentialsPath;

  ApiCredentialsLoader(this.credentialsPath);

  Future<Credentials> load() {
    return rootBundle.loadStructuredData<Credentials>(this.credentialsPath,
        (jsonStr) async {
      return Credentials.fromJson(json.decode(jsonStr));
    });
  }
}
