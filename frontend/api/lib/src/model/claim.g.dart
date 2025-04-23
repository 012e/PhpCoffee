// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claim.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Claim extends Claim {
  @override
  final String? issuer;
  @override
  final String? originalIssuer;
  @override
  final BuiltMap<String, String>? properties;
  @override
  final ClaimsIdentity? subject;
  @override
  final String? type;
  @override
  final String? value;
  @override
  final String? valueType;

  factory _$Claim([void Function(ClaimBuilder)? updates]) =>
      (new ClaimBuilder()..update(updates))._build();

  _$Claim._(
      {this.issuer,
      this.originalIssuer,
      this.properties,
      this.subject,
      this.type,
      this.value,
      this.valueType})
      : super._();

  @override
  Claim rebuild(void Function(ClaimBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClaimBuilder toBuilder() => new ClaimBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Claim &&
        issuer == other.issuer &&
        originalIssuer == other.originalIssuer &&
        properties == other.properties &&
        subject == other.subject &&
        type == other.type &&
        value == other.value &&
        valueType == other.valueType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, issuer.hashCode);
    _$hash = $jc(_$hash, originalIssuer.hashCode);
    _$hash = $jc(_$hash, properties.hashCode);
    _$hash = $jc(_$hash, subject.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, valueType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Claim')
          ..add('issuer', issuer)
          ..add('originalIssuer', originalIssuer)
          ..add('properties', properties)
          ..add('subject', subject)
          ..add('type', type)
          ..add('value', value)
          ..add('valueType', valueType))
        .toString();
  }
}

class ClaimBuilder implements Builder<Claim, ClaimBuilder> {
  _$Claim? _$v;

  String? _issuer;
  String? get issuer => _$this._issuer;
  set issuer(String? issuer) => _$this._issuer = issuer;

  String? _originalIssuer;
  String? get originalIssuer => _$this._originalIssuer;
  set originalIssuer(String? originalIssuer) =>
      _$this._originalIssuer = originalIssuer;

  MapBuilder<String, String>? _properties;
  MapBuilder<String, String> get properties =>
      _$this._properties ??= new MapBuilder<String, String>();
  set properties(MapBuilder<String, String>? properties) =>
      _$this._properties = properties;

  ClaimsIdentityBuilder? _subject;
  ClaimsIdentityBuilder get subject =>
      _$this._subject ??= new ClaimsIdentityBuilder();
  set subject(ClaimsIdentityBuilder? subject) => _$this._subject = subject;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  String? _valueType;
  String? get valueType => _$this._valueType;
  set valueType(String? valueType) => _$this._valueType = valueType;

  ClaimBuilder() {
    Claim._defaults(this);
  }

  ClaimBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _issuer = $v.issuer;
      _originalIssuer = $v.originalIssuer;
      _properties = $v.properties?.toBuilder();
      _subject = $v.subject?.toBuilder();
      _type = $v.type;
      _value = $v.value;
      _valueType = $v.valueType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Claim other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Claim;
  }

  @override
  void update(void Function(ClaimBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Claim build() => _build();

  _$Claim _build() {
    _$Claim _$result;
    try {
      _$result = _$v ??
          new _$Claim._(
            issuer: issuer,
            originalIssuer: originalIssuer,
            properties: _properties?.build(),
            subject: _subject?.build(),
            type: type,
            value: value,
            valueType: valueType,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'properties';
        _properties?.build();
        _$failedField = 'subject';
        _subject?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Claim', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
