// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'claims_identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClaimsIdentity extends ClaimsIdentity {
  @override
  final String? authenticationType;
  @override
  final bool? isAuthenticated;
  @override
  final ClaimsIdentity? actor;
  @override
  final JsonObject? bootstrapContext;
  @override
  final BuiltList<Claim>? claims;
  @override
  final String? label;
  @override
  final String? name;
  @override
  final String? nameClaimType;
  @override
  final String? roleClaimType;

  factory _$ClaimsIdentity([void Function(ClaimsIdentityBuilder)? updates]) =>
      (new ClaimsIdentityBuilder()..update(updates))._build();

  _$ClaimsIdentity._(
      {this.authenticationType,
      this.isAuthenticated,
      this.actor,
      this.bootstrapContext,
      this.claims,
      this.label,
      this.name,
      this.nameClaimType,
      this.roleClaimType})
      : super._();

  @override
  ClaimsIdentity rebuild(void Function(ClaimsIdentityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClaimsIdentityBuilder toBuilder() =>
      new ClaimsIdentityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClaimsIdentity &&
        authenticationType == other.authenticationType &&
        isAuthenticated == other.isAuthenticated &&
        actor == other.actor &&
        bootstrapContext == other.bootstrapContext &&
        claims == other.claims &&
        label == other.label &&
        name == other.name &&
        nameClaimType == other.nameClaimType &&
        roleClaimType == other.roleClaimType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, authenticationType.hashCode);
    _$hash = $jc(_$hash, isAuthenticated.hashCode);
    _$hash = $jc(_$hash, actor.hashCode);
    _$hash = $jc(_$hash, bootstrapContext.hashCode);
    _$hash = $jc(_$hash, claims.hashCode);
    _$hash = $jc(_$hash, label.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, nameClaimType.hashCode);
    _$hash = $jc(_$hash, roleClaimType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClaimsIdentity')
          ..add('authenticationType', authenticationType)
          ..add('isAuthenticated', isAuthenticated)
          ..add('actor', actor)
          ..add('bootstrapContext', bootstrapContext)
          ..add('claims', claims)
          ..add('label', label)
          ..add('name', name)
          ..add('nameClaimType', nameClaimType)
          ..add('roleClaimType', roleClaimType))
        .toString();
  }
}

class ClaimsIdentityBuilder
    implements Builder<ClaimsIdentity, ClaimsIdentityBuilder> {
  _$ClaimsIdentity? _$v;

  String? _authenticationType;
  String? get authenticationType => _$this._authenticationType;
  set authenticationType(String? authenticationType) =>
      _$this._authenticationType = authenticationType;

  bool? _isAuthenticated;
  bool? get isAuthenticated => _$this._isAuthenticated;
  set isAuthenticated(bool? isAuthenticated) =>
      _$this._isAuthenticated = isAuthenticated;

  ClaimsIdentityBuilder? _actor;
  ClaimsIdentityBuilder get actor =>
      _$this._actor ??= new ClaimsIdentityBuilder();
  set actor(ClaimsIdentityBuilder? actor) => _$this._actor = actor;

  JsonObject? _bootstrapContext;
  JsonObject? get bootstrapContext => _$this._bootstrapContext;
  set bootstrapContext(JsonObject? bootstrapContext) =>
      _$this._bootstrapContext = bootstrapContext;

  ListBuilder<Claim>? _claims;
  ListBuilder<Claim> get claims => _$this._claims ??= new ListBuilder<Claim>();
  set claims(ListBuilder<Claim>? claims) => _$this._claims = claims;

  String? _label;
  String? get label => _$this._label;
  set label(String? label) => _$this._label = label;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _nameClaimType;
  String? get nameClaimType => _$this._nameClaimType;
  set nameClaimType(String? nameClaimType) =>
      _$this._nameClaimType = nameClaimType;

  String? _roleClaimType;
  String? get roleClaimType => _$this._roleClaimType;
  set roleClaimType(String? roleClaimType) =>
      _$this._roleClaimType = roleClaimType;

  ClaimsIdentityBuilder() {
    ClaimsIdentity._defaults(this);
  }

  ClaimsIdentityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _authenticationType = $v.authenticationType;
      _isAuthenticated = $v.isAuthenticated;
      _actor = $v.actor?.toBuilder();
      _bootstrapContext = $v.bootstrapContext;
      _claims = $v.claims?.toBuilder();
      _label = $v.label;
      _name = $v.name;
      _nameClaimType = $v.nameClaimType;
      _roleClaimType = $v.roleClaimType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClaimsIdentity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClaimsIdentity;
  }

  @override
  void update(void Function(ClaimsIdentityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClaimsIdentity build() => _build();

  _$ClaimsIdentity _build() {
    _$ClaimsIdentity _$result;
    try {
      _$result = _$v ??
          new _$ClaimsIdentity._(
            authenticationType: authenticationType,
            isAuthenticated: isAuthenticated,
            actor: _actor?.build(),
            bootstrapContext: bootstrapContext,
            claims: _claims?.build(),
            label: label,
            name: name,
            nameClaimType: nameClaimType,
            roleClaimType: roleClaimType,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'actor';
        _actor?.build();

        _$failedField = 'claims';
        _claims?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClaimsIdentity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
