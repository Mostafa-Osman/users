import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:users/my_app.dart';

import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    initServiceLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyUsersApp());
}
