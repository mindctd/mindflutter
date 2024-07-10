import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/approve_task_model.dart';

part 'approve_task_api.g.dart';

@RestApi()
abstract class ApproveTaskApi {
  factory ApproveTaskApi(Dio dio, {String? baseUrl}) = _ApproveTaskApi;

  @GET("/dropdown/approval_task_status")
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<ApproveResponse>> getApprove();
}
