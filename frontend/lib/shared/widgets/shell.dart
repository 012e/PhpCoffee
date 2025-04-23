import 'package:flutter/material.dart';
import 'package:frontend/shared/widgets/sidebar.dart';
import 'package:sidebarx/sidebarx.dart';

class Shell extends StatelessWidget {
  final Widget child;

  Shell({super.key, required this.child});

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final background = Theme.of(context).colorScheme.surface;
    return Scaffold(
      key: _key,
      backgroundColor: background,
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
