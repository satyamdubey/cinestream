import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cine_stream/bindings.dart';
import 'package:cine_stream/views/screens/dashboard.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: ControllersBindings(),
      home: const DashBoard(),
    );
  }
}




