import 'package:dashboard/model/inquire_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../model/approve_task_model.dart';
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

@RestApi()
abstract class InquireApi {
  factory InquireApi(Dio dio, {String? baseUrl}) = _InquireApi;

  @POST('/inquire_tasks/searchInquireApprovalTask')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<InquireResponse>> getInquire();
}
