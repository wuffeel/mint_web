import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: LoginWrapperRoute.page,
          children: [AutoRoute(path: '', page: LoginRoute.page)],
        ),
        AutoRoute(
          path: '/auth',
          page: AuthWrapperRoute.page,
          children: [
            AutoRoute(path: '', page: EnterPhoneRoute.page),
            AutoRoute(path: 'otp', page: OtpRoute.page),
          ],
        ),
        AutoRoute(
          path: '/check',
          page: SpecialistCheckRoute.page,
          children: [
            AutoRoute(path: '', page: SpecialistCheckLoadingRoute.page),
            AutoRoute(path: 'onboarding', page: OnboardingRoute.page),
          ],
        ),
        AutoRoute(
          path: '/main',
          page: MainWrapperRoute.page,
          children: [
            AutoRoute(path: 'home', page: HomeRoute.page),
            RedirectRoute(path: '', redirectTo: 'home'),
          ],
        ),
      ];
}
