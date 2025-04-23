import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/items_provider.dart';

class ItemsList extends ConsumerWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemListProvider);
    return asyncItems.when(
      data: (items) {
        if (items == null || items.isEmpty) {
          return const Center(child: Text('No menu items available'));
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final item = items[index];
              return _buildCard(context, item);
            },
          ),
        );
      },
      error: (e, s) => const Center(child: Text('Error loading items')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildCard(BuildContext context, dynamic item) {
    return HoverableCard(item: item);
  }
}

class HoverableCard extends ConsumerStatefulWidget {
  final dynamic item;

  const HoverableCard({Key? key, required this.item}) : super(key: key);

  @override
  ConsumerState<HoverableCard> createState() => _HoverableCardState();
}

class _HoverableCardState extends ConsumerState<HoverableCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedScale(
        scale: isHovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () {
            // Handle placing logic
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Added ${widget.item.itemName} to order')),
            );
          },
          child: Card(
            elevation: isHovering ? 8 : 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child:
                      widget.item.itemName != null
                          ? Image.asset(
                            'assets/images/${widget.item.itemName!.toLowerCase().replaceAll(' ', '_')}.png',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.fastfood, size: 50),
                          )
                          : const Icon(Icons.fastfood, size: 50),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.item.itemName ?? 'Unnamed',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (widget.item.basePrice != null)
                  Text(
                    '\$${widget.item.basePrice!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
