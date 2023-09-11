// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:mint_web/presentation/pages/auth/auth_wrapper_page.dart' as _i2;
import 'package:mint_web/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i3;
import 'package:mint_web/presentation/pages/auth/otp_page/otp_page.dart'
    as _i10;
import 'package:mint_web/presentation/pages/login_page.dart' as _i5;
import 'package:mint_web/presentation/pages/login_wrapper_page.dart' as _i6;
import 'package:mint_web/presentation/pages/main/appointments/appointments_page.dart'
    as _i1;
import 'package:mint_web/presentation/pages/main/home/home_page.dart' as _i4;
import 'package:mint_web/presentation/pages/main/main_wrapper_page.dart' as _i7;
import 'package:mint_web/presentation/pages/main/navigation/navigation_page.dart'
    as _i8;
import 'package:mint_web/presentation/pages/main/onboarding/onboarding_page.dart'
    as _i9;
import 'package:mint_web/presentation/pages/main/patients/patients_page.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AppointmentsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppointmentsPage(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i2.AuthWrapperPage()),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterPhonePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    LoginWrapperRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i6.LoginWrapperPage()),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i7.MainWrapperPage()),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NavigationPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OtpPage(),
      );
    },
    PatientsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PatientsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppointmentsPage]
class AppointmentsRoute extends _i12.PageRouteInfo<void> {
  const AppointmentsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AppointmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppointmentsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthWrapperPage]
class AuthWrapperRoute extends _i12.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EnterPhonePage]
class EnterPhoneRoute extends _i12.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginWrapperPage]
class LoginWrapperRoute extends _i12.PageRouteInfo<void> {
  const LoginWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWrapperRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainWrapperPage]
class MainWrapperRoute extends _i12.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.NavigationPage]
class NavigationRoute extends _i12.PageRouteInfo<void> {
  const NavigationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i12.PageRouteInfo<void> {
  const OnboardingRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OtpPage]
class OtpRoute extends _i12.PageRouteInfo<void> {
  const OtpRoute({List<_i12.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.PatientsPage]
class PatientsRoute extends _i12.PageRouteInfo<void> {
  const PatientsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          PatientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
