import 'package:dashboard/app_Injector.dart';
import 'package:dashboard/screens.home/Task.dart';
import 'package:dashboard/screens.home/approve_task_page.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/screens.home/home.dart';
import 'package:dashboard/screens.home/home2.dart';
import 'package:dashboard/screens.home/approve_task_page.dart';
import 'package:dashboard/screens.home/approve_table.dart';

void main() {
  setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Status : New',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ApproveTable(),
    );
  }
}
