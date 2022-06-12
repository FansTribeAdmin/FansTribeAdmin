import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewChangesWidget extends StatefulWidget {
  const ViewChangesWidget({
    Key key,
    this.celebHistoryId,
  }) : super(key: key);

  final DocumentReference celebHistoryId;

  @override
  _ViewChangesWidgetState createState() => _ViewChangesWidgetState();
}

class _ViewChangesWidgetState extends State<ViewChangesWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CelebHistoryRecord>(
      stream: CelebHistoryRecord.getDocument(widget.celebHistoryId),
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
        final containerCelebHistoryRecord = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: StreamBuilder<List<ChangeRequestRecord>>(
                    stream: queryChangeRequestRecord(
                      queryBuilder: (changeRequestRecord) => changeRequestRecord
                          .where('history_post_id',
                              isEqualTo: widget.celebHistoryId)
                          .orderBy('request_time'),
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
                      List<ChangeRequestRecord>
                          listViewChangeRequestRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewChangeRequestRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewChangeRequestRecord =
                              listViewChangeRequestRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 12, 12, 12),
                                    child: StreamBuilder<CelebsRecord>(
                                      stream: CelebsRecord.getDocument(
                                          containerCelebHistoryRecord.celebUid),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                          );
                                        }
                                        final celebNameCelebsRecord =
                                            snapshot.data;
                                        return Text(
                                          celebNameCelebsRecord.celebName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Staid Gothic',
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    'has requested for a change',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Staid Gothic',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24, 12, 24, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        listViewChangeRequestRecord.requestText,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ToggleIcon(
                                            onPressed: () async {
                                              final changeRequestUpdateData =
                                                  createChangeRequestRecordData(
                                                isSeen:
                                                    !listViewChangeRequestRecord
                                                        .isSeen,
                                              );
                                              await listViewChangeRequestRecord
                                                  .reference
                                                  .update(
                                                      changeRequestUpdateData);
                                            },
                                            value: listViewChangeRequestRecord
                                                .isSeen,
                                            onIcon: Icon(
                                              Icons.remove_red_eye,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiaryColor,
                                              size: 18,
                                            ),
                                            offIcon: Icon(
                                              Icons.remove_red_eye,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryColor,
                                              size: 18,
                                            ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                                'yMMMd',
                                                listViewChangeRequestRecord
                                                    .requestTime),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Staid Gothic',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w300,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
        );
      },
    );
  }
}
