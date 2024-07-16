import 'package:dashboard/model/dashboard_count_model.dart';
import 'package:dashboard/model/dashboard_order.dart';
import 'package:dashboard/model/dashboard_status_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'dashboard_api.g.dart';

@RestApi()
abstract class DashboardApi {
  factory DashboardApi(Dio dio, {String? baseUrl}) = _DashboardApi;

  @POST("/dashboard/order/count")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<Count>> getCountDashboard(
    @Body() Map<String, dynamic> body,
  );

  @POST("/dashboard/order/status")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<Status2>> getStatusDashboard(
    @Body() Map<String, dynamic> body,
  );
  @POST("/dashboard/order")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<OrderDashboard>> getOrderDashboard(
    @Body() Map<String, dynamic> body,
  );
}
