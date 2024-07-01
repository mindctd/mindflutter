import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/approve_task _model.dart';

part 'approve_task_api.g.dart';

@RestApi()
abstract class ApproveApi {
  factory ApproveApi(Dio dio, {String? baseUrl}) = _ApproveApi;

  @GET("/dropdown/approval_task_status")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<ApproveResponse>> getApprove();
}
