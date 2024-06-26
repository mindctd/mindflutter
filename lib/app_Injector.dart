import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dashboard/api/dashboard_api.dart';
import 'package:dashboard/repository/dashboard/dashboard_repository.dart';
import 'package:dashboard/view_model/approve_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'app_injector.config.dart';

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
  DashboardApi settingApi(Dio dio) =>
      DashboardApi(dio, baseUrl: "https://ntom-api.intense.co.th/OMNewAPI");
}

@module
abstract class RepositoryModule {
  @singleton
  DashboardRepository dashboardRepository(DashboardApi dashboardApi) =>
      DashboardRepositoryImpl(dashboardApi);
}

@module
abstract class ViewModelModule {
  ApproveViewModel approveViewModel() => ApproveViewModel();
}
