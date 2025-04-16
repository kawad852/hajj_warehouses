// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  @TimestampSerializer()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampSerializer()
  set createdAt(DateTime value) => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  set id(String value) => throw _privateConstructorUsedError;
  String get nameEn => throw _privateConstructorUsedError;
  set nameEn(String value) => throw _privateConstructorUsedError;
  String get nameAr => throw _privateConstructorUsedError;
  set nameAr(String value) => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  set type(String value) => throw _privateConstructorUsedError;
  PostData get item => throw _privateConstructorUsedError;
  set item(PostData value) => throw _privateConstructorUsedError;
  List<PostData> get items => throw _privateConstructorUsedError;
  set items(List<PostData> value) =>
      throw _privateConstructorUsedError; //carousel
  int get order => throw _privateConstructorUsedError; //carousel
  set order(int value) => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  set published(bool value) => throw _privateConstructorUsedError;

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call({
    @TimestampSerializer() DateTime createdAt,
    String id,
    String nameEn,
    String nameAr,
    String type,
    PostData item,
    List<PostData> items,
    int order,
    bool published,
  });

  $PostDataCopyWith<$Res> get item;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? type = null,
    Object? item = null,
    Object? items = null,
    Object? order = null,
    Object? published = null,
  }) {
    return _then(
      _value.copyWith(
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            nameEn:
                null == nameEn
                    ? _value.nameEn
                    : nameEn // ignore: cast_nullable_to_non_nullable
                        as String,
            nameAr:
                null == nameAr
                    ? _value.nameAr
                    : nameAr // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            item:
                null == item
                    ? _value.item
                    : item // ignore: cast_nullable_to_non_nullable
                        as PostData,
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<PostData>,
            order:
                null == order
                    ? _value.order
                    : order // ignore: cast_nullable_to_non_nullable
                        as int,
            published:
                null == published
                    ? _value.published
                    : published // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostDataCopyWith<$Res> get item {
    return $PostDataCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostModelImplCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$$PostModelImplCopyWith(
    _$PostModelImpl value,
    $Res Function(_$PostModelImpl) then,
  ) = __$$PostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @TimestampSerializer() DateTime createdAt,
    String id,
    String nameEn,
    String nameAr,
    String type,
    PostData item,
    List<PostData> items,
    int order,
    bool published,
  });

  @override
  $PostDataCopyWith<$Res> get item;
}

