import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/features/item_admin/widgets/quantity_dialog.dart';

class IngredientCard extends ConsumerStatefulWidget {
  final IngredientResponse ingredient;
  final int amount;
  final VoidCallback? onTap;
  final VoidCallback? onSecondaryTap;
  final Function(int)? onQuantityChanged;

  const IngredientCard({
    super.key,
    required this.ingredient,
    this.onTap,
    this.amount = 0,
    this.onSecondaryTap,
    this.onQuantityChanged,
  });

  @override
  ConsumerState<IngredientCard> createState() => _ItemCardState();
}

class _ItemCardState extends ConsumerState<IngredientCard> {
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
            widget.ingredient.ingredientName ?? 'Unnamed',
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
        Theme.of(context)
            .colorScheme
            .surfaceContainerHighest; // Color for the border when not selected
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
          onLongPress: () async {
            if (widget.onQuantityChanged != null) {
              final newQuantity = await showQuantityDialog(
                context: context,
                ingredientName: widget.ingredient.ingredientName ?? 'Unknown',
                currentQuantity: widget.amount,
              );
              if (newQuantity != null) {
                widget.onQuantityChanged!(newQuantity);
              }
            }
          },
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
                          widget.ingredient.imageUrl != null
                              ? Image.network(
                                widget.ingredient.imageUrl.toString(),
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
                      padding: const EdgeInsets.symmetric(horizontal: 6),
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
