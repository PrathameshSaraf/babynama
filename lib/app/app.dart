
import 'package:babynama/Views/AccountView.dart';
import 'package:babynama/Views/Track_vaccination_view.dart';
import 'package:babynama/Views/profilePage_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart' hide SnackbarService;
import '../Views/AutismView.dart';
import '../Views/HomeView.dart';
import '../servies/local_storage_service.dart';
import '../servies/snackbar_service.dart';
import '../themes/theme_service.dart';


@StackedApp(
  routes: [
    MaterialRoute(page: HomeView,initial: true),
    MaterialRoute(page: AutismView),
    MaterialRoute(page: VaccineTrackerPage),
    MaterialRoute(page: AccountPageView),
    MaterialRoute(page: ProfileView)
      ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ThemeService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: LocalStorageService),
  ],
  logger: StackedLogger(),
)
class $AppRouter {}

//flutter pub run build_runner build --delete-conflicting-outputs
