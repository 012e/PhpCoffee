import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentCard extends ConsumerWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const PaymentCard({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Centralize color settings used in this component
    final Color cardBackgroundColor =
        Theme.of(context).colorScheme.surfaceContainerLow;
    // Use onPrimary color for the icon - it's typically a light color that contrasts well with primary
    final Color iconColor = Theme.of(context).colorScheme.onSurface;
    // Use the theme's color for text that appears on surfaces
    final Color textColor = Theme.of(context).colorScheme.onSurface;
    // Use the theme's outline color for a subtle border
    final Color borderColor = Theme.of(context).colorScheme.outline;
    const double borderWidth = 1.0;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        color: cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: borderColor, width: borderWidth),
        ),
        child: SizedBox(
          width: 120.0, // Adjust size as needed
          height: 120.0, // Adjust size as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
                color: iconColor, // Using theme's onPrimary color
              ),
              const SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
