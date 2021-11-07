import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'patient_record.g.dart';

abstract class PatientRecord
    implements Built<PatientRecord, PatientRecordBuilder> {
  static Serializer<PatientRecord> get serializer => _$patientRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'Timestamp')
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'Wellbeing')
  String get wellbeing;

  @nullable
  @BuiltValueField(wireName: 'SiteDisease')
  String get siteDisease;

  @nullable
  @BuiltValueField(wireName: 'Bodyweight')
  int get bodyweight;

  @nullable
  @BuiltValueField(wireName: 'Appetite')
  String get appetite;

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
  @BuiltValueField(wireName: 'AvgTemp')
  int get avgTemp;

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
  @BuiltValueField(wireName: 'LiquidStoolsScore')
  int get liquidStoolsScore;

  @nullable
  @BuiltValueField(wireName: 'AbdominalPainScore')
  int get abdominalPainScore;

  @nullable
  @BuiltValueField(wireName: 'WellbeingScore')
  int get wellbeingScore;

  @nullable
  @BuiltValueField(wireName: 'ArthritisScore')
  int get arthritisScore;

  @nullable
  @BuiltValueField(wireName: 'EyeScore')
  int get eyeScore;

  @nullable
  @BuiltValueField(wireName: 'SkinScore')
  int get skinScore;

  @nullable
  @BuiltValueField(wireName: 'FissureScore')
  int get fissureScore;

  @nullable
  @BuiltValueField(wireName: 'Above100FScore')
  int get above100FScore;

  @nullable
  @BuiltValueField(wireName: 'DiarrheaScore')
  int get diarrheaScore;

  @nullable
  @BuiltValueField(wireName: 'AbdominalMassScore')
  int get abdominalMassScore;

  @nullable
  @BuiltValueField(wireName: 'BodyWeightScore')
  int get bodyWeightScore;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PatientRecordBuilder builder) => builder
    ..name = ''
    ..wellbeing = ''
    ..siteDisease = ''
    ..bodyweight = 0
    ..appetite = ''
    ..above100F = ''
    ..vomit = ''
    ..liquidStools = ''
    ..diarrhea = ''
    ..avgTemp = 0
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
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..liquidStoolsScore = 0
    ..abdominalPainScore = 0
    ..wellbeingScore = 0
    ..arthritisScore = 0
    ..eyeScore = 0
    ..skinScore = 0
    ..fissureScore = 0
    ..above100FScore = 0
    ..diarrheaScore = 0
    ..abdominalMassScore = 0
    ..bodyWeightScore = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Patient');

  static Stream<PatientRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PatientRecord._();
  factory PatientRecord([void Function(PatientRecordBuilder) updates]) =
      _$PatientRecord;

  static PatientRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPatientRecordData({
  String name,
  DateTime timestamp,
  String wellbeing,
  String siteDisease,
  int bodyweight,
  String appetite,
  String above100F,
  String vomit,
  String liquidStools,
  String diarrhea,
  int avgTemp,
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
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  int liquidStoolsScore,
  int abdominalPainScore,
  int wellbeingScore,
  int arthritisScore,
  int eyeScore,
  int skinScore,
  int fissureScore,
  int above100FScore,
  int diarrheaScore,
  int abdominalMassScore,
  int bodyWeightScore,
}) =>
    serializers.toFirestore(
        PatientRecord.serializer,
        PatientRecord((p) => p
          ..name = name
          ..timestamp = timestamp
          ..wellbeing = wellbeing
          ..siteDisease = siteDisease
          ..bodyweight = bodyweight
          ..appetite = appetite
          ..above100F = above100F
          ..vomit = vomit
          ..liquidStools = liquidStools
          ..diarrhea = diarrhea
          ..avgTemp = avgTemp
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
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..liquidStoolsScore = liquidStoolsScore
          ..abdominalPainScore = abdominalPainScore
          ..wellbeingScore = wellbeingScore
          ..arthritisScore = arthritisScore
          ..eyeScore = eyeScore
          ..skinScore = skinScore
          ..fissureScore = fissureScore
          ..above100FScore = above100FScore
          ..diarrheaScore = diarrheaScore
          ..abdominalMassScore = abdominalMassScore
          ..bodyWeightScore = bodyWeightScore));
