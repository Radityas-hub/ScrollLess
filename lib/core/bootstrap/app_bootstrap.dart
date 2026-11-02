import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:scrollless/core/models/limit_rule.dart';
import 'package:scrollless/core/models/violation.dart';
import 'package:scrollless/core/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';

const backgroundLimitCheckTask = 'background-limit-check';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    _registerHiveAdapters();

    if (task == backgroundLimitCheckTask) {
      // Integrate the tracking repository here once limit evaluation is ready.
      // WorkManager is intentionally used as an eventual check, not a timer.
      await NotificationService.instance.initialize();
    }
    return true;
  });
}

class AppBootstrap {
  const AppBootstrap._();

  static Future<void> initialize() async {
    await Hive.initFlutter();
    _registerHiveAdapters();

    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await NotificationService.instance.initialize();
      await Workmanager().initialize(callbackDispatcher);
    }
  }
}

void _registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(LimitRuleAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(ViolationAdapter());
  }
}
