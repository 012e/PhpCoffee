import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/shared/widgets/shell.dart';

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Shell(child: AutoRouter());
  }
}
