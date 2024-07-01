import 'package:dashboard/model/approve_task%20_model.dart';

import '../../api/approve_task_api.dart';

abstract class ApproveRepository {
  Future<ApproveResponse> getResponseApprove();
}

class ApproveRepositoryImpl implements ApproveRepository {
  final ApproveApi responseApproveApi;
  ApproveRepositoryImpl(this.responseApproveApi);

  @override
  Future<ApproveResponse> getResponseApprove() {
    return responseApproveApi.getApprove().then((value) => value.data);
  }
}
