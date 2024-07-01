// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/approve_task_api.dart' as _i6;
import 'api/dashboard_api.dart' as _i5;
import 'app_Injector.dart' as _i9;
import 'repository/dashboard/approve_repository.dart' as _i7;
import 'repository/dashboard/dashboard_repository.dart' as _i8;
import 'view_model/approve_view_model.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final viewModelModule = _$ViewModelModule();
  final interceptorModule = _$InterceptorModule();
  final thirdPartyModule = _$ThirdPartyModule();
  final apiModule = _$ApiModule();
  final repositoryModule = _$RepositoryModule();
  gh.factory<_i3.ApproveViewModel>(() => viewModelModule.approveViewModel());
  gh.factory<_i3.DashboardViewModel>(
      () => viewModelModule.dashBoardViewModel());
  gh.singleton<_i4.Interceptor>(
    () => interceptorModule.prettyLoggerInterceptor(),
    instanceName: 'prettyLogger',
  );
  gh.singleton<_i4.Interceptor>(
    () => interceptorModule.curlInterceptor(),
    instanceName: 'curl',
  );
  gh.singleton<_i4.Dio>(() => thirdPartyModule.dio(
        gh<_i4.Interceptor>(instanceName: 'curl'),
        gh<_i4.Interceptor>(instanceName: 'prettyLogger'),
      ));
  gh.singleton<_i5.DashboardApi>(() => apiModule.dashboardApi(gh<_i4.Dio>()));
  gh.singleton<_i6.ApproveApi>(() => apiModule.approveApi(gh<_i4.Dio>()));
  gh.singleton<_i7.ApproveRepository>(
      () => repositoryModule.approveRepository(gh<_i6.ApproveApi>()));
  gh.singleton<_i8.DashboardRepository>(
      () => repositoryModule.dashboardRepository(gh<_i5.DashboardApi>()));
  return getIt;
}

class _$ViewModelModule extends _i9.ViewModelModule {}

class _$InterceptorModule extends _i9.InterceptorModule {}

class _$ThirdPartyModule extends _i9.ThirdPartyModule {}

class _$ApiModule extends _i9.ApiModule {}

class _$RepositoryModule extends _i9.RepositoryModule {}
