class Secret {
  final String key;
  Secret({this.key = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(key: jsonMap["WEATHER_APP_API_KEY"]);
  }
}
