// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BasketModel _$BasketModelFromJson(Map<String, dynamic> json) {
  return _BasketModel.fromJson(json);
}

/// @nodoc
mixin _$BasketModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get storeId => throw _privateConstructorUsedError;
  set storeId(String value) => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;
  set product(ProductModel? value) => throw _privateConstructorUsedError;

  /// Serializes this BasketModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BasketModelCopyWith<BasketModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketModelCopyWith<$Res> {
  factory $BasketModelCopyWith(
    BasketModel value,
    $Res Function(BasketModel) then,
  ) = _$BasketModelCopyWithImpl<$Res, BasketModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String storeId,
    ProductModel? product,
  });

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$BasketModelCopyWithImpl<$Res, $Val extends BasketModel>
    implements $BasketModelCopyWith<$Res> {
  _$BasketModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? storeId = null,
    Object? product = freezed,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                freezed == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            storeId:
                null == storeId
                    ? _value.storeId
                    : storeId // ignore: cast_nullable_to_non_nullable
                        as String,
            product:
                freezed == product
                    ? _value.product
                    : product // ignore: cast_nullable_to_non_nullable
                        as ProductModel?,
          )
          as $Val,
    );
  }

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasketModelImplCopyWith<$Res>
    implements $BasketModelCopyWith<$Res> {
  factory _$$BasketModelImplCopyWith(
    _$BasketModelImpl value,
    $Res Function(_$BasketModelImpl) then,
  ) = __$$BasketModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String storeId,
    ProductModel? product,
  });

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$$BasketModelImplCopyWithImpl<$Res>
    extends _$BasketModelCopyWithImpl<$Res, _$BasketModelImpl>
    implements _$$BasketModelImplCopyWith<$Res> {
  __$$BasketModelImplCopyWithImpl(
    _$BasketModelImpl _value,
    $Res Function(_$BasketModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? storeId = null,
    Object? product = freezed,
  }) {
    return _then(
      _$BasketModelImpl(
        createdAt:
            freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        storeId:
            null == storeId
                ? _value.storeId
                : storeId // ignore: cast_nullable_to_non_nullable
                    as String,
        product:
            freezed == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                    as ProductModel?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BasketModelImpl implements _BasketModel {
  _$BasketModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    this.storeId = '',
    this.product,
  });

  factory _$BasketModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BasketModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String storeId;
  @override
  ProductModel? product;

  @override
  String toString() {
    return 'BasketModel(createdAt: $createdAt, id: $id, storeId: $storeId, product: $product)';
  }

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketModelImplCopyWith<_$BasketModelImpl> get copyWith =>
      __$$BasketModelImplCopyWithImpl<_$BasketModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BasketModelImplToJson(this);
  }
}

abstract class _BasketModel implements BasketModel {
  factory _BasketModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    String storeId,
    ProductModel? product,
  }) = _$BasketModelImpl;

  factory _BasketModel.fromJson(Map<String, dynamic> json) =
      _$BasketModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  String get storeId;
  set storeId(String value);
  @override
  ProductModel? get product;
  set product(ProductModel? value);

  /// Create a copy of BasketModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BasketModelImplCopyWith<_$BasketModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
