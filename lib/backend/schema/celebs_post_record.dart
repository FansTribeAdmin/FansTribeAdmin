import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'celebs_post_record.g.dart';

abstract class CelebsPostRecord
    implements Built<CelebsPostRecord, CelebsPostRecordBuilder> {
  static Serializer<CelebsPostRecord> get serializer =>
      _$celebsPostRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'celeb_uid')
  DocumentReference get celebUid;

  @nullable
  @BuiltValueField(wireName: 'post_image')
  String get postImage;

  @nullable
  @BuiltValueField(wireName: 'post_video')
  String get postVideo;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  bool get isScheduled;

  @nullable
  @BuiltValueField(wireName: 'scheduled_time')
  DateTime get scheduledTime;

  @nullable
  @BuiltValueField(wireName: 'post_caption')
  String get postCaption;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CelebsPostRecordBuilder builder) => builder
    ..postImage = ''
    ..postVideo = ''
    ..isScheduled = false
    ..postCaption = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('celebs_post');

  static Stream<CelebsPostRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CelebsPostRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CelebsPostRecord._();
  factory CelebsPostRecord([void Function(CelebsPostRecordBuilder) updates]) =
      _$CelebsPostRecord;

  static CelebsPostRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCelebsPostRecordData({
  DocumentReference celebUid,
  String postImage,
  String postVideo,
  DateTime createdTime,
  bool isScheduled,
  DateTime scheduledTime,
  String postCaption,
}) =>
    serializers.toFirestore(
        CelebsPostRecord.serializer,
        CelebsPostRecord((c) => c
          ..celebUid = celebUid
          ..postImage = postImage
          ..postVideo = postVideo
          ..createdTime = createdTime
          ..isScheduled = isScheduled
          ..scheduledTime = scheduledTime
          ..postCaption = postCaption));
