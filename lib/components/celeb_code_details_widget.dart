import '../admin_profile/admin_profile_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CelebCodeDetailsWidget extends StatefulWidget {
  const CelebCodeDetailsWidget({
    Key key,
    this.celebCodeRecord,
  }) : super(key: key);

  final CelebcodeRecord celebCodeRecord;

  @override
  _CelebCodeDetailsWidgetState createState() => _CelebCodeDetailsWidgetState();
}

class _CelebCodeDetailsWidgetState extends State<CelebCodeDetailsWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customColor1,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Celeb Name:',
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.celebCodeRecord.celebName,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Code: ',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.celebCodeRecord.code,
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Status:',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        functions.statusLabel(widget.celebCodeRecord),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Count:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.celebCodeRecord.count.toString(),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Used Count:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        widget.celebCodeRecord.usedCount.toString(),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Expiry Date:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dateTimeFormat(
                            'MMMMEEEEd', widget.celebCodeRecord.expiryDate),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Created On:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        dateTimeFormat(
                            'MMMMEEEEd', widget.celebCodeRecord.createdTime),
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        'Created By:',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: StreamBuilder<AdminsRecord>(
                        stream: AdminsRecord.getDocument(
                            widget.celebCodeRecord.createdBy),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final createdDateValueAdminsRecord = snapshot.data;
                          return InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdminProfileWidget(
                                    adminRecord: createdDateValueAdminsRecord,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              createdDateValueAdminsRecord.adminUsername,
                              style:
                                  FlutterFlowTheme.of(context).title3.override(
                                        fontFamily: 'Staid Gothic',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        decoration: TextDecoration.underline,
                                        useGoogleFonts: false,
                                      ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animated([animationsMap['containerOnPageLoadAnimation']]);
  }
}
