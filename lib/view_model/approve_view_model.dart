import 'package:dashboard/app_injector.dart';
import 'package:dashboard/repository/dashboard/dashboard_repository.dart';
import 'package:flutter/material.dart';

class ApproveViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardRepository dashboardRepository = getIt();

  Future<void> getDashBoard() async {
    final result = dashboardRepository.getResponseDashboard();
  }
}
