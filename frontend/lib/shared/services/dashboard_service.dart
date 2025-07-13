import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class DashboardService {
  final Dio _dio = GetIt.I<Dio>();

  Future<DashboardStatsResponse> getDashboardStats() async {
    try {
      final response = await _dio.get('/Dashboard/stats');
      if (response.statusCode == 200) {
        return DashboardStatsResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load dashboard stats');
      }
    } catch (e) {
      throw Exception('Error fetching dashboard stats: $e');
    }
  }
}

class DashboardStatsResponse {
  final TotalCounts totalCounts;
  final RevenueStats revenue;
  final OrderStats orders;
  final InventoryStats inventory;
  final List<PopularMenuItem> popularMenuItems;
  final List<DailyRevenue> dailyRevenue;
  final List<RecentTransaction> recentTransactions;

  DashboardStatsResponse({
    required this.totalCounts,
    required this.revenue,
    required this.orders,
    required this.inventory,
    required this.popularMenuItems,
    required this.dailyRevenue,
    required this.recentTransactions,
  });

  factory DashboardStatsResponse.fromJson(Map<String, dynamic> json) {
    return DashboardStatsResponse(
      totalCounts: TotalCounts.fromJson(json['totalCounts'] ?? {}),
      revenue: RevenueStats.fromJson(json['revenue'] ?? {}),
      orders: OrderStats.fromJson(json['orders'] ?? {}),
      inventory: InventoryStats.fromJson(json['inventory'] ?? {}),
      popularMenuItems:
          (json['popularMenuItems'] as List<dynamic>? ?? [])
              .map((item) => PopularMenuItem.fromJson(item))
              .toList(),
      dailyRevenue:
          (json['dailyRevenue'] as List<dynamic>? ?? [])
              .map((item) => DailyRevenue.fromJson(item))
              .toList(),
      recentTransactions:
          (json['recentTransactions'] as List<dynamic>? ?? [])
              .map((item) => RecentTransaction.fromJson(item))
              .toList(),
    );
  }
}

class TotalCounts {
  final int users;
  final int ingredients;
  final int menuItems;
  final int suppliers;
  final int orders;

  TotalCounts({
    required this.users,
    required this.ingredients,
    required this.menuItems,
    required this.suppliers,
    required this.orders,
  });

  factory TotalCounts.fromJson(Map<String, dynamic> json) {
    return TotalCounts(
      users: json['users'] ?? 0,
      ingredients: json['ingredients'] ?? 0,
      menuItems: json['menuItems'] ?? 0,
      suppliers: json['suppliers'] ?? 0,
      orders: json['orders'] ?? 0,
    );
  }
}

class RevenueStats {
  final double total;
  final double monthly;
  final double weekly;

  RevenueStats({
    required this.total,
    required this.monthly,
    required this.weekly,
  });

  factory RevenueStats.fromJson(Map<String, dynamic> json) {
    return RevenueStats(
      total: (json['total'] ?? 0).toDouble(),
      monthly: (json['monthly'] ?? 0).toDouble(),
      weekly: (json['weekly'] ?? 0).toDouble(),
    );
  }
}

class OrderStats {
  final int recent;
  final int pending;
  final int completed;

  OrderStats({
    required this.recent,
    required this.pending,
    required this.completed,
  });

  factory OrderStats.fromJson(Map<String, dynamic> json) {
    return OrderStats(
      recent: json['recent'] ?? 0,
      pending: json['pending'] ?? 0,
      completed: json['completed'] ?? 0,
    );
  }
}

class InventoryStats {
  final int lowStockItems;

  InventoryStats({required this.lowStockItems});

  factory InventoryStats.fromJson(Map<String, dynamic> json) {
    return InventoryStats(lowStockItems: json['lowStockItems'] ?? 0);
  }
}

class PopularMenuItem {
  final int itemId;
  final String itemName;
  final int orderCount;

  PopularMenuItem({
    required this.itemId,
    required this.itemName,
    required this.orderCount,
  });

  factory PopularMenuItem.fromJson(Map<String, dynamic> json) {
    return PopularMenuItem(
      itemId: json['itemId'] ?? 0,
      itemName: json['itemName'] ?? '',
      orderCount: json['orderCount'] ?? 0,
    );
  }
}

class DailyRevenue {
  final DateTime date;
  final double revenue;

  DailyRevenue({required this.date, required this.revenue});

  factory DailyRevenue.fromJson(Map<String, dynamic> json) {
    return DailyRevenue(
      date: DateTime.parse(json['date']),
      revenue: (json['revenue'] ?? 0).toDouble(),
    );
  }
}

class RecentTransaction {
  final int transactionId;
  final String? transactionType;
  final DateTime? transactionDate;
  final double? totalAmount;

  RecentTransaction({
    required this.transactionId,
    this.transactionType,
    this.transactionDate,
    this.totalAmount,
  });

  factory RecentTransaction.fromJson(Map<String, dynamic> json) {
    return RecentTransaction(
      transactionId: json['transactionId'] ?? 0,
      transactionType: json['transactionType'],
      transactionDate:
          json['transactionDate'] != null
              ? DateTime.parse(json['transactionDate'])
              : null,
      totalAmount: json['totalAmount']?.toDouble(),
    );
  }
}
