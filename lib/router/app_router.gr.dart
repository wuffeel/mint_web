// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:mint_web/presentation/pages/auth/enter_phone/enter_phone_page.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    EnterPhoneRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EnterPhonePage(),
      );
    }
  };
}

/// generated route for
/// [_i1.EnterPhonePage]
class EnterPhoneRoute extends _i2.PageRouteInfo<void> {
  const EnterPhoneRoute({List<_i2.PageRouteInfo>? children})
      : super(
          EnterPhoneRoute.name,
          initialChildren: children,
        );

  static const String name = 'EnterPhoneRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
