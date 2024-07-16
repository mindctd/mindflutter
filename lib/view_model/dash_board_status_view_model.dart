import 'package:dashboard/model/dashboard_model.dart';
import 'package:dashboard/model/dashboard_status_model.dart';
import 'package:flutter/material.dart';

import '../api/dashboard_api.dart';
import '../dependency_Injector.dart';

class DashboardStatusViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";
  List<Data>? listData;
  final DashboardApi dashboardRepository = getIt();

  Future<void> getDashBoard() async {
    Map<String, dynamic> body = {
      "user_id": "",
      "billing_acc_id": "",
      "date": "",
      "status_order": "0001",
      "page": 1,
      "page_size": 10
    };
    final result = dashboardRepository.getStatusDashboard(body);
    result.then((value) {
      print(value);
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}
// class DashboardStatusViewModel with ChangeNotifier {
//   var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

//   final DashboardApi dashboardRepository = getIt();

//   Status2? statusData;

//   Future<void> getDashBoard() async {
//     try {
//       final response = await dashboardRepository.getStatusDashboard();
//       statusData = response.data;
//       notifyListeners();
//     } catch (error) {
//       print("error $error");
//     }
//   }
// }
