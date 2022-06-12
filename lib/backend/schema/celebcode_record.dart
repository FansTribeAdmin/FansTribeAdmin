import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'celebcode_record.g.dart';

abstract class CelebcodeRecord
    implements Built<CelebcodeRecord, CelebcodeRecordBuilder> {
  static Serializer<CelebcodeRecord> get serializer =>
      _$celebcodeRecordSerializer;

  @nullable
  String get rid;

  @nullable
  @BuiltValueField(wireName: 'celeb_name')
  String get celebName;

  @nullable
  @BuiltValueField(wireName: 'celeb_photo_url')
  String get celebPhotoUrl;

  @nullable
  String get code;

  @nullable
  int get count;

  @nullable
  @BuiltValueField(wireName: 'used_count')
  int get usedCount;

  @nullable
  bool get isActive;

  @nullable
  DateTime get expiryDate;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CelebcodeRecordBuilder builder) => builder
    ..rid = ''
    ..celebName = ''
    ..celebPhotoUrl = ''
    ..code = ''
    ..count = 0
    ..usedCount = 0
    ..isActive = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('celebcode');

  static Stream<CelebcodeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CelebcodeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CelebcodeRecord._();
  factory CelebcodeRecord([void Function(CelebcodeRecordBuilder) updates]) =
      _$CelebcodeRecord;

  static CelebcodeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCelebcodeRecordData({
  String rid,
  String celebName,
  String celebPhotoUrl,
  String code,
  int count,
  int usedCount,
  bool isActive,
  DateTime expiryDate,
  DateTime createdTime,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        CelebcodeRecord.serializer,
        CelebcodeRecord((c) => c
          ..rid = rid
          ..celebName = celebName
          ..celebPhotoUrl = celebPhotoUrl
          ..code = code
          ..count = count
          ..usedCount = usedCount
          ..isActive = isActive
          ..expiryDate = expiryDate
          ..createdTime = createdTime
          ..createdBy = createdBy));
