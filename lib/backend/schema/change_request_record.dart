import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'change_request_record.g.dart';

abstract class ChangeRequestRecord
    implements Built<ChangeRequestRecord, ChangeRequestRecordBuilder> {
  static Serializer<ChangeRequestRecord> get serializer =>
      _$changeRequestRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'request_text')
  String get requestText;

  @nullable
  @BuiltValueField(wireName: 'request_time')
  DateTime get requestTime;

  @nullable
  @BuiltValueField(wireName: 'history_post_id')
  DocumentReference get historyPostId;

  @nullable
  bool get isSeen;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChangeRequestRecordBuilder builder) => builder
    ..requestText = ''
    ..isSeen = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('change_request');

  static Stream<ChangeRequestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChangeRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChangeRequestRecord._();
  factory ChangeRequestRecord(
          [void Function(ChangeRequestRecordBuilder) updates]) =
      _$ChangeRequestRecord;

  static ChangeRequestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChangeRequestRecordData({
  String requestText,
  DateTime requestTime,
  DocumentReference historyPostId,
  bool isSeen,
}) =>
    serializers.toFirestore(
        ChangeRequestRecord.serializer,
        ChangeRequestRecord((c) => c
          ..requestText = requestText
          ..requestTime = requestTime
          ..historyPostId = historyPostId
          ..isSeen = isSeen));
