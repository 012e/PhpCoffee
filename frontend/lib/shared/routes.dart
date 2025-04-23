import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/auth/login.dart';
import 'package:frontend/features/dashboard/dashboard_page.dart';
import 'package:frontend/features/employee/employee_page.dart';
import 'package:frontend/features/item/items_page.dart';
import 'package:frontend/features/root.dart';
import 'package:frontend/features/setting/setting_page.dart';
import 'package:frontend/features/setting/pages/profile_page.dart';
import 'package:frontend/features/setting/pages/setting_list_page.dart';
import 'package:frontend/shared/guards/auth_guards.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/auth/login', page: LoginRoute.page),
    AutoRoute(
      path: '/',
      page: RootRoute.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(path: 'dashboard', page: DashboardRoute.page),
        AutoRoute(path: 'items', page: ItemsRoute.page),
        AutoRoute(path: 'employees', page: EmployeesRoute.page),
        AutoRoute(
          path: 'settings',
          page: SettingRoute.page,
          children: [
            AutoRoute(path: "", page: SettingListRoute.page),
            AutoRoute(path: "profile", page: ProfileRoute.page),
          ],
        ),
      ],
    ),
  ];
}
