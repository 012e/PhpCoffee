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

@RoutePage()
class ItemAdminListPage extends ConsumerStatefulWidget {
  const ItemAdminListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemAdminListState();
}

class _ItemAdminListState extends ConsumerState<ItemAdminListPage> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    var router = AutoRouter.of(context);
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ref
        .watch(itemListProvider)
        .when(
          data: (data) {
            // Filter items based on search query if needed
            final filteredItems =
                _searchQuery.isEmpty
                    ? data!
                    : BuiltList<MenuItemResponse>(
                      data!.where(
                        (item) =>
                            (item.itemName?.toLowerCase().contains(
                                  _searchQuery.toLowerCase(),
                                ) ??
                                false) ||
                            (item.description?.toLowerCase().contains(
                                  _searchQuery.toLowerCase(),
                                ) ??
                                false),
                      ),
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
                          child: MenuItemsDataTable(menuItems: filteredItems),
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
    return OutlinedButton.icon(
      onPressed: () {
        // Implement filter functionality
      },
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
}

class MenuItemsDataTable extends StatelessWidget {
  final BuiltList<MenuItemResponse> menuItems;

  const MenuItemsDataTable({super.key, required this.menuItems});

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
        source: _MenuItemDataSource(menuItems, context),
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

  _MenuItemDataSource(this._menuItems, this._context);

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
          onPressed: () => _showEditDialog(_context, item),
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
          onPressed: () {
            // View details
          },
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

  void _showEditDialog(BuildContext context, MenuItemResponse menuItem) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              padding: const EdgeInsets.all(24),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Menu Item',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Form fields would go here
                  Text(
                    'Edit functionality to be implemented',
                    style: GoogleFonts.poppins(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              isDarkMode ? Colors.white70 : Colors.black54,
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
                      const SizedBox(width: 12),
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
                        child: Text(
                          'Save Changes',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().fade().scale(
            begin: const Offset(0.9, 0.9),
            end: const Offset(1.0, 1.0),
            duration: 300.ms,
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
                onPressed: () {
                  // Implement delete functionality
                  Navigator.pop(context);
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
