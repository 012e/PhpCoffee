// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedItemsWithDetailsHash() =>
    r'2821361f60e4f413752894d177c30f0c12289771';

/// A provider that combines the selected item IDs and amounts
/// with the actual MenuItemResponse objects from the item list provider.
///
/// Copied from [selectedItemsWithDetails].
@ProviderFor(selectedItemsWithDetails)
final selectedItemsWithDetailsProvider =
    AutoDisposeProvider<SelectedItemsWithAmount>.internal(
      selectedItemsWithDetails,
      name: r'selectedItemsWithDetailsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedItemsWithDetailsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedItemsWithDetailsRef =
    AutoDisposeProviderRef<SelectedItemsWithAmount>;
String _$selectedItemsNotifierHash() =>
    r'4f8da410b533488c7c91bbf04fcccd71efb40cd3';

/// See also [SelectedItemsNotifier].
@ProviderFor(SelectedItemsNotifier)
final selectedItemsNotifierProvider =
    AutoDisposeNotifierProvider<SelectedItemsNotifier, Map<int, int>>.internal(
      SelectedItemsNotifier.new,
      name: r'selectedItemsNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$selectedItemsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SelectedItemsNotifier = AutoDisposeNotifier<Map<int, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
