import 'package:dashboard/app_injector.dart';
import 'package:dashboard/model/approve_task_model.dart';

import 'package:dashboard/repository/dashboard/dashboard_repository.dart';
import 'package:dashboard/repository/dashboard/inquire_repository.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../repository/dashboard/approve_repository.dart';

class ApproveSuccess {
  ApproveSuccess();
}

class ApproveError {
  dynamic error;
  ApproveError(this.error);
}

class DashboardCountViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardRepository dashboardRepository = getIt();

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

class ApproveViewModel with ChangeNotifier {
  List<Items>? statusDropdown = [];
  Items? selectStatusDropDown;
  EventBus eventBus = EventBus();
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final ApproveRepository approveRepository = getIt();

  Future<void> getApprove() async {
    final result = approveRepository.getResponseApprove();

    result.then((value) {
      statusDropdown?.addAll(value.data?.items ?? []);

      notifyListeners();
    }, onError: (error) {
      eventBus.fire(ApproveError(error));
      print("Error $error");
    }).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
    notifyListeners();
  }

  // void setDropDown() {
  //   statusDropdown = [
  //     Items(key: "234", value: "123"),
  //     Items(key: "ฟหก", value: "ๆไำไ"),
  //     Items(key: "ๆไำ", value: "ๆไำ"),
  //     Items(key: "ๆไฟหก", value: "ฟหฟหก"),
  //     Items(key: "2ฟหกก34", value: "หฟก")
  //   ];
  // }

  void setDropDown(Items value) {
    selectStatusDropDown = value;
    notifyListeners();
  }
}

class InquireViewModel with ChangeNotifier {
  List<Items> statusDropdown = [];
  EventBus eventBus = EventBus();
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final InquireRepository inquireRepository = getIt();

  Future<void> getInquire() async {
    final result = inquireRepository.getResponseInquire();

    result.then((value) {
      print(value);
    }, onError: (error) {
      eventBus.fire((error));
      print("Error $error");
    }).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}

class DashboardStatusViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final DashboardRepository dashboardRepository = getIt();

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
