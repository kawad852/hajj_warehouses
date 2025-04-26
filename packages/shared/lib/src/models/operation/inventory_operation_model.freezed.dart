// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_operation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InventoryOperationModel _$InventoryOperationModelFromJson(
  Map<String, dynamic> json,
) {
  return _InventoryOperationModel.fromJson(json);
}

/// @nodoc
mixin _$InventoryOperationModel {
  @TimestampSerializer()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime? value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  LightUserModel get user => throw _privateConstructorUsedError;
  set user(LightUserModel value) => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  set branchId(String value) => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  set notes(String? value) => throw _privateConstructorUsedError;
  String? get supplyType => throw _privateConstructorUsedError;
  set supplyType(String? value) => throw _privateConstructorUsedError;
  String? get requestType => throw _privateConstructorUsedError;
  set requestType(String? value) => throw _privateConstructorUsedError;
  String? get destroyReason => throw _privateConstructorUsedError;
  set destroyReason(String? value) => throw _privateConstructorUsedError;
  String? get transferFromBranchId => throw _privateConstructorUsedError;
  set transferFromBranchId(String? value) => throw _privateConstructorUsedError;
  String? get transferToBranchId => throw _privateConstructorUsedError;
  set transferToBranchId(String? value) => throw _privateConstructorUsedError;
  String get operationType => throw _privateConstructorUsedError;
  set operationType(String value) => throw _privateConstructorUsedError;
  double get totalPayment => throw _privateConstructorUsedError;
  set totalPayment(double value) => throw _privateConstructorUsedError;
  List<LightItemModel> get items => throw _privateConstructorUsedError;
  set items(List<LightItemModel> value) => throw _privateConstructorUsedError;
  List<String> get itemIds => throw _privateConstructorUsedError;
  set itemIds(List<String> value) => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  set images(List<String> value) => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? get files => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set files(List<XFile>? value) => throw _privateConstructorUsedError;

  /// Serializes this InventoryOperationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InventoryOperationModelCopyWith<InventoryOperationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryOperationModelCopyWith<$Res> {
  factory $InventoryOperationModelCopyWith(
    InventoryOperationModel value,
    $Res Function(InventoryOperationModel) then,
  ) = _$InventoryOperationModelCopyWithImpl<$Res, InventoryOperationModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    LightUserModel user,
    String branchId,
    String? notes,
    String? supplyType,
    String? requestType,
    String? destroyReason,
    String? transferFromBranchId,
    String? transferToBranchId,
    String operationType,
    double totalPayment,
    List<LightItemModel> items,
    List<String> itemIds,
    List<String> images,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  });

  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$InventoryOperationModelCopyWithImpl<
  $Res,
  $Val extends InventoryOperationModel
