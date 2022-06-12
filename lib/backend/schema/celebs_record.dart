import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'celebs_record.g.dart';

abstract class CelebsRecord
    implements Built<CelebsRecord, CelebsRecordBuilder> {
  static Serializer<CelebsRecord> get serializer => _$celebsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'celeb_name')
  String get celebName;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'post_ids')
  BuiltList<DocumentReference> get postIds;

  @nullable
  String get rid;

  @nullable
  @BuiltValueField(wireName: 'created_by')
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CelebsRecordBuilder builder) => builder
    ..celebName = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..postIds = ListBuilder()
    ..rid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('celebs');

  static Stream<CelebsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CelebsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CelebsRecord._();
  factory CelebsRecord([void Function(CelebsRecordBuilder) updates]) =
      _$CelebsRecord;

  static CelebsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCelebsRecordData({
  String celebName,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String rid,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        CelebsRecord.serializer,
        CelebsRecord((c) => c
          ..celebName = celebName
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..postIds = null
          ..rid = rid
          ..createdBy = createdBy));
