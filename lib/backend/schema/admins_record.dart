import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'admins_record.g.dart';

abstract class AdminsRecord
    implements Built<AdminsRecord, AdminsRecordBuilder> {
  static Serializer<AdminsRecord> get serializer => _$adminsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'admin_username')
  String get adminUsername;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'role_type')
  String get roleType;

  @nullable
  @BuiltValueField(wireName: 'full_name')
  String get fullName;

  @nullable
  @BuiltValueField(wireName: 'communication_email')
  String get communicationEmail;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AdminsRecordBuilder builder) => builder
    ..adminUsername = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..phoneNumber = ''
    ..roleType = ''
    ..fullName = ''
    ..communicationEmail = ''
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admins');

  static Stream<AdminsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AdminsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AdminsRecord._();
  factory AdminsRecord([void Function(AdminsRecordBuilder) updates]) =
      _$AdminsRecord;

  static AdminsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAdminsRecordData({
  String adminUsername,
  String email,
  String displayName,
  String photoUrl,
  DateTime createdTime,
  String phoneNumber,
  String roleType,
  String fullName,
  String communicationEmail,
  String uid,
}) =>
    serializers.toFirestore(
        AdminsRecord.serializer,
        AdminsRecord((a) => a
          ..adminUsername = adminUsername
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..roleType = roleType
          ..fullName = fullName
          ..communicationEmail = communicationEmail
          ..uid = uid));
