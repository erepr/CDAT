import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../mainpage/mainpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientHistoryWidget extends StatefulWidget {
  PatientHistoryWidget({Key key}) : super(key: key);

  @override
  _PatientHistoryWidgetState createState() => _PatientHistoryWidgetState();
}

class _PatientHistoryWidgetState extends State<PatientHistoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD1EDEE),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainpageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: Icon(
                      Icons.logout,
                      color: Color(0xFF1F2123),
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'History',
                    style: FlutterFlowTheme.title1,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 15, 20, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder<List<HistoryRecord>>(
                        stream: queryHistoryRecord(
                          queryBuilder: (historyRecord) => historyRecord
                              .orderBy('Timestamp', descending: true),
                        ),
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
                          List<HistoryRecord> columnHistoryRecordList =
                              snapshot.data;
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                columnHistoryRecordList.length, (columnIndex) {
                              final columnHistoryRecord =
                                  columnHistoryRecordList[columnIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF065456),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 22, 0, 0),
                                                child: Text(
                                                  columnHistoryRecord.severity,
                                                  style: FlutterFlowTheme
                                                      .subtitle1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(30, 3, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                      'MMMEd',
                                                      columnHistoryRecord
                                                          .timestamp),
                                                  style: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 30, 0),
                                              child: Text(
                                                columnHistoryRecord.score
                                                    .toString(),
                                                style: FlutterFlowTheme.title3
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
