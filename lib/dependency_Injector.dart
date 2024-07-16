import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/approve_task_api.dart';
import 'api/dashboard_api.dart';
import 'api/inquire_api.dart';
import 'dependency_Injector.config.dart';
import 'view_model/approve_view_model.dart';
import 'view_model/dash_board_status_view_model.dart';
import 'view_model/dashboard_view_model.dart';
import 'view_model/inquire_view_model.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() => $initGetIt(getIt);

final dio = Dio();
void setupInjector() {
  getIt.registerLazySingleton<ApproveViewModel>(() => ApproveViewModel());
  getIt.registerLazySingleton<InquireViewModel>(() => InquireViewModel());
  getIt.registerLazySingleton<DashboardCountViewModel>(
      () => DashboardCountViewModel());
  getIt.registerLazySingleton<DashboardStatusViewModel>(
      () => DashboardStatusViewModel());
  getIt.registerLazySingleton<DashboardApi>(() =>
      DashboardApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI"));

  dio.interceptors.add(PrettyDioLogger());
// customization
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));
}

@module
abstract class ThirdPartyModule {
  @singleton
  Dio dio(
    @Named("curl") Interceptor curl,
    @Named("prettyLogger") Interceptor prettyLogger,
  ) {
    final dio = Dio();
    dio.interceptors.add(curl);
    dio.interceptors.add(prettyLogger);
    dio.options.headers.addAll({"Content-Type": "application/json"});
    return dio;
  }
}

@module
abstract class InterceptorModule {
  @Named("curl")
  @singleton
  Interceptor curlInterceptor() => CurlLoggerDioInterceptor();

  @Named("prettyLogger")
  @singleton
  Interceptor prettyLoggerInterceptor() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      );
}

@module
abstract class ApiModule {
  @singleton
  DashboardApi dashboardApi(Dio dio) =>
      DashboardApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
  @singleton
  ApproveTaskApi approveApi(Dio dio) =>
      ApproveTaskApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
  @singleton
  InquireApi inquireApi(Dio dio) =>
      InquireApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
}

// @module
// abstract class RepositoryModule {
//   @singleton
//   DashboardRepository dashboardRepository(DashboardApi dashboardApi) =>
//       DashboardRepositoryImpl(dashboardApi);
//   // @singleton
//   // ApproveRepository approveRepository(ApproveApi approveapi) =>
//   //     ApproveRepositoryImpl(approveapi);
//   @singleton
//   InquireRepository inquireRepository(InquireApi inquireapi) =>
//       InquireRepositoryImpl(inquireapi);
// }

@module
abstract class ViewModelModule {
  @singleton
  ApproveViewModel approveViewModel() => ApproveViewModel();
  @singleton
  DashboardCountViewModel dashBoardViewModel() => DashboardCountViewModel();
  @singleton
  DashboardStatusViewModel dashBoardStatusViewModel() =>
      DashboardStatusViewModel();
  @singleton
  InquireViewModel inquireViewModel() => InquireViewModel();
}
