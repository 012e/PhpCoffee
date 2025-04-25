// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

/// generated route for
/// [ConfirmCashPaymentPage]
class ConfirmCashPaymentRoute extends PageRouteInfo<void> {
  const ConfirmCashPaymentRoute({List<PageRouteInfo>? children})
    : super(ConfirmCashPaymentRoute.name, initialChildren: children);

  static const String name = 'ConfirmCashPaymentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConfirmCashPaymentPage();
    },
  );
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardPage();
    },
  );
}

/// generated route for
/// [EmployeesPage]
class EmployeesRoute extends PageRouteInfo<void> {
  const EmployeesRoute({List<PageRouteInfo>? children})
    : super(EmployeesRoute.name, initialChildren: children);

  static const String name = 'EmployeesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EmployeesPage();
    },
  );
}

/// generated route for
/// [ItemsListPage]
class ItemsListRoute extends PageRouteInfo<ItemsListRouteArgs> {
  ItemsListRoute({
    Key? key,
    dynamic Function(SelectedItemsWithAmount)? onSelectionChanged,
    List<PageRouteInfo>? children,
  }) : super(
         ItemsListRoute.name,
         args: ItemsListRouteArgs(
           key: key,
           onSelectionChanged: onSelectionChanged,
         ),
         initialChildren: children,
       );

  static const String name = 'ItemsListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ItemsListRouteArgs>(
        orElse: () => const ItemsListRouteArgs(),
      );
      return ItemsListPage(
        key: args.key,
        onSelectionChanged: args.onSelectionChanged,
      );
    },
  );
}

class ItemsListRouteArgs {
  const ItemsListRouteArgs({this.key, this.onSelectionChanged});

  final Key? key;

  final dynamic Function(SelectedItemsWithAmount)? onSelectionChanged;

  @override
  String toString() {
    return 'ItemsListRouteArgs{key: $key, onSelectionChanged: $onSelectionChanged}';
  }
}

/// generated route for
/// [ItemsPage]
class ItemsRoute extends PageRouteInfo<void> {
  const ItemsRoute({List<PageRouteInfo>? children})
    : super(ItemsRoute.name, initialChildren: children);

  static const String name = 'ItemsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ItemsPage();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [OrderPage]
class OrderRoute extends PageRouteInfo<void> {
  const OrderRoute({List<PageRouteInfo>? children})
    : super(OrderRoute.name, initialChildren: children);

  static const String name = 'OrderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrderPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RootScreen();
    },
  );
}

/// generated route for
/// [SettingListPage]
class SettingListRoute extends PageRouteInfo<SettingListRouteArgs> {
  SettingListRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        SettingListRoute.name,
        args: SettingListRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SettingListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingListRouteArgs>(
        orElse: () => const SettingListRouteArgs(),
      );
      return SettingListPage(key: args.key);
    },
  );
}

class SettingListRouteArgs {
  const SettingListRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingPage();
    },
  );
}
