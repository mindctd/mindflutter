import 'package:flutter/material.dart';

import '../api/dashboard_api.dart';
import '../dependency_Injector.dart';

class DashboardStatusViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardApi dashboardRepository = getIt();

  Future<void> getDashBoard() async {
    final result = dashboardRepository.getStatusDashboard();
    result.then((value) {
      print(value);
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}