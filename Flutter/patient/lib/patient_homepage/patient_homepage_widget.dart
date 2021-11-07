import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../mainpage/mainpage_widget.dart';
import '../wellbeing/wellbeing_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientHomepageWidget extends StatefulWidget {
  PatientHomepageWidget({Key key}) : super(key: key);

  @override
  _PatientHomepageWidgetState createState() => _PatientHomepageWidgetState();
}

class _PatientHomepageWidgetState extends State<PatientHomepageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFBDF6FF),
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
                      color: Color(0xFF065456),
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Welcome',
                    style: FlutterFlowTheme.subtitle2.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF065456),
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AuthUserStreamWidget(
                    child: Text(
                      currentUserDisplayName,
                      style: FlutterFlowTheme.title2.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF065456),
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(3, 0, 0, 0),
                    child: Text(
                      '😄',
                      style: FlutterFlowTheme.bodyText1.override(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/3827603.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Color(0xFF065456),
                    borderRadius: 50,
                    borderWidth: 2,
                    buttonSize: 70,
                    fillColor: Color(0xFFBDF6FF),
                    icon: Icon(
                      Icons.arrow_right_alt,
                      color: Color(0xFF065456),
                      size: 40,
                    ),
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WellbeingWidget(),
                        ),
                      );
                    },
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
                    'Track',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF065456),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
