import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mazaya/core/fake_data/fake_data.dart';
import 'package:mazaya/core/models/routes/app_routes.dart';

void main() async {
  await GetStorage.init();
  FakeData().checkFirstRun();
  runApp(const MazayaApp());
}

class MazayaApp extends StatefulWidget {
  const MazayaApp({super.key});

  @override
  State<MazayaApp> createState() => _MazayaAppState();
}

class _MazayaAppState extends State<MazayaApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
