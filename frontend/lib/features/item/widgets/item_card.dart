import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCard extends ConsumerStatefulWidget {
  final MenuItemResponse item;
  // amount is now used to indicate selection and display the quantity
  final int amount;
  final VoidCallback? onTap;
  // Callback for secondary (right) tap
  final VoidCallback? onSecondaryTap;

  const ItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.amount = 0, // Default amount is 0 (not selected)
    this.onSecondaryTap,
  });

  @override
  ConsumerState<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<ItemCard> {
  bool isHovering = false;

  Widget _buildCardInfo() {
    return Container(
      // color: Theme.of(context).colorScheme.secondaryContainer, // Consider if you still need this
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(), // Use const with Divider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.item.itemName ?? 'Unnamed',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color:
                    Theme.of(context).textTheme.titleLarge?.color ??
                    Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          if (widget.item.basePrice != null)
            Text(
              '\$${widget.item.basePrice!.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.secondary,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the item is selected based on the amount
    final isSelected = widget.amount > 0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedScale(
        scale: isHovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onTap,
          onSecondaryTap: widget.onSecondaryTap, // Handle right-click
          child: Card(
            elevation: isHovering ? 8 : 4,
            color:
                isSelected
                    ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                    : Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side:
                  isSelected
                      ? BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 2,
                      )
                      : BorderSide.none,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child:
                          widget.item.itemName != null
                              ? Image.network(
                                widget.item.itemId.toString(), // TODO
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Icon(Icons.fastfood, size: 50),
                              )
                              : const Icon(Icons.fastfood, size: 50),
                    ),
                    _buildCardInfo(),
                  ],
                ),
                if (isSelected)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6), // Increased padding
                      constraints: const BoxConstraints(
                        minWidth: 28, // Increased minimum size
                        minHeight: 28,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        // Center the text within the circle
                        child: Text(
                          widget.amount.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(
                            // Adjusted text style size
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
