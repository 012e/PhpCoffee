import 'package:flutter/material.dart';
import 'package:frontend/shared/routes.dart';
import 'package:frontend/shared/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class Shell extends StatelessWidget {
  final Widget child;

  Shell({super.key, required this.child});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Sidebar(controller: _controller),
      body: Row(
        children: [
          Sidebar(controller: _controller),
          Expanded(child: Center(child: child)),
        ],
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    default:
      return 'Not found page';
  }
}
