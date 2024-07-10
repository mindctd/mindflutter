import 'package:dashboard/api/inquire_api.dart';
import 'package:dashboard/dependency_Injector.dart';
import 'package:dashboard/model/inquire_model.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class InquireViewModel with ChangeNotifier {
  List<Items> statusDropdown = [];
  EventBus eventBus = EventBus();
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";

  final InquireApi inquireRepository = getIt();

  Future<void> getInquire() async {
    final result = inquireRepository.getInquire();

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
