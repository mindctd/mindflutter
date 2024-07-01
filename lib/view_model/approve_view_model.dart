import 'package:dashboard/app_injector.dart';

import 'package:dashboard/repository/dashboard/dashboard_repository.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../model/Success.dart';
import '../repository/dashboard/approve_repository.dart';

class ApproveSuccess {
  ApproveSuccess();
}

class ApproveError {
  dynamic error;
  ApproveError(this.error);
}

class DashboardViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardRepository dashboardRepository = getIt();

  Future<void> getDashBoard() async {
    final result = dashboardRepository.getResponseDashboard();
    result.then((value) {
      print(value);
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}

class ApproveViewModel with ChangeNotifier {
  List<Items> statusDropdown = [];
  EventBus eventBus = EventBus();
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final ApproveRepository approveRepository = getIt();

  Future<void> getApprove() async {
    final result = approveRepository.getResponseApprove();

    result.then((value) {
      print(value);
    }, onError: (error) {
      eventBus.fire(ApproveError(error));
      print("Error $error");
    }).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }

  void setDropDown() {
    statusDropdown = [
      Items(key: "234", value: "123"),
      Items(key: "ฟหก", value: "ๆไำไ"),
      Items(key: "ๆไำ", value: "ๆไำ"),
      Items(key: "ๆไฟหก", value: "ฟหฟหก"),
      Items(key: "2ฟหกก34", value: "หฟก")
    ];
  }
}
