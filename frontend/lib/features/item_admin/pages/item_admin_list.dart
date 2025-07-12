import 'package:api_client/api_client.dart';
import 'package:auto_route/auto_route.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

@RoutePage()
class ItemAdminListPage extends ConsumerStatefulWidget {
  const ItemAdminListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemAdminListState();
}

class _ItemAdminListState extends ConsumerState<ItemAdminListPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String? _statusFilter; // 'active', 'inactive', null for all
  String? _priceFilter; // 'low-to-high', 'high-to-low', null for none
  String? _dateFilter; // 'newest', 'oldest', null for none
  bool _isExporting = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Downloads the menu items collection as an Excel file
  Future<void> _downloadMenuItemsExcel() async {
    if (_isExporting) return; // Prevent multiple concurrent exports

    setState(() {
      _isExporting = true;
    });

    try {
      // Generate a unique filename with current timestamp
      final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
      final fileName = 'menu_items_export_$timestamp.xlsx';

      // Call the export method from the provider
      final filePath = await ref
          .read(itemListProvider.notifier)
          .exportMenuItems(fileName: fileName);

      // Show success notification
      toastification.show(
        type: ToastificationType.success,
        title: const Text('Export Successful'),
        description: Text('Menu items exported to: $filePath'),
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: Colors.green,
        icon: const Icon(Icons.download_done),
      );
    } catch (error) {
      // Show error notification
      toastification.show(
        type: ToastificationType.error,
        title: const Text('Export Failed'),
        description: Text('Failed to export menu items: $error'),
        autoCloseDuration: const Duration(seconds: 5),
        primaryColor: Colors.red,
        icon: const Icon(Icons.error),
      );
    } finally {
      setState(() {
        _isExporting = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var router = AutoRouter.of(context);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ref
        .watch(itemListProvider)
        .when(
          data: (data) {
            // Apply all filters
            var filteredItems =
                data!.where((item) {
                  // Search filter
                  final matchesSearch =
                      _searchQuery.isEmpty ||
                      (item.itemName?.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ??
                          false) ||
                      (item.description?.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ??
                          false);

                  // Status filter
                  final matchesStatus =
                      _statusFilter == null ||
                      (_statusFilter == 'active' && item.isActive == true) ||
                      (_statusFilter == 'inactive' && item.isActive != true);

                  return matchesSearch && matchesStatus;
                }).toList();

            // Apply sorting based on filters
            if (_priceFilter != null) {
              filteredItems.sort((a, b) {
                final priceA = a.basePrice ?? 0;
                final priceB = b.basePrice ?? 0;
                return _priceFilter == 'low-to-high'
                    ? priceA.compareTo(priceB)
                    : priceB.compareTo(priceA);
              });
            }

            if (_dateFilter != null) {
              filteredItems.sort((a, b) {
                final dateA = a.createdAt ?? DateTime(1970);
                final dateB = b.createdAt ?? DateTime(1970);
                return _dateFilter == 'newest'
                    ? dateB.compareTo(dateA)
                    : dateA.compareTo(dateB);
              });
            }

            final filteredBuiltList = BuiltList<MenuItemResponse>(
              filteredItems,
            );

            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        isDarkMode
                            ? [const Color(0xFF1A1F38), const Color(0xFF0D1321)]
                            : [
                              const Color(0xFFF8F9FA),
                              const Color(0xFFE9ECEF),
                            ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildHeader(context, router),
                        const SizedBox(height: 24),
                        _buildSearchAndFilterBar(),
                        const SizedBox(height: 16),
                        _buildStatCards(data),
                        const SizedBox(height: 24),
                        Expanded(
                          child: MenuItemsDataTable(
                            menuItems: filteredBuiltList,
                            onNavigateToEdit: _navigateToEdit,
                            onDeleteItem: _deleteItem,
                            onShowDetails: _showDetailsDialog,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                    onPressed: () async {
                      await router.navigatePath("/admin/item/new");
                    },
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    label: const Text('Add New Item'),
                    icon: const Icon(Icons.add_circle_outline),
                  )
                  .animate()
                  .fade(duration: 300.ms)
                  .scale(delay: 300.ms, duration: 200.ms),
            );
          },
          loading:
              () => Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors:
                          isDarkMode
                              ? [
                                const Color(0xFF1A1F38),
                                const Color(0xFF0D1321),
                              ]
                              : [
                                const Color(0xFFF8F9FA),
                                const Color(0xFFE9ECEF),
                              ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Color(0xFF6366F1),
                          strokeWidth: 3,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Loading Menu Items...',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          error: (error, stackTrace) {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:
                        isDarkMode
                            ? [const Color(0xFF1A1F38), const Color(0xFF0D1321)]
                            : [
                              const Color(0xFFF8F9FA),
                              const Color(0xFFE9ECEF),
                            ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.red.shade400,
                      ).animate().shake(duration: 500.ms),
                      const SizedBox(height: 24),
                      Text(
                        'Oops! Something went wrong',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Error: $error',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white70 : Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () => ref.refresh(itemListProvider),
                        icon: const Icon(Icons.refresh),
                        label: const Text('Try Again'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
  }

  Widget _buildHeader(BuildContext context, StackRouter router) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Items',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ).animate().fade(duration: 300.ms).slideX(begin: -0.2, end: 0),
            Text(
                  'Manage your restaurant menu with ease',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.black54,
                  ),
                )
                .animate()
                .fade(duration: 300.ms, delay: 100.ms)
                .slideX(begin: -0.2, end: 0),
          ],
        ),
        Row(
          children: [
            // Download Excel Button
            Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      colors:
                          _isExporting
                              ? [Colors.grey.shade400, Colors.grey.shade500]
                              : [Colors.blue.shade500, Colors.blue.shade700],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow:
                        _isExporting
                            ? []
                            : [
                              BoxShadow(
                                color: Colors.blue.withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: _isExporting ? null : _downloadMenuItemsExcel,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _isExporting
                                ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : const Icon(
                                  Icons.download,
                                  color: Colors.white,
                                  size: 16,
                                ),
                            const SizedBox(width: 8),
                            Text(
                              _isExporting ? 'Exporting...' : 'Export Excel',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .animate()
                .scale(duration: 300.ms, curve: Curves.easeOut)
                .fade(duration: 300.ms),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {
                ref.invalidate(itemListProvider);
              },
              icon: const Icon(Icons.refresh),
              tooltip: 'Refresh',
              style: IconButton.styleFrom(
                backgroundColor:
                    isDarkMode
                        ? Colors.white10
                        : Colors.black.withValues(alpha: 0.05),
                foregroundColor: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                // Toggle theme
                // You would need to implement your theme switching logic here
              },
              icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              tooltip: isDarkMode ? 'Light Mode' : 'Dark Mode',
              style: IconButton.styleFrom(
                backgroundColor:
                    isDarkMode
                        ? Colors.white10
                        : Colors.black.withValues(alpha: 0.05),
                foregroundColor: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ).animate().fade(duration: 300.ms).slideX(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildSearchAndFilterBar() {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search menu items...',
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF6366F1),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    hintStyle: GoogleFonts.poppins(fontSize: 14),
                  ),
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(width: 8),
              _buildFilterButton(
                'Status',
                const Icon(Icons.toggle_on_outlined),
              ),
              const SizedBox(width: 8),
              _buildFilterButton(
                'Price',
                const Icon(Icons.monetization_on_outlined),
              ),
              const SizedBox(width: 8),
              _buildFilterButton(
                'Date',
                const Icon(Icons.calendar_today_outlined),
              ),
            ],
          ),
        )
        .animate()
        .fade(duration: 300.ms, delay: 200.ms)
        .scale(
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
          duration: 200.ms,
        );
  }

  Widget _buildFilterButton(String label, Icon icon) {
    VoidCallback? onPressed;

    switch (label) {
      case 'Status':
        onPressed = _showStatusFilter;
        break;
      case 'Price':
        onPressed = _showPriceFilter;
        break;
      case 'Date':
        onPressed = _showDateFilter;
        break;
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF6366F1),
        side: const BorderSide(color: Color(0xFFD1D5DB)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildStatCards(BuiltList<MenuItemResponse> data) {
    final activeItems = data.where((item) => item.isActive == true).length;
    final inactiveItems = data.length - activeItems;
    final totalRevenue = data
        .map((item) => item.basePrice ?? 0)
        .fold<double>(0, (prev, price) => prev + price);

    return SizedBox(
      height: 100,
      child: Row(
        children: [
          _buildStatCard(
            'Total Items',
            '${data.length}',
            Icons.restaurant_menu,
            const Color(0xFF6366F1),
            delay: 0,
          ),
          _buildStatCard(
            'Active Items',
            '$activeItems',
            Icons.check_circle_outline,
            Colors.green,
            delay: 100,
          ),
          _buildStatCard(
            'Inactive Items',
            '$inactiveItems',
            Icons.cancel_outlined,
            Colors.red,
            delay: 200,
          ),
          _buildStatCard(
            'Total Value',
            '\$${totalRevenue.toStringAsFixed(2)}',
            Icons.attach_money,
            Colors.amber.shade700,
            delay: 300,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color, {
    int delay = 0,
  }) {
    return Expanded(
          child: Card(
            elevation: 0,
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(icon, color: color, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white70
                                  : Colors.black54,
                        ),
                      ),
                      Text(
                        value,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
        .animate()
        .fade(duration: 300.ms, delay: delay.ms)
        .slideY(begin: 0.2, end: 0);
  }

  // Action methods
  void _navigateToEdit(StackRouter router, MenuItemResponse item) {
    // Navigate to edit page - for now, we'll show a placeholder
    // In a real implementation, you'd navigate to an edit page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Edit feature for ${item.itemName} - Navigate to edit page',
        ),
        backgroundColor: const Color(0xFF6366F1),
      ),
    );
  }

  Future<void> _deleteItem(MenuItemResponse item) async {
    try {
      await ref.read(itemListProvider.notifier).deleteItem(item.itemId!);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${item.itemName} deleted successfully'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete ${item.itemName}: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showDetailsDialog(BuildContext context, MenuItemResponse item) {
    showDialog(
      context: context,
      builder: (context) => _ItemDetailsDialog(item: item),
    );
  }

  // Filter methods
  void _showStatusFilter() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Filter by Status', style: GoogleFonts.poppins()),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('All Items', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: null,
                    groupValue: _statusFilter,
                    onChanged: (value) {
                      setState(() => _statusFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Active Only', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'active',
                    groupValue: _statusFilter,
                    onChanged: (value) {
                      setState(() => _statusFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Inactive Only', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'inactive',
                    groupValue: _statusFilter,
                    onChanged: (value) {
                      setState(() => _statusFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _showPriceFilter() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Sort by Price', style: GoogleFonts.poppins()),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Default', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: null,
                    groupValue: _priceFilter,
                    onChanged: (value) {
                      setState(() => _priceFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Low to High', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'low-to-high',
                    groupValue: _priceFilter,
                    onChanged: (value) {
                      setState(() => _priceFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('High to Low', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'high-to-low',
                    groupValue: _priceFilter,
                    onChanged: (value) {
                      setState(() => _priceFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }

  void _showDateFilter() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Sort by Date', style: GoogleFonts.poppins()),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text('Default', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: null,
                    groupValue: _dateFilter,
                    onChanged: (value) {
                      setState(() => _dateFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Newest First', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'newest',
                    groupValue: _dateFilter,
                    onChanged: (value) {
                      setState(() => _dateFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
                ListTile(
                  title: Text('Oldest First', style: GoogleFonts.poppins()),
                  leading: Radio<String?>(
                    value: 'oldest',
                    groupValue: _dateFilter,
                    onChanged: (value) {
                      setState(() => _dateFilter = value);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

class MenuItemsDataTable extends StatelessWidget {
  final BuiltList<MenuItemResponse> menuItems;
  final Function(StackRouter, MenuItemResponse) onNavigateToEdit;
  final Function(MenuItemResponse) onDeleteItem;
  final Function(BuildContext, MenuItemResponse) onShowDetails;

  const MenuItemsDataTable({
    super.key,
    required this.menuItems,
    required this.onNavigateToEdit,
    required this.onDeleteItem,
    required this.onShowDetails,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: PaginatedDataTable2(
        columnSpacing: 20,
        horizontalMargin: 20,
        minWidth: 800,
        rowsPerPage: 8,
        headingRowHeight: 60,
        dataRowHeight: 70,
        showCheckboxColumn: false,
        headingRowColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) =>
              isDarkMode ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
        ),
        border: TableBorder(
          horizontalInside: BorderSide(
            color: isDarkMode ? Colors.white12 : Colors.black12,
            width: 1,
          ),
        ),
        columns: [
          DataColumn2(
            label: _buildColumnHeader('ID'),
            size: ColumnSize.S,
            tooltip: 'Menu Item ID',
          ),
          DataColumn2(
            label: _buildColumnHeader('Name'),
            size: ColumnSize.L,
            tooltip: 'Menu Item Name',
          ),
          DataColumn2(
            label: _buildColumnHeader('Description'),
            size: ColumnSize.L,
            tooltip: 'Menu Item Description',
          ),
          DataColumn2(
            label: _buildColumnHeader('Price'),
            size: ColumnSize.S,
            tooltip: 'Base Price',
            numeric: true,
          ),
          DataColumn2(
            label: _buildColumnHeader('Status'),
            size: ColumnSize.S,
            tooltip: 'Active Status',
          ),
          DataColumn2(
            label: _buildColumnHeader('Created Date'),
            size: ColumnSize.M,
            tooltip: 'Date Created',
          ),
          DataColumn2(label: _buildColumnHeader('Actions'), size: ColumnSize.S),
        ],
        empty: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                size: 64,
                color: isDarkMode ? Colors.white30 : Colors.black26,
              ),
              const SizedBox(height: 16),
              Text(
                'No menu items found',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Start by adding your first menu item',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: isDarkMode ? Colors.white38 : Colors.black38,
                ),
              ),
            ],
          ),
        ),
        source: _MenuItemDataSource(
          menuItems,
          context,
          onNavigateToEdit,
          onDeleteItem,
          onShowDetails,
        ),
      ),
    ).animate().fade(duration: 500.ms, delay: 400.ms);
  }

  Widget _buildColumnHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14),
      ),
    );
  }
}

class _MenuItemDataSource extends DataTableSource {
  final BuiltList<MenuItemResponse> _menuItems;
  final BuildContext _context;
  final Function(StackRouter, MenuItemResponse) _onNavigateToEdit;
  final Function(MenuItemResponse) _onDeleteItem;
  final Function(BuildContext, MenuItemResponse) _onShowDetails;

  _MenuItemDataSource(
    this._menuItems,
    this._context,
    this._onNavigateToEdit,
    this._onDeleteItem,
    this._onShowDetails,
  );

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _menuItems.length) throw Exception('Invalid index');
    final item = _menuItems[index];

    return DataRow2(
      color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        // Alternate row colors for better readability
        return index.isEven
            ? Colors.transparent
            : Theme.of(_context).brightness == Brightness.dark
            ? Colors.white.withValues(alpha: 0.02)
            : Colors.black.withValues(alpha: 0.02);
      }),
      cells: [
        DataCell(_buildIdCell(item.itemId?.toString() ?? 'N/A')),
        DataCell(_buildNameCell(item.itemName ?? 'N/A')),
        DataCell(_buildDescriptionCell(item.description)),
        DataCell(_buildPriceCell(item.basePrice)),
        DataCell(_buildStatusCell(item.isActive)),
        DataCell(_buildDateCell(item.createdAt)),
        DataCell(_buildActionButtons(item)),
      ],
    );
  }

  Widget _buildIdCell(String id) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF6366F1).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '#$id',
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: const Color(0xFF6366F1),
        ),
      ),
    );
  }

  Widget _buildNameCell(String name) {
    return Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.w500));
  }

  Widget _buildDescriptionCell(String? description) {
    return Tooltip(
      message: description ?? 'No description',
      child: Text(
        (description?.length ?? 0) > 30
            ? '${description!.substring(0, 30)}...'
            : description ?? 'N/A',
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(),
      ),
    );
  }

  Widget _buildPriceCell(double? price) {
    return Text(
      price != null ? '\$${price.toStringAsFixed(2)}' : 'N/A',
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        color: const Color(0xFF059669),
      ),
    );
  }

  Widget _buildStatusCell(bool? isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            isActive == true
                ? const Color(0xFF059669).withValues(alpha: 0.1)
                : const Color(0xFFDC2626).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color:
                  isActive == true
                      ? const Color(0xFF059669)
                      : const Color(0xFFDC2626),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isActive == true ? 'Active' : 'Inactive',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color:
                  isActive == true
                      ? const Color(0xFF059669)
                      : const Color(0xFFDC2626),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateCell(DateTime? date) {
    return Text(
      date != null ? DateFormat('MMM dd, yyyy').format(date) : 'N/A',
      style: GoogleFonts.poppins(),
    );
  }

  Widget _buildActionButtons(MenuItemResponse item) {
    final isDarkMode = Theme.of(_context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildActionButton(
          icon: Icons.edit_outlined,
          color: const Color(0xFF6366F1),
          tooltip: 'Edit',
          onPressed: () => _onNavigateToEdit(AutoRouter.of(_context), item),
        ),
        const SizedBox(width: 8),
        _buildActionButton(
          icon: Icons.delete_outline,
          color: const Color(0xFFDC2626),
          tooltip: 'Delete',
          onPressed: () => _showDeleteConfirmation(_context, item),
        ),
        const SizedBox(width: 8),
        _buildActionButton(
          icon: Icons.visibility_outlined,
          color: isDarkMode ? Colors.white70 : Colors.black54,
          tooltip: 'View Details',
          onPressed: () => _onShowDetails(_context, item),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: color),
        tooltip: tooltip,
        onPressed: onPressed,
        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        padding: EdgeInsets.zero,
        splashRadius: 20,
      ),
    );
  }

  void _showDeleteConfirmation(
    BuildContext context,
    MenuItemResponse menuItem,
  ) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.orange,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  'Confirm Deletion',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: Text(
              'Are you sure you want to delete "${menuItem.itemName}"? This action cannot be undone.',
              style: GoogleFonts.poppins(),
            ),
            actions: [
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: isDarkMode ? Colors.white70 : Colors.black54,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('Cancel', style: GoogleFonts.poppins()),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete_outline, size: 18),
                onPressed: () async {
                  Navigator.pop(context);
                  await _onDeleteItem(menuItem);
                },
                label: Text('Delete', style: GoogleFonts.poppins()),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDC2626),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ).animate().fade().scale(
            begin: const Offset(0.9, 0.9),
            end: const Offset(1.0, 1.0),
            duration: 300.ms,
          ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _menuItems.length;

  @override
  int get selectedRowCount => 0;
}

class _ItemDetailsDialog extends StatelessWidget {
  final MenuItemResponse item;

  const _ItemDetailsDialog({required this.item});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menu Item Details',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildDetailRow('Name', item.itemName ?? 'N/A', context),
            _buildDetailRow('Description', item.description ?? 'N/A', context),
            _buildDetailRow(
              'Price',
              '\$${item.basePrice?.toStringAsFixed(2) ?? 'N/A'}',
              context,
            ),
            _buildDetailRow(
              'Status',
              item.isActive == true ? 'Active' : 'Inactive',
              context,
            ),
            _buildDetailRow(
              'Created At',
              item.createdAt != null
                  ? DateFormat('MMM dd, yyyy').format(item.createdAt!)
                  : 'N/A',
              context,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Close', style: GoogleFonts.poppins()),
            ),
          ],
        ),
      ),
    ).animate().fade().scale(
      begin: const Offset(0.9, 0.9),
      end: const Offset(1.0, 1.0),
      duration: 300.ms,
    );
  }

  Widget _buildDetailRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color:
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white10
                        : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                value,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
