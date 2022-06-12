import '../add_celeb_page/add_celeb_page_widget.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../generate_celebcode_page/generate_celebcode_page_widget.dart';
import '../single_celeb_page/single_celeb_page_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageCelebsPageWidget extends StatefulWidget {
  const ManageCelebsPageWidget({Key key}) : super(key: key);

  @override
  _ManageCelebsPageWidgetState createState() => _ManageCelebsPageWidgetState();
}

class _ManageCelebsPageWidgetState extends State<ManageCelebsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          'Celebs',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lato',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (functions.canAddCeleb(valueOrDefault(
                                currentUserDocument?.roleType, '')) ??
                            true)
                          AuthUserStreamWidget(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddCelebPageWidget(),
                                  ),
                                );
                              },
                              text: 'New Celeb',
                              icon: Icon(
                                Icons.add,
                                size: 15,
                              ),
                              options: FFButtonOptions(
                                width: 130,
                                height: 40,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Staid Gothic',
                                      color: FlutterFlowTheme.of(context)
                                          .customColor2,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 4,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 16,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Celeb Name',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Status',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'View',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        if (functions.canAddCeleb(valueOrDefault(
                                currentUserDocument?.roleType, '')) ??
                            true)
                          Expanded(
                            child: AuthUserStreamWidget(
                              child: Text(
                                'Code',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          StreamBuilder<List<CelebsRecord>>(
                            stream: queryCelebsRecord(),
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
                              List<CelebsRecord> listViewCelebsRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewCelebsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewCelebsRecord =
                                      listViewCelebsRecordList[listViewIndex];
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          listViewCelebsRecord.celebName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                      Expanded(
                                        child: ToggleIcon(
                                          onPressed: () async {
                                            final celebsUpdateData =
                                                createCelebsRecordData(
                                              isActive: !listViewCelebsRecord
                                                  .isActive,
                                            );
                                            await listViewCelebsRecord.reference
                                                .update(celebsUpdateData);
                                          },
                                          value: listViewCelebsRecord.isActive,
                                          onIcon: Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFF00A814),
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.star_rounded,
                                            color: Color(0xFFFF0000),
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20,
                                          borderWidth: 1,
                                          buttonSize: 40,
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            color: FlutterFlowTheme.of(context)
                                                .customColor2,
                                            size: 20,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SingleCelebPageWidget(
                                                  celebId:
                                                      listViewCelebsRecord.rid,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (functions.canAddCeleb(valueOrDefault(
                                              currentUserDocument?.roleType,
                                              '')) ??
                                          true)
                                        Expanded(
                                          child: AuthUserStreamWidget(
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20,
                                              borderWidth: 1,
                                              buttonSize: 40,
                                              icon: FaIcon(
                                                FontAwesomeIcons.barcode,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                              onPressed: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GenerateCelebcodePageWidget(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
