import 'package:dashboard/model/dashboard_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'dashboard_api.g.dart';

@RestApi()
abstract class DashboardApi {
  factory DashboardApi(Dio dio, {String? baseUrl}) = _DashboardApi;

  @GET("/dashboard/order/count")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<ResponseDashboard>> getDashboard();
}
