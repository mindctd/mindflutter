import 'package:dashboard/model/dashboard_count_model.dart';
import 'package:dashboard/model/dashboard_model.dart';
import 'package:dashboard/model/dashboard_status_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'dashboard_api.g.dart';

@RestApi()
abstract class DashboardApi {
  factory DashboardApi(Dio dio, {String? baseUrl}) = _DashboardApi;

  @POST("/dashboard/order/count")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<Count>> getCountDashboard();

  @POST("/dashboard/order/status")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<Status2>> getStatusDashboard();
}
