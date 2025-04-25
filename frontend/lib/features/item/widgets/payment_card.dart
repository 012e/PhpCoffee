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
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: SizedBox(
          width: 120.0, // Adjust size as needed
          height: 120.0, // Adjust size as needed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40.0, color: Theme.of(context).primaryColor),
              SizedBox(height: 8.0),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
