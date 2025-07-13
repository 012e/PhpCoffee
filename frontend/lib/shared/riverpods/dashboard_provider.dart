import 'package:frontend/shared/services/dashboard_service.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

@riverpod
class DashboardData extends _$DashboardData {
  final _dashboardService = GetIt.I<DashboardService>();

  @override
  Future<DashboardStatsResponse> build() async {
    return await _dashboardService.getDashboardStats();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
