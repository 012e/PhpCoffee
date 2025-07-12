import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<int?> showQuantityDialog({
  required BuildContext context,
  required String ingredientName,
  int currentQuantity = 0,
}) async {
  return showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      return QuantityDialog(
        ingredientName: ingredientName,
        currentQuantity: currentQuantity,
      );
    },
  );
}

class QuantityDialog extends StatefulWidget {
  final String ingredientName;
  final int currentQuantity;

  const QuantityDialog({
    super.key,
    required this.ingredientName,
    required this.currentQuantity,
  });

  @override
  State<QuantityDialog> createState() => _QuantityDialogState();
}

class _QuantityDialogState extends State<QuantityDialog> {
  late TextEditingController _controller;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.currentQuantity;
    _controller = TextEditingController(text: _quantity.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _quantity++;
      _controller.text = _quantity.toString();
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
        _controller.text = _quantity.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Set Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.ingredientName,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _decrement,
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: 80,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  onChanged: (value) {
                    final parsed = int.tryParse(value);
                    if (parsed != null && parsed >= 0) {
                      setState(() {
                        _quantity = parsed;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: _increment,
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainer,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_quantity),
          child: const Text('Set'),
        ),
      ],
    );
  }
}
