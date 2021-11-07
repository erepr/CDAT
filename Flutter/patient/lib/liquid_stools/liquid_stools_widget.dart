import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../diarrhea/diarrhea_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LiquidStoolsWidget extends StatefulWidget {
  LiquidStoolsWidget({Key key}) : super(key: key);

  @override
  _LiquidStoolsWidgetState createState() => _LiquidStoolsWidgetState();
}

class _LiquidStoolsWidgetState extends State<LiquidStoolsWidget> {
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
        final liquidStoolsPatientRecord = snapshot.data;
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
                        'Number of liquid or\nvery soft stools today?',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.title2,
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
                      Image.asset(
                        'assets/images/poo.png',
                        height: 150,
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
                              liquidStools: 'None',
                              liquidStoolsScore: 0,
                            );
                            await liquidStoolsPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiarrheaWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton1 = false);
                          }
                        },
                        text: 'None',
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
                              liquidStools: '1 to 4',
                              liquidStoolsScore: 4,
                            );
                            await liquidStoolsPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiarrheaWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton2 = false);
                          }
                        },
                        text: '1 to 4',
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
                              liquidStools: '5 to 9',
                              liquidStoolsScore: 9,
                            );
                            await liquidStoolsPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiarrheaWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton3 = false);
                          }
                        },
                        text: '5 to 9',
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
                              liquidStools: '10 to 19',
                              liquidStoolsScore: 19,
                            );
                            await liquidStoolsPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiarrheaWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton4 = false);
                          }
                        },
                        text: '10 to 19',
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
                              liquidStools: '20 to 49',
                              liquidStoolsScore: 20,
                            );
                            await liquidStoolsPatientRecord.reference
                                .update(patientUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DiarrheaWidget(),
                              ),
                            );
                          } finally {
                            setState(() => _loadingButton5 = false);
                          }
                        },
                        text: '20 to 49',
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
