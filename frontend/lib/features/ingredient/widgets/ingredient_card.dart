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
  bool isHovering = false;

  Widget _buildCardInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(), // Use const with Divider
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.ingredient.ingredientName ?? 'Unnamed',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color:
                  Theme.of(context).textTheme.titleLarge?.color ?? Colors.black,
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
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
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
