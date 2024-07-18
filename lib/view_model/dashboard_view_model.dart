import 'package:dashboard/dependency_Injector.dart';
import 'package:dashboard/model/dashboard_order.dart';
import 'package:dashboard/model/dashboard_status_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/dashboard_api.dart';
import '../model/dashboard_count_model.dart';

class DashboardCountViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";
  NewSum? dataOrder;
  Data? dataCount;
  Count? count;
  Items? statusItems;
  Status2? status2;
  List<Items>? listItems;
  List<Data>? listData;
  // List<Data>? listDataStatus;
  Summary? summary;
  final DashboardApi dashboardRepository = getIt();
  final DashboardApi dashboardStatusRepository = getIt();
  // final DashboardApi dashboardRepository = getIt();

  // Future<void> getDashBoard() async {
  //   final result = dashboardRepository.getCountDashboard();
  //   result.then((value) {
  //     print(value);
  //   }, onError: (error) {}).onError(
  //     (error, stackTrace) {
  //       print("error $error");
  //     },
  //   );
  // }

  // Future<void> postData() async {
  //   final url = Uri.parse(
  //       'https://ntom-api.intense.co.th/OMNewAPI/dashboard/order/count');
  //   final headers = {
  //     'accept': '*/*',
  //     'Content-Type': 'application/json',
  //   };
  //   final body = jsonEncode({
  //     'user_id': 'string',
  //     'billing_acc_id': 'string',
  //     'date': 'string',
  //     'status_order': 'string',
  //   });

  //   try {
  //     final response = await http.post(url, headers: headers, body: body);

  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       count = Count.fromJson(jsonResponse);
  //       listData = count?.data ?? [];
  //       notifyListeners();
  //     } else {
  //       print('Failed to post data: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  // Future<void> getDashBoard() async {
  //   Map<String, dynamic> body = {
  //     "user_id": "",
  //     "billing_acc_id": "",
  //     "date": "",
  //     "status_order": "0001",
  //     "page": 1,
  //     "page_size": 10
  //   };
  //   final result = dashboardStatusRepository.getStatusDashboard(body);
  //   result.then((value) {
  //     // listData = value.data.print(value);
  //   }, onError: (error) {}).onError(
  //     (error, stackTrace) {
  //       print("error $error");
  //     },
  //   );
  // }

  // Status2.fromJson({
  //   "id": "22121912596",
  //   "order_type_lkp": "1",
  //   "order_type_lkp_name": "New",
  //   "order_sub_type_lkp": "0",
  //   "order_sub_type_lkp_name": "Null",
  //   " customer_full_name": " ",
  //   "customer_id": "B34B9104273960DCE05400144F67BEE6",
  //   "ba_id": "E75CA99242E027B0E05400144F67BEE6",
  //   "new_status": 1,
  //   "provisioning": 0,
  //   "billing": 0,
  //   "complete": 0,
  //   "total_items": 1,
  //   "new_status_per": 100,
  //   " provisioning_per": 0,
  //   "billing_per": 0,
  //   " complete_per": 0,
  //   "result_count": 7681
  // });

  Future<void> getOrderDashboard() async {
    Map<String, dynamic> body = {
      "user_id": "wom112",
      "billing_acct_number": "1208108003",
      "month": "12",
      "year": "2022"
    };
    final result = dashboardStatusRepository.getOrderDashboard(body);
    result.then((value) {
      summary = value.data.data?.summary;
      dataOrder = summary?.newSum;
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }

  Future<void> getCountDashboard() async {
    Map<String, dynamic> body = {
      "user_id": "",
      "billing_acc_id": "9200264443",
      "date": "",
      "status_order": "0001"
    };
    final result = dashboardRepository.getCountDashboard(body);
    result.then((value) {
      count = value.data;
      notifyListeners();
    }, onError: (error) {}).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }

  Future<void> getStatusDashboard() async {
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
      status2 = value.data;
      listItems = status2?.data?.items;
      notifyListeners();
    }, onError: (error) {
      print("error $error");
    }).onError(
      (error, stackTrace) {
        print("error $error");
      },
    );
  }
}
