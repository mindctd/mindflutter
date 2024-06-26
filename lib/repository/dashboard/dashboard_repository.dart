import 'package:dashboard/api/dashboard_api.dart';
import 'package:dashboard/model/dashboard_model.dart';

abstract class DashboardRepository {
  Future<ResponseDashboard> getResponseDashboard();
}

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardApi responseDashboardApi;
  DashboardRepositoryImpl(this.responseDashboardApi);

  @override
  Future<ResponseDashboard> getResponseDashboard() {
    return responseDashboardApi.getDashboard().then((value) => value.data);
  }
}
