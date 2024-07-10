import 'package:dashboard/model/inquire_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'inquire_api.g.dart';

@RestApi()
abstract class InquireApi {
  factory InquireApi(Dio dio, {String? baseUrl}) = _InquireApi;

  @POST('/inquire_tasks/searchInquireApprovalTask')
  @Headers(<String, dynamic>{
    "Accept": "application/json",
  })
  Future<HttpResponse<InquireResponse>> getInquire();
}