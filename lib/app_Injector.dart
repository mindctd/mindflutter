import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dashboard/view_model/approve_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'api/approve_task_api.dart';
import 'api/dashboard_api.dart';
import 'app_Injector.config.dart';
import 'repository/dashboard/approve_repository.dart';
import 'repository/dashboard/dashboard_repository.dart';

final getIt = GetIt.instance;
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
GetIt configureDependencies() => $initGetIt(getIt);

// void setupInjector() {
//   getIt.registerFactory<ApproveViewModel>(() => ApproveViewModel());
//   getIt.registerFactory<ResponseDashboard>(() => ResponseDashboard());
// }
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
  ApproveApi approveApi(Dio dio) =>
      ApproveApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
  @singleton
  InquireApi inquireApi(Dio dio) =>
      InquireApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
}

@module
abstract class RepositoryModule {
  @singleton
  DashboardRepository dashboardRepository(DashboardApi dashboardApi) =>
      DashboardRepositoryImpl(dashboardApi);
  @singleton
  ApproveRepository approveRepository(ApproveApi approveapi) =>
      ApproveRepositoryImpl(approveapi);
}

@module
abstract class ViewModelModule {
  ApproveViewModel approveViewModel() => ApproveViewModel();
  DashboardViewModel dashBoardViewModel() => DashboardViewModel();
}
