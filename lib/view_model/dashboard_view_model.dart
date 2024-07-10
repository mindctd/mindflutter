import 'package:dashboard/dependency_Injector.dart';
import 'package:flutter/material.dart';

import '../api/dashboard_api.dart';

class DashboardCountViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardApi dashboardRepository = getIt();

  Future<void> getDashBoard() async {
    final result = dashboardRepository.getCountDashboard();
    result.then((value) {
      print(value);
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}