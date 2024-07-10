import 'package:dashboard/dependency_Injector.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/dashboard_api.dart';
import '../model/dashboard_count_model.dart';

class DashboardCountViewModel with ChangeNotifier {
  var baseUrl = "https://ntom-api.intense.co.th/OMNewAPI/";
  Count? count;
  List<Data>? listData;
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

  Future<void> postData() async {
    final url = Uri.parse(
        'https://ntom-api.intense.co.th/OMNewAPI/dashboard/order/count');
    final headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    final body = jsonEncode({
      'user_id': 'string',
      'billing_acc_id': 'string',
      'date': 'string',
      'status_order': 'string',
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        count = Count.fromJson(jsonResponse);
        listData = count?.data ?? [];
      } else {
        print('Failed to post data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
