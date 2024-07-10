import 'package:dashboard/api/approve_task_api.dart';
import 'package:dashboard/model/approve_task_model.dart';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

import '../dependency_Injector.dart';

class ApproveSuccess {
  ApproveSuccess();
}

class ApproveError {
  dynamic error;
  ApproveError(this.error);
}

class ApproveViewModel with ChangeNotifier {
  List<Items>? statusDropdown = [];
  Items? selectStatusDropDown;
  EventBus eventBus = EventBus();
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final ApproveTaskApi approveRepository = getIt();

  Future<void> getApprove() async {
    final result = approveRepository.getApprove();

    result.then((value) {
      statusDropdown?.addAll(value.data.data?.items ?? []);

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
