import '../admin_profile/admin_profile_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleCelebPageWidget extends StatefulWidget {
  const SingleCelebPageWidget({
    Key key,
    this.celebId,
  }) : super(key: key);

  final String celebId;

  @override
  _SingleCelebPageWidgetState createState() => _SingleCelebPageWidgetState();
}

class _SingleCelebPageWidgetState extends State<SingleCelebPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CelebsRecord>>(
      stream: queryCelebsRecord(
        queryBuilder: (celebsRecord) =>
            celebsRecord.where('rid', isEqualTo: widget.celebId),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<CelebsRecord> singleCelebPageCelebsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final singleCelebPageCelebsRecord =
            singleCelebPageCelebsRecordList.isNotEmpty
                ? singleCelebPageCelebsRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.dashboard,
                  color: FlutterFlowTheme.of(context).primaryColor,
                  size: 30,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageWidget(),
                    ),
                  );
                },
              ),
            ],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            singleCelebPageCelebsRecord.photoUrl,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        Text(
                          valueOrDefault<String>(
                            singleCelebPageCelebsRecord.celebName,
                            'Celeb Name',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Staid Gothic',
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                fontSize: 20,
                                useGoogleFonts: false,
                              ),
                        ),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Registered Email:',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              singleCelebPageCelebsRecord.email,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              '@displayname:',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              valueOrDefault<String>(
                                singleCelebPageCelebsRecord.displayName,
                                'Display Name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    color: FlutterFlowTheme.of(context)
                                        .tertiaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Created On: ',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              dateTimeFormat('yMMMd',
                                  singleCelebPageCelebsRecord.adminCreatedTime),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              'Created By:',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: StreamBuilder<AdminsRecord>(
                              stream: AdminsRecord.getDocument(
                                  singleCelebPageCelebsRecord.createdBy),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final textAdminsRecord = snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AdminProfileWidget(
                                          adminRecord: textAdminsRecord,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    textAdminsRecord.adminUsername,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Staid Gothic',
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Text(
                              'Account Status:',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    fontSize: 16,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              functions.boolToString(
                                  singleCelebPageCelebsRecord.isActive),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (singleCelebPageCelebsRecord.isActive ?? true)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                'First Login:',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Staid Gothic',
                                      fontSize: 16,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                dateTimeFormat('yMMMd',
                                    singleCelebPageCelebsRecord.createdTime),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Staid Gothic',
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
