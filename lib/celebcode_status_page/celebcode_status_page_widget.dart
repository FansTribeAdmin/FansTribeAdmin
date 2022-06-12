import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../generate_celebcode_page/generate_celebcode_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CelebcodeStatusPageWidget extends StatefulWidget {
  const CelebcodeStatusPageWidget({Key key}) : super(key: key);

  @override
  _CelebcodeStatusPageWidgetState createState() =>
      _CelebcodeStatusPageWidgetState();
}

class _CelebcodeStatusPageWidgetState extends State<CelebcodeStatusPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).customColor1,
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
          'Celeb Code List',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Staid Gothic',
                color: Colors.white,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GenerateCelebcodePageWidget(),
            ),
          );
        },
        backgroundColor: FlutterFlowTheme.of(context).customColor2,
        icon: Icon(
          Icons.add_box,
        ),
        elevation: 8,
        label: Text(
          'New Code',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Staid Gothic',
                color: FlutterFlowTheme.of(context).primaryBackground,
                useGoogleFonts: false,
              ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Celeb',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Code',
                          textAlign: TextAlign.center,
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
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: StreamBuilder<List<CelebcodeRecord>>(
                      stream: queryCelebcodeRecord(
                        queryBuilder: (celebcodeRecord) =>
                            celebcodeRecord.orderBy('created_time'),
                      ),
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
                        List<CelebcodeRecord> listViewCelebcodeRecordList =
                            snapshot.data;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewCelebcodeRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewCelebcodeRecord =
                                listViewCelebcodeRecordList[listViewIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    listViewCelebcodeRecord.celebName,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    listViewCelebcodeRecord.code,
                                    textAlign: TextAlign.center,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ),
                                Expanded(
                                  child: ToggleIcon(
                                    onPressed: () async {
                                      final celebcodeUpdateData =
                                          createCelebcodeRecordData(
                                        isActive:
                                            !listViewCelebcodeRecord.isActive,
                                      );
                                      await listViewCelebcodeRecord.reference
                                          .update(celebcodeUpdateData);
                                    },
                                    value: listViewCelebcodeRecord.isActive,
                                    onIcon: FaIcon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color(0xFF00A814),
                                      size: 20,
                                    ),
                                    offIcon: FaIcon(
                                      FontAwesomeIcons.solidCircle,
                                      color: Color(0xFFFF0000),
                                      size: 20,
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20,
                                  borderWidth: 1,
                                  buttonSize: 40,
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFF260026),
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
