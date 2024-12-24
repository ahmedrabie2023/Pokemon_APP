import 'package:flutter/material.dart';
import 'package:pokemon_app/services/dio_helper.dart';
import 'package:pokemon_app/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const AppRoot());
}
