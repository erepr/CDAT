import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'doctor_record.g.dart';

abstract class DoctorRecord
    implements Built<DoctorRecord, DoctorRecordBuilder> {
  static Serializer<DoctorRecord> get serializer => _$doctorRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'PatientName')
  String get patientName;

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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DoctorRecordBuilder builder) => builder
    ..patientName = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..wellbeing = ''
    ..siteDisease = ''
    ..bodyweight = 0
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
    ..blood = '';

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
  String patientName,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String wellbeing,
  String siteDisease,
  int bodyweight,
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
}) =>
    serializers.toFirestore(
        DoctorRecord.serializer,
        DoctorRecord((d) => d
          ..patientName = patientName
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..wellbeing = wellbeing
          ..siteDisease = siteDisease
          ..bodyweight = bodyweight
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
          ..blood = blood));
