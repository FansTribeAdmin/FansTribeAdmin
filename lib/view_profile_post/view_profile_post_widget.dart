import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/view_changes_widget.dart';
import '../content_manager/content_manager_widget.dart';
import '../edit_profile_post/edit_profile_post_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProfilePostWidget extends StatefulWidget {
  const ViewProfilePostWidget({
    Key key,
    this.celebHistoryId,
  }) : super(key: key);

  final DocumentReference celebHistoryId;

  @override
  _ViewProfilePostWidgetState createState() => _ViewProfilePostWidgetState();
}

class _ViewProfilePostWidgetState extends State<ViewProfilePostWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<CelebHistoryRecord>(
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
                        color: Color(0xFFEEEEEE),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.network(
                            'https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNoZWVyaW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                          ).image,
                        ),
                      ),
                      child: Stack(
                        children: [
                          AuthUserStreamWidget(
                            child: Image.network(
                              currentUserPhoto,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          StreamBuilder<CelebsRecord>(
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              final containerCelebsRecord = snapshot.data;
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x99000000),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 60,
                                          icon: Icon(
                                            Icons.arrow_back,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            size: 30,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ContentManagerWidget(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            containerCelebHistoryRecord
                                                .sectionName,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Satisfy',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  fontSize: 32,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 0),
                                        child:
                                            StreamBuilder<CelebHistoryRecord>(
                                          stream:
                                              CelebHistoryRecord.getDocument(
                                                  widget.celebHistoryId),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              );
                                            }
                                            final listViewCelebHistoryRecord =
                                                snapshot.data;
                                            return ListView(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 12, 12, 12),
                                                  child: Container(
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFEEEEEE),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color(0xB5000000),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      12),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                listViewCelebHistoryRecord
                                                                    .postTitle,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Oswald',
                                                                    ),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  if ((listViewCelebHistoryRecord
                                                                          .chronoDate !=
                                                                      null))
                                                                    Text(
                                                                      dateTimeFormat(
                                                                          'yMMMd',
                                                                          listViewCelebHistoryRecord
                                                                              .chronoDate),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Staid Gothic',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryColor,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  Text(
                                                                    listViewCelebHistoryRecord
                                                                        .postYear
                                                                        .toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Staid Gothic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryColor,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      12),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          4,
                                                                          12,
                                                                          4),
                                                                  child:
                                                                      AutoSizeText(
                                                                    listViewCelebHistoryRecord
                                                                        .postDescription,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Staid Gothic',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            4,
                                                                            24,
                                                                            4),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final postImages = listViewCelebHistoryRecord
                                                                            .mediaImage
                                                                            .toList()
                                                                            ?.toList() ??
                                                                        [];
                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            2,
                                                                        crossAxisSpacing:
                                                                            5,
                                                                        mainAxisSpacing:
                                                                            2,
                                                                        childAspectRatio:
                                                                            1,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          postImages
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              postImagesIndex) {
                                                                        final postImagesItem =
                                                                            postImages[postImagesIndex];
                                                                        return CachedNetworkImage(
                                                                          imageUrl:
                                                                              postImagesItem,
                                                                          width:
                                                                              100,
                                                                          height:
                                                                              100,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24,
                                                                            4,
                                                                            24,
                                                                            4),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final postVideos = listViewCelebHistoryRecord
                                                                            .mediaVideo
                                                                            .toList()
                                                                            ?.toList() ??
                                                                        [];
                                                                    return GridView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      gridDelegate:
                                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                                        crossAxisCount:
                                                                            1,
                                                                        crossAxisSpacing:
                                                                            5,
                                                                        mainAxisSpacing:
                                                                            2,
                                                                        childAspectRatio:
                                                                            1,
                                                                      ),
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          postVideos
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              postVideosIndex) {
                                                                        final postVideosItem =
                                                                            postVideos[postVideosIndex];
                                                                        return FlutterFlowVideoPlayer(
                                                                          path:
                                                                              postVideosItem,
                                                                          videoType:
                                                                              VideoType.network,
                                                                          autoPlay:
                                                                              true,
                                                                          looping:
                                                                              false,
                                                                          showControls:
                                                                              true,
                                                                          allowFullScreen:
                                                                              true,
                                                                          allowPlaybackSpeedMenu:
                                                                              false,
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 24),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (containerCelebHistoryRecord
                                                      .isApproved ??
                                                  true)
                                                InkWell(
                                                  onTap: () async {
                                                    final celebHistoryUpdateData =
                                                        createCelebHistoryRecordData(
                                                      isApproved: true,
                                                      isReviewed: true,
                                                    );
                                                    await containerCelebHistoryRecord
                                                        .reference
                                                        .update(
                                                            celebHistoryUpdateData);
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final celebHistoryUpdateData =
                                                            createCelebHistoryRecordData(
                                                          isApproved: true,
                                                          isReviewed: true,
                                                        );
                                                        await containerCelebHistoryRecord
                                                            .reference
                                                            .update(
                                                                celebHistoryUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (!(containerCelebHistoryRecord
                                                      .isApproved) ??
                                                  true)
                                                InkWell(
                                                  onTap: () async {
                                                    final celebHistoryUpdateData =
                                                        createCelebHistoryRecordData(
                                                      isApproved: false,
                                                      isReviewed: true,
                                                    );
                                                    await containerCelebHistoryRecord
                                                        .reference
                                                        .update(
                                                            celebHistoryUpdateData);
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        final celebHistoryUpdateData =
                                                            createCelebHistoryRecordData(
                                                          isApproved: false,
                                                          isReviewed: true,
                                                        );
                                                        await containerCelebHistoryRecord
                                                            .reference
                                                            .update(
                                                                celebHistoryUpdateData);
                                                      },
                                                      child: Icon(
                                                        Icons.check,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return Padding(
                                                        padding: MediaQuery.of(
                                                                context)
                                                            .viewInsets,
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              ViewChangesWidget(
                                                            celebHistoryId:
                                                                containerCelebHistoryRecord
                                                                    .reference,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiaryColor,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .viewInsets,
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.5,
                                                              child:
                                                                  ViewChangesWidget(
                                                                celebHistoryId:
                                                                    containerCelebHistoryRecord
                                                                        .reference,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.rate_review,
                                                      color: Colors.black,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (!(containerCelebHistoryRecord
                                                  .isApproved) ??
                                              true)
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditProfilePostWidget(
                                                          celebHistoryId:
                                                              containerCelebHistoryRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 60,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditProfilePostWidget(
                                                              celebHistoryId:
                                                                  containerCelebHistoryRecord
                                                                      .reference,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Icon(
                                                        Icons.edit_rounded,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
