import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required SidebarXController controller})
    : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final divider = Divider(color: theme.colorScheme.surface, height: 1);
    final foreground = theme.colorScheme.onSurface;
    final primary = theme.colorScheme.primary;
    final sidebarBackground = theme.colorScheme.surfaceContainerHighest;
    final router = AutoRouter.of(context);

    final items = [
      SidebarXItem(
        icon: Icons.dashboard,
        label: 'Dashboard',
        onTap: () {
          router.navigatePath("/dashboard");
        },
      ),
      SidebarXItem(
        icon: Icons.coffee,
        label: 'Item',
        onTap: () {
          router.navigatePath("/items");
        },
      ),
      SidebarXItem(
        icon: Icons.people,
        label: 'Employee',
        onTap: () {
          router.navigatePath("/employees");
        },
      ),
      SidebarXItem(
        icon: Icons.settings,
        label: 'Settings',
        onTap: () {
          router.navigatePath("/settings");
        },
      ),
    ];
    return SidebarX(
      controller: _controller,

      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        hoverColor: primary.withAlpha(100),
        textStyle: TextStyle(color: foreground),
        selectedTextStyle: TextStyle(
          color: foreground,
          fontWeight: FontWeight.w500,
        ),
        hoverTextStyle: TextStyle(
          color: foreground,
          fontWeight: FontWeight.w500,
        ),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 40),
        itemDecoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primary.withAlpha(200),
        ),
        iconTheme: IconThemeData(
          color: foreground.withValues(alpha: 0.7),
          size: 20,
        ),
        selectedIconTheme: IconThemeData(color: foreground, size: 20),
      ),
      extendedTheme: SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(color: sidebarBackground),
      ),
      footerDivider: divider,
      headerBuilder:
          (context, extended) => Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: SizedBox(
              height: 100,
              child: Image(image: AssetImage("assets/logo.png")),
            ),
          ),
      items: items,
    );
  }

  // void _showDisabledAlert(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     const SnackBar(
  //       content: Text(
  //         'Item disabled for selecting',
  //         style: TextStyle(color: Colors.black),
  //       ),
  //       backgroundColor: Colors.white,
  //     ),
  //   );
  // }
}
