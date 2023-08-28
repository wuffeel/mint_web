// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:mint_web/presentation/pages/auth/auth_wrapper_page.dart' as _i1;
import 'package:mint_web/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i2;
import 'package:mint_web/presentation/pages/auth/otp_page/otp_page.dart' as _i4;
import 'package:mint_web/presentation/pages/main/home_placeholder_page.dart'
    as _i3;
import 'package:mint_web/presentation/pages/user_wrapper_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthWrapperRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i1.AuthWrapperPage()),
      );
    },
    EnterPhoneRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EnterPhonePage(),
      );
    },
    HomePlaceholderRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePlaceholderPage(),
      );
    },
    OtpRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.OtpPage(),
      );
    },
    UserWrapperRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i5.UserWrapperPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthWrapperPage]
class AuthWrapperRoute extends _i6.PageRouteInfo<void> {
  const AuthWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthWrapperRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.EnterPhonePage]
class EnterPhoneRoute extends _i6.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i6.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePlaceholderPage]
class HomePlaceholderRoute extends _i6.PageRouteInfo<void> {
  const HomePlaceholderRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomePlaceholderRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePlaceholderRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.OtpPage]
class OtpRoute extends _i6.PageRouteInfo<void> {
  const OtpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OtpRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtpRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.UserWrapperPage]
class UserWrapperRoute extends _i6.PageRouteInfo<void> {
  const UserWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          UserWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserWrapperRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
