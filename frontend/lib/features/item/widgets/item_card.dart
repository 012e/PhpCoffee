import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemCard extends ConsumerStatefulWidget {
  final MenuItemResponse item;
  final int amount;
  final VoidCallback? onTap;
  final VoidCallback? onSecondaryTap;

  const ItemCard({
    super.key,
    required this.item,
    this.onTap,
    this.amount = 0,
    this.onSecondaryTap,
  });

  @override
  ConsumerState<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<ItemCard> {
  static const Color _fallbackTextColor = Colors.black;

  bool isHovering = false;

  Widget _buildCardInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.item.itemName ?? 'Unnamed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:
                  Theme.of(context).textTheme.titleLarge?.color ??
                  _fallbackTextColor,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSelected = widget.amount > 0;

    final Color selectedCardColor = Theme.of(
      context,
    ).colorScheme.primary.withAlpha(50);
    final Color defaultCardColor = Theme.of(context).cardColor;
    final Color selectedBorderColor = Theme.of(context).colorScheme.primary;
    final Color defaultBorderColor =
        Theme.of(
          context,
        ).colorScheme.surfaceVariant; // Color for the border when not selected
    const double defaultBorderWidth =
        1.0; // Width for the border when not selected
    final Color quantityCircleColor = Theme.of(context).colorScheme.primary;
    final Color quantityTextColor = Theme.of(context).colorScheme.onPrimary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovering = true),
      onExit: (_) => setState(() => isHovering = false),
      child: AnimatedScale(
        scale: isHovering ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: widget.onTap,
          onSecondaryTap: widget.onSecondaryTap,
          child: Card(
            elevation: isHovering ? 8 : 4,
            color: isSelected ? selectedCardColor : defaultCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Add a subtle border when not selected
              side:
                  isSelected
                      ? BorderSide(color: selectedBorderColor, width: 2)
                      : BorderSide(
                        color: defaultBorderColor,
                        width: defaultBorderWidth,
                      ),
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
                                widget.item.itemId
                                    .toString(), // TODO: Verify this is the correct image URL
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
                      padding: const EdgeInsets.all(6),
                      constraints: const BoxConstraints(
                        minWidth: 28,
                        minHeight: 28,
                      ),
                      decoration: BoxDecoration(
                        color: quantityCircleColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          widget.amount.toString(),
                          style: Theme.of(
                            context,
                          ).textTheme.titleSmall?.copyWith(
                            color: quantityTextColor,
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
