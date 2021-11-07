import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'history_record.g.dart';

abstract class HistoryRecord
    implements Built<HistoryRecord, HistoryRecordBuilder> {
  static Serializer<HistoryRecord> get serializer => _$historyRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Timestamp')
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'Severity')
  String get severity;

  @nullable
  @BuiltValueField(wireName: 'Score')
  int get score;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(HistoryRecordBuilder builder) => builder
    ..severity = ''
    ..score = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('History');

  static Stream<HistoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  HistoryRecord._();
  factory HistoryRecord([void Function(HistoryRecordBuilder) updates]) =
      _$HistoryRecord;

  static HistoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createHistoryRecordData({
  DateTime timestamp,
  String severity,
  int score,
}) =>
    serializers.toFirestore(
        HistoryRecord.serializer,
        HistoryRecord((h) => h
          ..timestamp = timestamp
          ..severity = severity
          ..score = score));
