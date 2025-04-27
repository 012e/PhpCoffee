import 'package:frontend/shared/routes.dart';
import 'package:get_it/get_it.dart';

void setupRouter() {
  final appRouter = AppRouter();
  GetIt.I.registerSingleton<AppRouter>(appRouter);
}
