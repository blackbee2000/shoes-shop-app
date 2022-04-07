import 'package:flutter/material.dart';

class FlavorValues {
  FlavorValues({
    required this.baseUrl,
  });
  final String baseUrl;
  //Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final FlavorValues values;

  static late FlavorConfig _instance;

  factory FlavorConfig(
      {Color color: Colors.blue, required FlavorValues values}) {
    _instance = FlavorConfig._internal(values);
    return _instance;
  }

  FlavorConfig._internal(this.values);
  static FlavorConfig get instance {
    return _instance;
  }
}
