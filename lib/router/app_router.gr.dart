// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:mint_web/presentation/pages/auth/auth_wrapper_page.dart' as _i1;
import 'package:mint_web/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i2;
import 'package:mint_web/presentation/pages/auth/otp_page/otp_page.dart' as _i8;
import 'package:mint_web/presentation/pages/login_page.dart' as _i4;
import 'package:mint_web/presentation/pages/login_wrapper_page.dart' as _i5;
import 'package:mint_web/presentation/pages/main/home/home_page.dart' as _i3;
import 'package:mint_web/presentation/pages/main/main_wrapper_page.dart' as _i6;
import 'package:mint_web/presentation/pages/main/onboarding/onboarding_page.dart'
    as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AuthWrapperRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i1.AuthWrapperPage()),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EnterPhonePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    LoginWrapperRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i5.LoginWrapperPage()),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.MainWrapperPage()),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnboardingPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OtpPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthWrapperPage]
class AuthWrapperRoute extends _i9.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EnterPhonePage]
class EnterPhoneRoute extends _i9.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i9.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginWrapperPage]
class LoginWrapperRoute extends _i9.PageRouteInfo<void> {
  const LoginWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWrapperRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainWrapperPage]
class MainWrapperRoute extends _i9.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OtpPage]
class OtpRoute extends _i9.PageRouteInfo<void> {
  const OtpRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
