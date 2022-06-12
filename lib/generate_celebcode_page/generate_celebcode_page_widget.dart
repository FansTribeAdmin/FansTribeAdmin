import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../celebcode_status_page/celebcode_status_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GenerateCelebcodePageWidget extends StatefulWidget {
  const GenerateCelebcodePageWidget({
    Key key,
    this.celebRID,
  }) : super(key: key);

  final String celebRID;

  @override
  _GenerateCelebcodePageWidgetState createState() =>
      _GenerateCelebcodePageWidgetState();
}

class _GenerateCelebcodePageWidgetState
    extends State<GenerateCelebcodePageWidget> {
  DateTime datePicked;
  TextEditingController setCelebCodeController;
  TextEditingController setCountController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setCelebCodeController = TextEditingController();
    setCountController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CelebsRecord>>(
      stream: queryCelebsRecord(
        queryBuilder: (celebsRecord) =>
            celebsRecord.where('rid', isEqualTo: widget.celebRID),
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
        List<CelebsRecord> generateCelebcodePageCelebsRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final generateCelebcodePageCelebsRecord =
            generateCelebcodePageCelebsRecordList.isNotEmpty
                ? generateCelebcodePageCelebsRecordList.first
                : null;
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
              'Generate Celeb Code',
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
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
                    child: TextFormField(
                      controller: setCelebCodeController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Set Celebcode',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Staid Gothic',
                            color: FlutterFlowTheme.of(context).customColor2,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 20, 16, 20),
                    child: TextFormField(
                      controller: setCountController,
                      obscureText: false,
                      decoration: InputDecoration(
                        hintText: 'Set Count',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).customColor2,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Staid Gothic',
                            color: FlutterFlowTheme.of(context).customColor2,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 60,
                        icon: FaIcon(
                          FontAwesomeIcons.calendarTimes,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          await DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            onConfirm: (date) {
                              setState(() => datePicked = date);
                            },
                            currentTime: getCurrentTimestamp,
                            minTime: getCurrentTimestamp,
                            locale: LocaleType.values.firstWhere(
                              (l) =>
                                  l.name ==
                                  FFLocalizations.of(context).languageCode,
                              orElse: null,
                            ),
                          );
                        },
                      ),
                      Text(
                        valueOrDefault<String>(
                          dateTimeFormat('yMMMd', datePicked),
                          'Set Expiry Date',
                        ),
                        style: FlutterFlowTheme.of(context).subtitle1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              final celebcodeCreateData =
                                  createCelebcodeRecordData(
                                code: setCelebCodeController.text,
                                count: int.parse(setCountController.text),
                                rid: widget.celebRID,
                                celebName:
                                    generateCelebcodePageCelebsRecord.celebName,
                                celebPhotoUrl:
                                    generateCelebcodePageCelebsRecord.photoUrl,
                                expiryDate: datePicked,
                                createdTime: getCurrentTimestamp,
                                isActive: functions.setCodeStatus(datePicked),
                              );
                              await CelebcodeRecord.collection
                                  .doc()
                                  .set(celebcodeCreateData);
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CelebcodeStatusPageWidget(),
                                ),
                              );
                            },
                            text: 'Generate Code',
                            options: FFButtonOptions(
                              width: 130,
                              height: 60,
                              color: FlutterFlowTheme.of(context).customColor1,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Staid Gothic',
                                    color: Colors.white,
                                    useGoogleFonts: false,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
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
        );
      },
    );
  }
}
