import 'package:dashboard/api/dashboard_api.dart';
import 'package:dashboard/model/dashboard_count_model.dart';
import 'package:dashboard/model/dashboard_model.dart';
import 'package:dashboard/model/dashboard_status_model.dart';

abstract class DashboardRepository {
  Future<Count> getCountDashboard();
  Future<Status2> getStatusDashboard();
}

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardApi responseDashboardApi;
  DashboardRepositoryImpl(this.responseDashboardApi);

  @override
  Future<Count> getCountDashboard() {
    return responseDashboardApi.getCountDashboard().then((value) => value.data);
  }

  @override
  Future<Status2> getStatusDashboard() {
    return responseDashboardApi
        .getStatusDashboard()
        .then((value) => value.data);
  }
}