/// @nodoc
class __$$PostModelImplCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$PostModelImpl>
    implements _$$PostModelImplCopyWith<$Res> {
  __$$PostModelImplCopyWithImpl(
    _$PostModelImpl _value,
    $Res Function(_$PostModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? id = null,
    Object? nameEn = null,
    Object? nameAr = null,
    Object? type = null,
    Object? item = null,
    Object? items = null,
    Object? order = null,
    Object? published = null,
  }) {
    return _then(
      _$PostModelImpl(
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        nameEn:
            null == nameEn
                ? _value.nameEn
                : nameEn // ignore: cast_nullable_to_non_nullable
                    as String,
        nameAr:
            null == nameAr
                ? _value.nameAr
                : nameAr // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        item:
            null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                    as PostData,
        items:
            null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<PostData>,
        order:
            null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                    as int,
        published:
            null == published
                ? _value.published
                : published // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostModelImpl implements _PostModel {
  _$PostModelImpl({
    @TimestampSerializer() required this.createdAt,
    this.id = '',
    this.nameEn = '',
    this.nameAr = '',
    this.type = '',
    this.item = const PostData(),
    this.items = const [],
    this.order = 0,
    this.published = true,
  });

  factory _$PostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostModelImplFromJson(json);

  @override
  @TimestampSerializer()
  DateTime createdAt;
  @override
  @JsonKey()
  String id;
  @override
  @JsonKey()
  String nameEn;
  @override
  @JsonKey()
  String nameAr;
  @override
  @JsonKey()
  String type;
  @override
  @JsonKey()
  PostData item;
  @override
  @JsonKey()
  List<PostData> items;
  //carousel
  @override
  @JsonKey()
  int order;
  @override
  @JsonKey()
  bool published;

  @override
  String toString() {
    return 'PostModel(createdAt: $createdAt, id: $id, nameEn: $nameEn, nameAr: $nameAr, type: $type, item: $item, items: $items, order: $order, published: $published)';
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      __$$PostModelImplCopyWithImpl<_$PostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostModelImplToJson(this);
  }
}

abstract class _PostModel implements PostModel {
  factory _PostModel({
    @TimestampSerializer() required DateTime createdAt,
    String id,
    String nameEn,
    String nameAr,
    String type,
    PostData item,
    List<PostData> items,
    int order,
    bool published,
  }) = _$PostModelImpl;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$PostModelImpl.fromJson;

  @override
  @TimestampSerializer()
  DateTime get createdAt;
  @TimestampSerializer()
  set createdAt(DateTime value);
  @override
  String get id;
  set id(String value);
  @override
  String get nameEn;
  set nameEn(String value);
  @override
  String get nameAr;
  set nameAr(String value);
  @override
  String get type;
  set type(String value);
  @override
  PostData get item;
  set item(PostData value);
  @override
  List<PostData> get items;
  set items(List<PostData> value); //carousel
  @override
  int get order; //carousel
  set order(int value);
  @override
  bool get published;
  set published(bool value);

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostModelImplCopyWith<_$PostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostData _$PostDataFromJson(Map<String, dynamic> json) {
  return _PostData.fromJson(json);
}

/// @nodoc
mixin _$PostData {
  String get thumbnail => throw _privateConstructorUsedError;
  set thumbnail(String value) => throw _privateConstructorUsedError;
  List<String> get categoryIds => throw _privateConstructorUsedError;
  set categoryIds(List<String> value) => throw _privateConstructorUsedError;

  /// Serializes this PostData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDataCopyWith<PostData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDataCopyWith<$Res> {
  factory $PostDataCopyWith(PostData value, $Res Function(PostData) then) =
      _$PostDataCopyWithImpl<$Res, PostData>;
  @useResult
  $Res call({String thumbnail, List<String> categoryIds});
}

/// @nodoc
class _$PostDataCopyWithImpl<$Res, $Val extends PostData>
    implements $PostDataCopyWith<$Res> {
  _$PostDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thumbnail = null, Object? categoryIds = null}) {
    return _then(
      _value.copyWith(
            thumbnail:
                null == thumbnail
                    ? _value.thumbnail
                    : thumbnail // ignore: cast_nullable_to_non_nullable
                        as String,
            categoryIds:
                null == categoryIds
                    ? _value.categoryIds
                    : categoryIds // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PostDataImplCopyWith<$Res>
    implements $PostDataCopyWith<$Res> {
  factory _$$PostDataImplCopyWith(
    _$PostDataImpl value,
    $Res Function(_$PostDataImpl) then,
  ) = __$$PostDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String thumbnail, List<String> categoryIds});
}

/// @nodoc
class __$$PostDataImplCopyWithImpl<$Res>
    extends _$PostDataCopyWithImpl<$Res, _$PostDataImpl>
    implements _$$PostDataImplCopyWith<$Res> {
  __$$PostDataImplCopyWithImpl(
    _$PostDataImpl _value,
    $Res Function(_$PostDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thumbnail = null, Object? categoryIds = null}) {
    return _then(
      _$PostDataImpl(
        thumbnail:
            null == thumbnail
                ? _value.thumbnail
                : thumbnail // ignore: cast_nullable_to_non_nullable
                    as String,
        categoryIds:
            null == categoryIds
                ? _value.categoryIds
                : categoryIds // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PostDataImpl implements _PostData {
  const _$PostDataImpl({this.thumbnail = '', this.categoryIds = const []});

  factory _$PostDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDataImplFromJson(json);

  @override
  @JsonKey()
  String thumbnail;
  @override
  @JsonKey()
  List<String> categoryIds;

  @override
  String toString() {
    return 'PostData(thumbnail: $thumbnail, categoryIds: $categoryIds)';
  }

  /// Create a copy of PostData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDataImplCopyWith<_$PostDataImpl> get copyWith =>
      __$$PostDataImplCopyWithImpl<_$PostDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDataImplToJson(this);
  }
}

abstract class _PostData implements PostData {
  const factory _PostData({String thumbnail, List<String> categoryIds}) =
      _$PostDataImpl;

  factory _PostData.fromJson(Map<String, dynamic> json) =
      _$PostDataImpl.fromJson;

  @override
  String get thumbnail;
  set thumbnail(String value);
  @override
  List<String> get categoryIds;
  set categoryIds(List<String> value);

  /// Create a copy of PostData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDataImplCopyWith<_$PostDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
