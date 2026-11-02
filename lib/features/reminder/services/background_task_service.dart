import 'package:scrollless/core/bootstrap/app_bootstrap.dart';
import 'package:workmanager/workmanager.dart';

class BackgroundTaskService {
  const BackgroundTaskService._();

  static Future<void> registerLimitCheck() {
    return Workmanager().registerPeriodicTask(
      'scrollless-periodic-limit-check',
      backgroundLimitCheckTask,
      frequency: const Duration(minutes: 15),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.update,
    );
  }
}
