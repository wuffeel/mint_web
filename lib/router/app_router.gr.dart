// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:flutter_chat_types/flutter_chat_types.dart' as _i15;
import 'package:mint_web/presentation/pages/auth/auth_wrapper_page.dart' as _i2;
import 'package:mint_web/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i3;
import 'package:mint_web/presentation/pages/auth/otp_page/otp_page.dart'
    as _i11;
import 'package:mint_web/presentation/pages/login_page.dart' as _i5;
import 'package:mint_web/presentation/pages/login_wrapper_page.dart' as _i6;
import 'package:mint_web/presentation/pages/main/appointments/appointments_page.dart'
    as _i1;
import 'package:mint_web/presentation/pages/main/home/home_page.dart' as _i4;
import 'package:mint_web/presentation/pages/main/main_wrapper_page.dart' as _i7;
import 'package:mint_web/presentation/pages/main/messages/messages_page.dart'
    as _i8;
import 'package:mint_web/presentation/pages/main/navigation/navigation_page.dart'
    as _i9;
import 'package:mint_web/presentation/pages/main/onboarding/onboarding_page.dart'
    as _i10;
import 'package:mint_web/presentation/pages/main/patients/patients_page.dart'
    as _i12;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AppointmentsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppointmentsPage(),
      );
    },
    AuthWrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i2.AuthWrapperPage()),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.EnterPhonePage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginPage(),
      );
    },
    LoginWrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i6.LoginWrapperPage()),
      );
    },
    MainWrapperRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.WrappedRoute(child: const _i7.MainWrapperPage()),
      );
    },
    MessagesRoute.name: (routeData) {
      final args = routeData.argsAs<MessagesRouteArgs>(
          orElse: () => const MessagesRouteArgs());
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MessagesPage(
          key: args.key,
          room: args.room,
        ),
      );
    },
    NavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.NavigationPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OnboardingPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OtpPage(),
      );
    },
    PatientsRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.PatientsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AppointmentsPage]
class AppointmentsRoute extends _i13.PageRouteInfo<void> {
  const AppointmentsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AppointmentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppointmentsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AuthWrapperPage]
class AuthWrapperRoute extends _i13.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.EnterPhonePage]
class EnterPhoneRoute extends _i13.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i13.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginPage]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginWrapperPage]
class LoginWrapperRoute extends _i13.PageRouteInfo<void> {
  const LoginWrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          LoginWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginWrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainWrapperPage]
class MainWrapperRoute extends _i13.PageRouteInfo<void> {
  const MainWrapperRoute({List<_i13.PageRouteInfo>? children})
      : super(
          MainWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainWrapperRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MessagesPage]
class MessagesRoute extends _i13.PageRouteInfo<MessagesRouteArgs> {
  MessagesRoute({
    _i14.Key? key,
    _i15.Room? room,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MessagesRoute.name,
          args: MessagesRouteArgs(
            key: key,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'MessagesRoute';

  static const _i13.PageInfo<MessagesRouteArgs> page =
      _i13.PageInfo<MessagesRouteArgs>(name);
}

class MessagesRouteArgs {
  const MessagesRouteArgs({
    this.key,
    this.room,
  });

  final _i14.Key? key;

  final _i15.Room? room;

  @override
  String toString() {
    return 'MessagesRouteArgs{key: $key, room: $room}';
  }
}

/// generated route for
/// [_i9.NavigationPage]
class NavigationRoute extends _i13.PageRouteInfo<void> {
  const NavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OnboardingPage]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OtpPage]
class OtpRoute extends _i13.PageRouteInfo<void> {
  const OtpRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.PatientsPage]
class PatientsRoute extends _i13.PageRouteInfo<void> {
  const PatientsRoute({List<_i13.PageRouteInfo>? children})
      : super(
          PatientsRoute.name,
          initialChildren: children,
        );

  static const String name = 'PatientsRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
