import 'package:babynama/servies/local_storage_service.dart';
import 'package:babynama/servies/snackbar_service.dart';
import 'package:babynama/themes/app_colors.dart';
import 'package:babynama/themes/extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:babynama/themes/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;
import 'app/app.router.dart';

final locator = StackedLocator.instance;

void main() async {
  await setupLocator();
  runApp(const MyApp());
}


Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);
  // Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ThemeService());
  locator.registerLazySingleton(() => LocalStorageService());
  locator.registerLazySingleton(() => SnackbarService());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return ValueListenableBuilder<bool>(
        valueListenable: themeService.valueListenable,
        builder: (context, value, _) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return ScreenUtilInit(
            designSize: const Size(428, 926),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: 'babynama',
                theme: ThemeData(
                  brightness: themeService.brightness,
                  primarySwatch: Colors.blue,
                  scaffoldBackgroundColor:
                  context.colorScheme.appBackGroundColor,
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    iconTheme: IconThemeData(
                        color: context.colorScheme.appbarIconColor),
                  ),
                ),
                debugShowCheckedModeBanner: false,
                onGenerateRoute: StackedRouter().onGenerateRoute,
                navigatorKey: StackedService.navigatorKey,
                initialRoute: Routes.homeView,
              );
            },
          );
        });
  }
}