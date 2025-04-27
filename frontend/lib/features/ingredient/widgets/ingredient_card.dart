import 'package:api_client/api_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/shared/riverpods/ingredient_provider.dart';
import 'package:toastification/toastification.dart';

class IngredientCard extends ConsumerStatefulWidget {
  final IngredientResponse ingredient;
  final VoidCallback? onTap;
  final VoidCallback? onSecondaryTap;
  final Function(String)? onMenuItemSelected;

  const IngredientCard({
    super.key,
    required this.ingredient,
    this.onTap,
    this.onSecondaryTap,
    this.onMenuItemSelected,
  });

  @override
  ConsumerState<IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends ConsumerState<IngredientCard> {
  static const Color _fallbackTextColor = Colors.black;
  bool isHovering = false;

  void _showContextMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(const Offset(0, 0), ancestor: overlay),
        button.localToGlobal(
          button.size.bottomRight(Offset.zero),
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: [
        const PopupMenuItem<String>(
          value: 'edit',
          child: Row(
            children: [
              Icon(Icons.edit, size: 18),
              SizedBox(width: 8),
              Text('Edit'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'delete',
          onTap: () async {
            await ref
                .read(ingredientListProvider.notifier)
                .deleteIngredient(widget.ingredient.ingredientId!);
            ref.invalidate(ingredientListProvider);
            toastification.show(
              type: ToastificationType.success,
              title: Text('Ingredient deleted'),
              description: Text(
                'Ingredient ${widget.ingredient.ingredientName} deleted successfully',
              ),
            );
          },
          child: const Row(
            children: [
              Icon(Icons.delete, size: 18, color: Colors.red),
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null && widget.onMenuItemSelected != null) {
        widget.onMenuItemSelected!(value);
      }
    });
  }

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
            color: cardBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: cardBorderColor, width: cardBorderWidth),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildCard,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Builder(
                    builder: (BuildContext menuContext) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(150),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ),
                          padding: const EdgeInsets.all(4),
                          constraints: const BoxConstraints(),
                          iconSize: 20,
                          onPressed: () => _showContextMenu(menuContext),
                        ),
                      );
                    },
                  ),
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
