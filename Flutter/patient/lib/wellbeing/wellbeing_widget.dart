import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../site_disease/site_disease_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WellbeingWidget extends StatefulWidget {
  WellbeingWidget({Key key}) : super(key: key);

  @override
  _WellbeingWidgetState createState() => _WellbeingWidgetState();
}

class _WellbeingWidgetState extends State<WellbeingWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  bool _loadingButton5 = false;
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
        final wellbeingPatientRecord = snapshot.data;
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
                        'How was your general well\n being today?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://i.imgur.com/Sc0cjK1.png',
                        height: 250,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton1 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              wellbeing: 'Generally Well',
                              wellbeingScore: 0,
                            );
                            await wellbeingPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteDiseaseWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton1 = false);
                          }
                        },
                        text: 'Generally Well',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF131619),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF1A1F24),
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton1,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              wellbeing: 'Slightly below par',
                              wellbeingScore: 1,
                            );
                            await wellbeingPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteDiseaseWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'Slightly below par',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF131619),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF1A1F24),
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton2,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton3 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              wellbeing: 'Poor',
                              wellbeingScore: 2,
                            );
                            await wellbeingPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteDiseaseWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton3 = false);
                          }
                        },
                        text: 'Poor',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF131619),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF1A1F24),
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton3,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton4 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              wellbeing: 'Very Poor',
                              wellbeingScore: 3,
                            );
                            await wellbeingPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteDiseaseWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton4 = false);
                          }
                        },
                        text: 'Very Poor',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF131619),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF1A1F24),
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton4,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton5 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              wellbeing: 'Terrible',
                              wellbeingScore: 4,
                            );
                            await wellbeingPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SiteDiseaseWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton5 = false);
                          }
                        },
                        text: 'Terrible',
                        options: FFButtonOptions(
                          width: 200,
                          height: 40,
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF131619),
                          ),
                          borderSide: BorderSide(
                            color: Color(0xFF1A1F24),
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                        loading: _loadingButton5,
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
