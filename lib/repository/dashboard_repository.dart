import 'package:dashboard/api/dashboard_api.dart';
import 'package:dashboard/model/dashboard_count_model.dart';
import 'package:dashboard/model/dashboard_order.dart';
import 'package:dashboard/model/dashboard_status_model.dart';
import 'package:retrofit/retrofit.dart';

abstract class DashboardRepository {
  Future<Count> getCountDashboard(Map<String, dynamic> body);
  Future<Status2> getStatusDashboard(Map<String, dynamic> body);
  Future<OrderDashboard> getOrderDashboard(Map<String, dynamic> body);
}

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardApi responseDashboardApi;
  DashboardRepositoryImpl(this.responseDashboardApi);

  @override
  Future<Count> getCountDashboard(Map<String, dynamic> body) {
    return responseDashboardApi
        .getCountDashboard(body)
        .then((value) => value.data);
  }

  @override
  Future<Status2> getStatusDashboard(Map<String, dynamic> body) {
    return responseDashboardApi
        .getStatusDashboard(body)
        .then((value) => value.data);
  }

  @override
  Future<OrderDashboard> getOrderDashboard(Map<String, dynamic> body) {
    return responseDashboardApi
        .getOrderDashboard(body)
        .then((value) => value.data);
  }
}
