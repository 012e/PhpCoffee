import 'package:api_client/api_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IngredientCard extends ConsumerStatefulWidget {
  final IngredientResponse ingredient;
  final VoidCallback? onTap;
  final VoidCallback? onSecondaryTap;

  const IngredientCard({
    super.key,
    required this.ingredient,
    this.onTap,
    this.onSecondaryTap,
  });

  @override
  ConsumerState<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends ConsumerState<IngredientCard> {
  static const Color _fallbackTextColor = Colors.black;

  bool isHovering = false;

  Widget _buildCardInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Divider(height: 1, thickness: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Text(
            widget.ingredient.ingredientName ?? 'Unnamed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              // Use the centralized fallback color
              color:
                  Theme.of(context).textTheme.titleLarge?.color ??
                  _fallbackTextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color cardBackgroundColor = Theme.of(context).cardColor;
    final Color cardBorderColor =
        Theme.of(context).colorScheme.surfaceContainerHighest;
    const double cardBorderWidth = 1.0;

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
            // Use centralized color variables
            color: cardBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              // Use centralized color variables
              side: BorderSide(color: cardBorderColor, width: cardBorderWidth),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildCard,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildCard {
    return [
      Expanded(
        child:
            widget.ingredient.ingredientName != null
                ? CachedNetworkImage(
                  imageUrl: widget.ingredient.imageUrl ?? '',
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  errorWidget:
                      (context, error, stackTrace) =>
                          const Icon(Icons.fastfood, size: 50),
                )
                : const Icon(Icons.fastfood, size: 50),
      ),
      _buildCardInfo(),
    ];
  }
}
