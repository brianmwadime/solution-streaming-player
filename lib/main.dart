import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/app_export.dart';
import 'presentation/player_screen/controller/player_controller.dart';

void main() {
  Get.put(EnvConfig());

  Get.find<EnvConfig>().initConfig();
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  Get.put(PrefUtils());
  Get.put(PlayerController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppLocalization(),
        locale: Get.deviceLocale,
        fallbackLocale: Locale('en', 'US'),
        title: 'Solution',
        initialBinding: InitialBindings(),
        initialRoute: AppRoutes.initialRoute,
        getPages: AppRoutes.pages);
  }
}
