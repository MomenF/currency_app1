import 'package:currency_app/theme/paths/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/binding/LoginBinding.dart';
import 'on_generate.dart';


Future<void> main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    initialRoute: Routes.login,
    debugShowCheckedModeBanner: false,
    initialBinding: Binding(),
    onGenerateRoute: (settings){
      return RouteGenerator.generateRoute(settings);
    },
    );
  }
}

