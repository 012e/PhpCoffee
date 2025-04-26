import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:frontend/auth/login.dart';
import 'package:frontend/features/dashboard/dashboard_page.dart';
import 'package:frontend/features/employee/employee_page.dart';
import 'package:frontend/features/ingredient/ingredient_page.dart';
import 'package:frontend/features/ingredient/pages/ingredient_list.dart';
import 'package:frontend/features/item/items_page.dart';
import 'package:frontend/features/item/pages/confirm_cash.dart';
import 'package:frontend/features/item/pages/items_list.dart';
import 'package:frontend/features/item/pages/order.dart';
import 'package:frontend/features/root.dart';
import 'package:frontend/features/setting/setting_page.dart';
import 'package:frontend/features/setting/pages/profile_page.dart';
import 'package:frontend/features/setting/pages/setting_list_page.dart';
import 'package:frontend/shared/guards/auth_guards.dart';
import 'package:frontend/shared/riverpods/order_items_provider.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/auth/login', page: LoginRoute.page),
    AutoRoute(
      path: '/',
      page: RootRoute.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(path: 'dashboard', page: DashboardRoute.page),
        AutoRoute(
          path: 'items',
          page: ItemsRoute.page,
          children: [
            AutoRoute(path: '', page: ItemsListRoute.page),
            CustomRoute(
              path: 'confirm',
              page: ConfirmCashPaymentRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'order',
              page: OrderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
        AutoRoute(
          page: IngredientRoute.page,
          children: [AutoRoute(path: '', page: IngredientListRoute.page)],
        ),
        AutoRoute(path: 'employees', page: EmployeesRoute.page),
        AutoRoute(
          path: 'settings',
          page: SettingRoute.page,
          children: [
            AutoRoute(path: "", page: SettingListRoute.page),
            CustomRoute(
              path: "profile",
              page: ProfileRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
      ],
    ),
  ];
}
