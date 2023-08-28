import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: UserWrapperRoute.page,
          children: [
            AutoRoute(
              path: 'auth',
              page: AuthWrapperRoute.page,
              children: [
                AutoRoute(path: '', page: EnterPhoneRoute.page),
                AutoRoute(path: 'otp', page: OtpRoute.page),
              ],
            ),
            AutoRoute(path: 'home', page: HomePlaceholderRoute.page),
          ],
        ),
      ];
}
