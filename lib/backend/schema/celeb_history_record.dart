import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'celeb_history_record.g.dart';

abstract class CelebHistoryRecord
    implements Built<CelebHistoryRecord, CelebHistoryRecordBuilder> {
  static Serializer<CelebHistoryRecord> get serializer =>
      _$celebHistoryRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'section_name')
  String get sectionName;

  @nullable
  @BuiltValueField(wireName: 'celeb_uid')
  DocumentReference get celebUid;

  @nullable
  @BuiltValueField(wireName: 'post_title')
  String get postTitle;

  @nullable
  @BuiltValueField(wireName: 'post_description')
  String get postDescription;

  @nullable
  @BuiltValueField(wireName: 'chrono_date')
  DateTime get chronoDate;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  bool get isApproved;

  @nullable
  @BuiltValueField(wireName: 'media_image')
  BuiltList<String> get mediaImage;

  @nullable
  @BuiltValueField(wireName: 'media_video')
  BuiltList<String> get mediaVideo;

  @nullable
  @BuiltValueField(wireName: 'post_year')
  int get postYear;

  @nullable
  @BuiltValueField(wireName: 'subsection_name')
  String get subsectionName;

  @nullable
  bool get isReviewed;

  @nullable
  @BuiltValueField(wireName: 'change_requests')
  BuiltList<DocumentReference> get changeRequests;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CelebHistoryRecordBuilder builder) => builder
    ..sectionName = ''
    ..postTitle = ''
    ..postDescription = ''
    ..isApproved = false
    ..mediaImage = ListBuilder()
    ..mediaVideo = ListBuilder()
    ..postYear = 0
    ..subsectionName = ''
    ..isReviewed = false
    ..changeRequests = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('celeb_history');

  static Stream<CelebHistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CelebHistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CelebHistoryRecord._();
  factory CelebHistoryRecord(
          [void Function(CelebHistoryRecordBuilder) updates]) =
      _$CelebHistoryRecord;

  static CelebHistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCelebHistoryRecordData({
  String sectionName,
  DocumentReference celebUid,
  String postTitle,
  String postDescription,
  DateTime chronoDate,
  DateTime createdTime,
  bool isApproved,
  int postYear,
  String subsectionName,
  bool isReviewed,
}) =>
    serializers.toFirestore(
        CelebHistoryRecord.serializer,
        CelebHistoryRecord((c) => c
          ..sectionName = sectionName
          ..celebUid = celebUid
          ..postTitle = postTitle
          ..postDescription = postDescription
          ..chronoDate = chronoDate
          ..createdTime = createdTime
          ..isApproved = isApproved
          ..mediaImage = null
          ..mediaVideo = null
          ..postYear = postYear
          ..subsectionName = subsectionName
          ..isReviewed = isReviewed
          ..changeRequests = null));
