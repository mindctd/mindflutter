import 'package:dashboard/api/approve_task_api.dart';
import 'package:dashboard/model/inquire_model.dart';

abstract class InquireRepository {
  Future<InquireResponse> getResponseInquire();
}

class InquireRepositoryImpl implements InquireRepository {
  final InquireApi responseInquireApi;
  InquireRepositoryImpl(this.responseInquireApi);

  @override
  Future<InquireResponse> getResponseInquire() {
    return responseInquireApi.getInquire().then((value) => value.data);
  }
}
