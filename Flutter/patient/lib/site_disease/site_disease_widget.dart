import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../bodyweight/bodyweight_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SiteDiseaseWidget extends StatefulWidget {
  SiteDiseaseWidget({Key key}) : super(key: key);

  @override
  _SiteDiseaseWidgetState createState() => _SiteDiseaseWidgetState();
}

class _SiteDiseaseWidgetState extends State<SiteDiseaseWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PatientRecord>(
      stream: PatientRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.primaryColor,
              ),
            ),
          );
        }
        final siteDiseasePatientRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFF5F5F5),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 45, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Site of Crohn\'s Disease?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 25, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              onTap: () async {
                                final patientUpdateData =
                                    createPatientRecordData(
                                  siteDisease: 'Small Bowel',
                                );
                                await siteDiseasePatientRecord.reference
                                    .update(patientUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BodyweightWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF7F7F7),
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: Image.asset(
                                      'assets/images/ml88i_4.png',
                                    ).image,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                              child: Text(
                                'Small Bowel',
                                style: FlutterFlowTheme.subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF1A1F24),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () async {
                              final patientUpdateData = createPatientRecordData(
                                siteDisease: 'Large Bowel',
                              );
                              await siteDiseasePatientRecord.reference
                                  .update(patientUpdateData);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BodyweightWidget(),
                                ),
                              );
                            },
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F7F7),
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: Image.asset(
                                    'assets/images/albfo_3.png',
                                  ).image,
                                ),
                                shape: BoxShape.rectangle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 7, 0, 0),
                            child: Text(
                              'Large Bowel',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF1A1F24),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 60, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          final patientUpdateData = createPatientRecordData(
                            siteDisease: 'Both/Mixed',
                          );
                          await siteDiseasePatientRecord.reference
                              .update(patientUpdateData);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BodyweightWidget(),
                            ),
                          );
                        },
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                            image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: Image.asset(
                                'assets/images/intestine_(2).png',
                              ).image,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 7, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Both / Mixed',
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFF1A1F24),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '(Press on icon to continue) ',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0x98757575),
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
