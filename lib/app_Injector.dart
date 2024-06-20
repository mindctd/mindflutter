import 'package:dashboard/view_model/approve_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerFactory<ApproveViewModel>(() => ApproveViewModel());
}
