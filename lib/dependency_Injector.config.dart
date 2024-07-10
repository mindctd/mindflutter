// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'api/approve_task_api.dart' as _i9;
import 'api/dashboard_api.dart' as _i8;
import 'api/inquire_api.dart' as _i10;
import 'dependency_Injector.dart' as _i11;
import 'view_model/approve_view_model.dart' as _i3;
import 'view_model/dash_board_status_view_model.dart' as _i5;
import 'view_model/dashboard_view_model.dart' as _i4;
import 'view_model/inquire_view_model.dart' as _i6;

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
  gh.singleton<_i3.ApproveViewModel>(() => viewModelModule.approveViewModel());
  gh.singleton<_i4.DashboardCountViewModel>(
      () => viewModelModule.dashBoardViewModel());
  gh.singleton<_i5.DashboardStatusViewModel>(
      () => viewModelModule.dashBoardStatusViewModel());
  gh.singleton<_i6.InquireViewModel>(() => viewModelModule.inquireViewModel());
  gh.singleton<_i7.Interceptor>(
    () => interceptorModule.prettyLoggerInterceptor(),
    instanceName: 'prettyLogger',
  );
  gh.singleton<_i7.Interceptor>(
    () => interceptorModule.curlInterceptor(),
    instanceName: 'curl',
  );
  gh.singleton<_i7.Dio>(() => thirdPartyModule.dio(
        gh<_i7.Interceptor>(instanceName: 'curl'),
        gh<_i7.Interceptor>(instanceName: 'prettyLogger'),
      ));
  gh.singleton<_i8.DashboardApi>(() => apiModule.dashboardApi(gh<_i7.Dio>()));
  gh.singleton<_i9.ApproveTaskApi>(() => apiModule.approveApi(gh<_i7.Dio>()));
  gh.singleton<_i10.InquireApi>(() => apiModule.inquireApi(gh<_i7.Dio>()));
  return getIt;
}

class _$ViewModelModule extends _i11.ViewModelModule {}

class _$InterceptorModule extends _i11.InterceptorModule {}

class _$ThirdPartyModule extends _i11.ThirdPartyModule {}

class _$ApiModule extends _i11.ApiModule {}
