import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/dashboard_provider.dart';
import 'package:frontend/shared/services/dashboard_service.dart';
import 'package:intl/intl.dart';

@RoutePage()
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(dashboardDataProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: dashboardAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: colorScheme.error),
                  const SizedBox(height: 16),
                  Text(
                    'Failed to load dashboard data',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => ref.refresh(dashboardDataProvider),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            ),
        data:
            (dashboardData) => RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(dashboardDataProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      children: [
                        Icon(
                          Icons.dashboard_rounded,
                          size: 32,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Dashboard',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => ref.refresh(dashboardDataProvider),
                          icon: const Icon(Icons.refresh),
                          tooltip: 'Refresh Dashboard',
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Overview Cards
                    _buildOverviewCards(context, dashboardData),
                    const SizedBox(height: 24),

                    // Revenue Chart
                    _buildRevenueChart(context, dashboardData),
                    const SizedBox(height: 24),

                    // Popular Items and Recent Transactions
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildPopularItems(context, dashboardData),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildRecentTransactions(
                            context,
                            dashboardData,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _buildOverviewCards(
    BuildContext context,
    DashboardStatsResponse data,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.5,
      children: [
        _buildOverviewCard(
          context,
          'Total Revenue',
          _formatCurrency(data.revenue.total),
          Icons.attach_money_rounded,
          colorScheme.primary,
          subtitle: 'All time',
        ),
        _buildOverviewCard(
          context,
          'Orders This Week',
          '${data.orders.recent}',
          Icons.shopping_cart_rounded,
          colorScheme.secondary,
          subtitle: '${data.orders.pending} pending',
        ),
        _buildOverviewCard(
          context,
          'Menu Items',
          '${data.totalCounts.menuItems}',
          Icons.restaurant_menu_rounded,
          colorScheme.tertiary,
          subtitle: 'Active items',
        ),
        _buildOverviewCard(
          context,
          'Low Stock Items',
          '${data.inventory.lowStockItems}',
          Icons.warning_rounded,
          data.inventory.lowStockItems > 0
              ? colorScheme.error
              : colorScheme.outline,
          subtitle: 'Need attention',
        ),
      ],
    );
  }

  Widget _buildOverviewCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color, {
    String? subtitle,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withAlpha(51), // 20% opacity
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChart(BuildContext context, DashboardStatsResponse data) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (data.dailyRevenue.isEmpty) {
      return Card(
        elevation: 0,
        color: colorScheme.surfaceContainerLow,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                Icons.show_chart_rounded,
                size: 48,
                color: colorScheme.onSurfaceVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'No revenue data available',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Calculate max revenue for scaling
    final maxRevenue = data.dailyRevenue
        .map((e) => e.revenue)
        .reduce((a, b) => a > b ? a : b);

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.trending_up_rounded, color: colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  'Daily Revenue (Last 7 Days)',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              height: 240, // Increased height to accommodate labels
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:
                    data.dailyRevenue.asMap().entries.map((entry) {
                      final item = entry.value;
                      final heightPercentage =
                          maxRevenue > 0 ? (item.revenue / maxRevenue) : 0;
                      final barHeight = (heightPercentage * 120.0).clamp( // Reduced max bar height
                        4.0,
                        120.0,
                      );

                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Revenue value on top
                              if (heightPercentage >
                                  0.3) // Only show if bar is tall enough
                                Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: colorScheme.primary.withAlpha(
                                      51,
                                    ), // 20% opacity
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    _formatCurrencyShort(item.revenue),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              // Bar
                              Container(
                                height: barHeight,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      colorScheme.primary,
                                      colorScheme.primary.withAlpha(
                                        204,
                                      ), // 80% opacity
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                      color: colorScheme.primary.withAlpha(
                                        102,
                                      ), // 40% opacity
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12), // Increased spacing
                              // Date label
                              Text(
                                DateFormat('M/d').format(item.date),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 8), // Bottom padding
                            ],
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPopularItems(BuildContext context, DashboardStatsResponse data) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.local_fire_department_rounded,
                  color: colorScheme.tertiary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Popular Items',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (data.popularMenuItems.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(
                        Icons.restaurant_rounded,
                        size: 48,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No popular items data',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...data.popularMenuItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isLast = index == data.popularMenuItems.length - 1;

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: _getPopularItemColor(
                          colorScheme,
                          index,
                        ),
                        child: Text(
                          '${index + 1}',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        item.itemName,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        '${item.orderCount} orders',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: _getPopularItemColor(
                            colorScheme,
                            index,
                          ).withAlpha(51), // 20% opacity
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '#${index + 1}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: _getPopularItemColor(colorScheme, index),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    if (!isLast)
                      Divider(
                        color: colorScheme.outline.withAlpha(51), // 20% opacity
                      ),
                  ],
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentTransactions(
    BuildContext context,
    DashboardStatsResponse data,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history_rounded, color: colorScheme.secondary),
                const SizedBox(width: 8),
                Text(
                  'Recent Transactions',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (data.recentTransactions.isEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        size: 48,
                        color: colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No recent transactions',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              ...data.recentTransactions.asMap().entries.map((entry) {
                final index = entry.key;
                final transaction = entry.value;
                final isLast = index == data.recentTransactions.length - 1;

                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: _getTransactionColor(
                          colorScheme,
                          transaction.transactionType,
                        ),
                        child: Icon(
                          _getTransactionIcon(transaction.transactionType),
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        transaction.transactionType ?? 'Unknown',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        transaction.transactionDate != null
                            ? DateFormat(
                              'MMM d, yyyy',
                            ).format(transaction.transactionDate!)
                            : 'Unknown date',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      trailing: Text(
                        transaction.totalAmount != null
                            ? _formatCurrency(transaction.totalAmount!)
                            : 'N/A',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    if (!isLast)
                      Divider(
                        color: colorScheme.outline.withAlpha(51), // 20% opacity
                      ),
                  ],
                );
              }),
          ],
        ),
      ),
    );
  }

  Color _getPopularItemColor(ColorScheme colorScheme, int index) {
    switch (index) {
      case 0:
        return colorScheme.primary;
      case 1:
        return colorScheme.secondary;
      case 2:
        return colorScheme.tertiary;
      default:
        return colorScheme.outline;
    }
  }

  Color _getTransactionColor(ColorScheme colorScheme, String? type) {
    switch (type?.toLowerCase()) {
      case 'purchase':
      case 'buy':
        return colorScheme.primary;
      case 'sale':
      case 'sell':
        return colorScheme.secondary;
      case 'adjustment':
        return colorScheme.tertiary;
      default:
        return colorScheme.outline;
    }
  }

  IconData _getTransactionIcon(String? type) {
    switch (type?.toLowerCase()) {
      case 'purchase':
      case 'buy':
        return Icons.shopping_cart_rounded;
      case 'sale':
      case 'sell':
        return Icons.point_of_sale_rounded;
      case 'adjustment':
        return Icons.tune_rounded;
      default:
        return Icons.receipt_rounded;
    }
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatter.format(amount);
  }

  String _formatCurrencyShort(double amount) {
    if (amount >= 1000000) {
      return '\$${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return '\$${(amount / 1000).toStringAsFixed(1)}K';
    } else {
      return '\$${amount.toStringAsFixed(0)}';
    }
  }
}