>
    implements $InventoryOperationModelCopyWith<$Res> {
  _$InventoryOperationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? user = null,
    Object? branchId = null,
    Object? notes = freezed,
    Object? supplyType = freezed,
    Object? requestType = freezed,
    Object? destroyReason = freezed,
    Object? transferFromBranchId = freezed,
    Object? transferToBranchId = freezed,
    Object? operationType = null,
    Object? totalPayment = null,
    Object? items = null,
    Object? itemIds = null,
    Object? images = null,
    Object? files = freezed,
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
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as LightUserModel,
            branchId:
                null == branchId
                    ? _value.branchId
                    : branchId // ignore: cast_nullable_to_non_nullable
                        as String,
            notes:
                freezed == notes
                    ? _value.notes
                    : notes // ignore: cast_nullable_to_non_nullable
                        as String?,
            supplyType:
                freezed == supplyType
                    ? _value.supplyType
                    : supplyType // ignore: cast_nullable_to_non_nullable
                        as String?,
            requestType:
                freezed == requestType
                    ? _value.requestType
                    : requestType // ignore: cast_nullable_to_non_nullable
                        as String?,
            destroyReason:
                freezed == destroyReason
                    ? _value.destroyReason
                    : destroyReason // ignore: cast_nullable_to_non_nullable
                        as String?,
            transferFromBranchId:
                freezed == transferFromBranchId
                    ? _value.transferFromBranchId
                    : transferFromBranchId // ignore: cast_nullable_to_non_nullable
                        as String?,
            transferToBranchId:
                freezed == transferToBranchId
                    ? _value.transferToBranchId
                    : transferToBranchId // ignore: cast_nullable_to_non_nullable
                        as String?,
            operationType:
                null == operationType
                    ? _value.operationType
                    : operationType // ignore: cast_nullable_to_non_nullable
                        as String,
            totalPayment:
                null == totalPayment
                    ? _value.totalPayment
                    : totalPayment // ignore: cast_nullable_to_non_nullable
                        as double,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<LightItemModel>,
            itemIds:
                null == itemIds
                    ? _value.itemIds
                    : itemIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            images:
                null == images
                    ? _value.images
                    : images // ignore: cast_nullable_to_non_nullable
                        as List<String>,
            files:
                freezed == files
                    ? _value.files
                    : files // ignore: cast_nullable_to_non_nullable
                        as List<XFile>?,
          )
          as $Val,
    );
  }

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserModelCopyWith<$Res> get user {
    return $LightUserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InventoryOperationModelImplCopyWith<$Res>
    implements $InventoryOperationModelCopyWith<$Res> {
  factory _$$InventoryOperationModelImplCopyWith(
    _$InventoryOperationModelImpl value,
    $Res Function(_$InventoryOperationModelImpl) then,
  ) = __$$InventoryOperationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    LightUserModel user,
    String branchId,
    String? notes,
    String? supplyType,
    String? requestType,
    String? destroyReason,
    String? transferFromBranchId,
    String? transferToBranchId,
    String operationType,
    double totalPayment,
    List<LightItemModel> items,
    List<String> itemIds,
    List<String> images,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  });

  @override
  $LightUserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$InventoryOperationModelImplCopyWithImpl<$Res>
    extends
        _$InventoryOperationModelCopyWithImpl<
          $Res,
          _$InventoryOperationModelImpl
        >
    implements _$$InventoryOperationModelImplCopyWith<$Res> {
  __$$InventoryOperationModelImplCopyWithImpl(
    _$InventoryOperationModelImpl _value,
    $Res Function(_$InventoryOperationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? id = null,
    Object? user = null,
    Object? branchId = null,
    Object? notes = freezed,
    Object? supplyType = freezed,
    Object? requestType = freezed,
    Object? destroyReason = freezed,
    Object? transferFromBranchId = freezed,
    Object? transferToBranchId = freezed,
    Object? operationType = null,
    Object? totalPayment = null,
    Object? items = null,
    Object? itemIds = null,
    Object? images = null,
    Object? files = freezed,
  }) {
    return _then(
      _$InventoryOperationModelImpl(
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
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as LightUserModel,
        branchId:
            null == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                    as String,
        notes:
            freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                    as String?,
        supplyType:
            freezed == supplyType
                ? _value.supplyType
                : supplyType // ignore: cast_nullable_to_non_nullable
                    as String?,
        requestType:
            freezed == requestType
                ? _value.requestType
                : requestType // ignore: cast_nullable_to_non_nullable
                    as String?,
        destroyReason:
            freezed == destroyReason
                ? _value.destroyReason
                : destroyReason // ignore: cast_nullable_to_non_nullable
                    as String?,
        transferFromBranchId:
            freezed == transferFromBranchId
                ? _value.transferFromBranchId
                : transferFromBranchId // ignore: cast_nullable_to_non_nullable
                    as String?,
        transferToBranchId:
            freezed == transferToBranchId
                ? _value.transferToBranchId
                : transferToBranchId // ignore: cast_nullable_to_non_nullable
                    as String?,
        operationType:
            null == operationType
                ? _value.operationType
                : operationType // ignore: cast_nullable_to_non_nullable
                    as String,
        totalPayment:
            null == totalPayment
                ? _value.totalPayment
                : totalPayment // ignore: cast_nullable_to_non_nullable
                    as double,
        items:
            null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<LightItemModel>,
        itemIds:
            null == itemIds
                ? _value.itemIds
                : itemIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        images:
            null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                    as List<String>,
        files:
            freezed == files
                ? _value.files
                : files // ignore: cast_nullable_to_non_nullable
                    as List<XFile>?,
      ),
    );
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$InventoryOperationModelImpl extends _InventoryOperationModel {
  _$InventoryOperationModelImpl({
    @TimestampSerializer() this.createdAt,
    this.id = '',
    required this.user,
    required this.branchId,
    this.notes,
    this.supplyType,
    this.requestType,
    this.destroyReason,
    this.transferFromBranchId,
    this.transferToBranchId,
    required this.operationType,
    this.totalPayment = 0.0,
    required this.items,
    this.itemIds = const [],
    this.images = const [],
    @JsonKey(includeToJson: false, includeFromJson: false) this.files,
  }) : super._();

  factory _$InventoryOperationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryOperationModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime? createdAt;
  @override
  @JsonKey()
  String id;
  @override
  LightUserModel user;
  @override
  String branchId;
  @override
  String? notes;
  @override
  String? supplyType;
  @override
  String? requestType;
  @override
  String? destroyReason;
  @override
  String? transferFromBranchId;
  @override
  String? transferToBranchId;
  @override
  String operationType;
  @override
  @JsonKey()
  double totalPayment;
  @override
  List<LightItemModel> items;
  @override
  @JsonKey()
  List<String> itemIds;
  @override
  @JsonKey()
  List<String> images;
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? files;

  @override
  String toString() {
    return 'InventoryOperationModel(createdAt: $createdAt, id: $id, user: $user, branchId: $branchId, notes: $notes, supplyType: $supplyType, requestType: $requestType, destroyReason: $destroyReason, transferFromBranchId: $transferFromBranchId, transferToBranchId: $transferToBranchId, operationType: $operationType, totalPayment: $totalPayment, items: $items, itemIds: $itemIds, images: $images, files: $files)';
  }

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryOperationModelImplCopyWith<_$InventoryOperationModelImpl>
  get copyWith => __$$InventoryOperationModelImplCopyWithImpl<
    _$InventoryOperationModelImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryOperationModelImplToJson(this);
  }
}

abstract class _InventoryOperationModel extends InventoryOperationModel {
  factory _InventoryOperationModel({
    @TimestampSerializer() DateTime? createdAt,
    String id,
    required LightUserModel user,
    required String branchId,
    String? notes,
    String? supplyType,
    String? requestType,
    String? destroyReason,
    String? transferFromBranchId,
    String? transferToBranchId,
    required String operationType,
    double totalPayment,
    required List<LightItemModel> items,
    List<String> itemIds,
    List<String> images,
    @JsonKey(includeToJson: false, includeFromJson: false) List<XFile>? files,
  }) = _$InventoryOperationModelImpl;
  _InventoryOperationModel._() : super._();

  factory _InventoryOperationModel.fromJson(Map<String, dynamic> json) =
      _$InventoryOperationModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime? get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime? value);
  @override
  String get id;
  set id(String value);
  @override
  LightUserModel get user;
  set user(LightUserModel value);
  @override
  String get branchId;
  set branchId(String value);
  @override
  String? get notes;
  set notes(String? value);
  @override
  String? get supplyType;
  set supplyType(String? value);
  @override
  String? get requestType;
  set requestType(String? value);
  @override
  String? get destroyReason;
  set destroyReason(String? value);
  @override
  String? get transferFromBranchId;
  set transferFromBranchId(String? value);
  @override
  String? get transferToBranchId;
  set transferToBranchId(String? value);
  @override
  String get operationType;
  set operationType(String value);
  @override
  double get totalPayment;
  set totalPayment(double value);
  @override
  List<LightItemModel> get items;
  set items(List<LightItemModel> value);
  @override
  List<String> get itemIds;
  set itemIds(List<String> value);
  @override
  List<String> get images;
  set images(List<String> value);
  @override
  @JsonKey(includeToJson: false, includeFromJson: false)
  List<XFile>? get files;
  @JsonKey(includeToJson: false, includeFromJson: false)
  set files(List<XFile>? value);

  /// Create a copy of InventoryOperationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InventoryOperationModelImplCopyWith<_$InventoryOperationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
