import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'menu_item_form_data.g.dart';

class MenuItemFormData {
  final String itemName;
  final String description;
  final double basePrice;
  final bool isActive;

  const MenuItemFormData({
    required this.itemName,
    required this.description,
    required this.basePrice,
    required this.isActive,
  });

  MenuItemFormData copyWith({
    String? itemName,
    String? description,
    double? basePrice,
    bool? isActive,
  }) {
    return MenuItemFormData(
      itemName: itemName ?? this.itemName,
      description: description ?? this.description,
      basePrice: basePrice ?? this.basePrice,
      isActive: isActive ?? this.isActive,
    );
  }
}

@riverpod
class MenuItemFormDataNotifier extends _$MenuItemFormDataNotifier {
  @override
  MenuItemFormData build() {
    return const MenuItemFormData(
      itemName: '',
      description: '',
      basePrice: 0.0,
      isActive: true,
    );
  }

  void updateFormData({
    String? itemName,
    String? description,
    double? basePrice,
    bool? isActive,
  }) {
    state = state.copyWith(
      itemName: itemName,
      description: description,
      basePrice: basePrice,
      isActive: isActive,
    );
  }

  void reset() {
    state = const MenuItemFormData(
      itemName: '',
      description: '',
      basePrice: 0.0,
      isActive: true,
    );
  }
}
