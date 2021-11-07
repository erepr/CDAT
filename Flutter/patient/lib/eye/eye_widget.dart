import '../abdominal_pain/abdominal_pain_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EyeWidget extends StatefulWidget {
  EyeWidget({Key key}) : super(key: key);

  @override
  _EyeWidgetState createState() => _EyeWidgetState();
}

class _EyeWidgetState extends State<EyeWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
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
        final eyePatientRecord = snapshot.data;
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
                        'Any symptoms of  Eye Rashes?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title2.override(
                          fontFamily: 'Poppins',
                          fontSize: 21,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Iritis or uveitis opthalmology',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Color(0x82757575),
                        ),
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
                      CachedNetworkImage(
                        imageUrl: 'https://i.imgur.com/HkCVEgh.png',
                        height: 280,
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
                              eye: 'Yes',
                              eyeScore: 1,
                            );
                            await eyePatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AbdominalPainWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton1 = false);
                          }
                        },
                        text: 'Yes',
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
                  padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          setState(() => _loadingButton2 = true);
                          try {
                            final patientUpdateData = createPatientRecordData(
                              eye: 'No',
                              eyeScore: 0,
                            );
                            await eyePatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AbdominalPainWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: 'No',
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
