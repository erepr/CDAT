import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctor_record.g.dart';

abstract class DoctorRecord
    implements Built<DoctorRecord, DoctorRecordBuilder> {
  static Serializer<DoctorRecord> get serializer => _$doctorRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DoctorRecordBuilder builder) =>
      builder..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Doctor');

  static Stream<DoctorRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DoctorRecord._();
  factory DoctorRecord([void Function(DoctorRecordBuilder) updates]) =
      _$DoctorRecord;

  static DoctorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDoctorRecordData({
  String name,
}) =>
    serializers.toFirestore(
        DoctorRecord.serializer, DoctorRecord((d) => d..name = name));
