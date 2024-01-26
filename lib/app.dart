import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:ramflux_app/shared/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ram Flux',

      // Theme
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ConfigService.to.themeMode,

      // Locales
      locale: ConfigService.to.locale,
      translations: AppTranslations(),
      localizationsDelegates: AppTranslations.localizationsDelegate,
      supportedLocales: AppTranslations.supportedLocales,
      fallbackLocale: AppTranslations.fallbackLocale,

      // Routes
      initialRoute: RouteNames.splash,
      getPages: RoutePages.pages,

      defaultTransition: Transition.fadeIn,

      // Builder
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: EasyLoading.init()(context, child),
        );
      },
    );
  }
}

class AppInitializer {
  static Future<void> init() async {
    // Ensure Flutter App is initialized
    WidgetsFlutterBinding.ensureInitialized();

    // Init system UI
    await initSystemUI();

    // Init services
    await Future.wait([
      Storage().init(),
    ]).whenComplete(() {
      // Init config service
      Get.put<ConfigService>(ConfigService());
      // Init IM service
      Get.put<IMService>(IMService());
    });
  }

  static Future<void> initSystemUI() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 竖屏模式
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    const overlayStyle = SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(overlayStyle);
  }

  static addLicense() {
    /* LicenseRegistry.addLicense(() async* {
      final license = await rootBundle.loadString('assets/fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['google_fonts'], license);
    }); */
  }
}
