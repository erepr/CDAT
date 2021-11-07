import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'csv_record.g.dart';

abstract class CsvRecord implements Built<CsvRecord, CsvRecordBuilder> {
  static Serializer<CsvRecord> get serializer => _$csvRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Wellbeing')
  String get wellbeing;

  @nullable
  @BuiltValueField(wireName: 'SiteDisease')
  String get siteDisease;

  @nullable
  @BuiltValueField(wireName: 'Appetite')
  String get appetite;

  @nullable
  @BuiltValueField(wireName: 'AvgTemp')
  int get avgTemp;

  @nullable
  @BuiltValueField(wireName: 'Above100F')
  String get above100F;

  @nullable
  @BuiltValueField(wireName: 'Vomit')
  String get vomit;

  @nullable
  @BuiltValueField(wireName: 'LiquidStools')
  String get liquidStools;

  @nullable
  @BuiltValueField(wireName: 'Diarrhea')
  String get diarrhea;

  @nullable
  @BuiltValueField(wireName: 'BowelMovements')
  String get bowelMovements;

  @nullable
  @BuiltValueField(wireName: 'Arthritis')
  String get arthritis;

  @nullable
  @BuiltValueField(wireName: 'Skin')
  String get skin;

  @nullable
  @BuiltValueField(wireName: 'Eye')
  String get eye;

  @nullable
  @BuiltValueField(wireName: 'AbdominalPain')
  String get abdominalPain;

  @nullable
  @BuiltValueField(wireName: 'Pain')
  String get pain;

  @nullable
  @BuiltValueField(wireName: 'PainAwake')
  String get painAwake;

  @nullable
  @BuiltValueField(wireName: 'AbdominalMass')
  String get abdominalMass;

  @nullable
  @BuiltValueField(wireName: 'AbdominalTenderness')
  String get abdominalTenderness;

  @nullable
  @BuiltValueField(wireName: 'Fissure')
  String get fissure;

  @nullable
  @BuiltValueField(wireName: 'Blood')
  String get blood;

  @nullable
  @BuiltValueField(wireName: 'Result')
  String get result;

  @nullable
  @BuiltValueField(wireName: 'BodyWeight')
  int get bodyWeight;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CsvRecordBuilder builder) => builder
    ..wellbeing = ''
    ..siteDisease = ''
    ..appetite = ''
    ..avgTemp = 0
    ..above100F = ''
    ..vomit = ''
    ..liquidStools = ''
    ..diarrhea = ''
    ..bowelMovements = ''
    ..arthritis = ''
    ..skin = ''
    ..eye = ''
    ..abdominalPain = ''
    ..pain = ''
    ..painAwake = ''
    ..abdominalMass = ''
    ..abdominalTenderness = ''
    ..fissure = ''
    ..blood = ''
    ..result = ''
    ..bodyWeight = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('csv');

  static Stream<CsvRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CsvRecord._();
  factory CsvRecord([void Function(CsvRecordBuilder) updates]) = _$CsvRecord;

  static CsvRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCsvRecordData({
  String wellbeing,
  String siteDisease,
  String appetite,
  int avgTemp,
  String above100F,
  String vomit,
  String liquidStools,
  String diarrhea,
  String bowelMovements,
  String arthritis,
  String skin,
  String eye,
  String abdominalPain,
  String pain,
  String painAwake,
  String abdominalMass,
  String abdominalTenderness,
  String fissure,
  String blood,
  String result,
  int bodyWeight,
}) =>
    serializers.toFirestore(
        CsvRecord.serializer,
        CsvRecord((c) => c
          ..wellbeing = wellbeing
          ..siteDisease = siteDisease
          ..appetite = appetite
          ..avgTemp = avgTemp
          ..above100F = above100F
          ..vomit = vomit
          ..liquidStools = liquidStools
          ..diarrhea = diarrhea
          ..bowelMovements = bowelMovements
          ..arthritis = arthritis
          ..skin = skin
          ..eye = eye
          ..abdominalPain = abdominalPain
          ..pain = pain
          ..painAwake = painAwake
          ..abdominalMass = abdominalMass
          ..abdominalTenderness = abdominalTenderness
          ..fissure = fissure
          ..blood = blood
          ..result = result
          ..bodyWeight = bodyWeight));
