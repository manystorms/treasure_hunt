import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:treasure_hunt/show_alert.dart';
import 'main_page_model.dart';
export 'main_page_model.dart';

import 'package:treasure_hunt/data.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget>
    with TickerProviderStateMixin {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'listViewOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 150.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '동신 iLogics 10기',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '동신 12기 학술제 전용 어플',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                        child: Text(
                          '비밀 단서를 찾아 떠나는 보물 여행',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 12.0),
                        child: Text(
                          '동신과학고에 합격하신 12기 여려분 모두 환영합니다. 지금부터 학교 내에 숨겨져 있는 QR 코드를 찾아 아래의 보라색 버튼을 눌러 스캔하여 단서를 밝혀 저희를 찾아오셔야 합니다! \n반드시 모든 단서를 활성화시키고 찾아와주세요!',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 0.0, 12.0),
                        child: Text(
                          (currentProgress > 0)? '단서':'단서-단서를 아직 발견하지 못했습니다',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            for(int i = 0; i < currentProgress && i < riddleData.length-1; i++)
                              InkWell(
                                onTap: () {
                                  context.push('/imagePage/$i');
                                },
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 6.0, 12.0, 6.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color:
                                        FlutterFlowTheme.of(context).alternate,
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 16.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '단서 ${i+1}',
                                                    style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                      fontFamily:
                                                      'Plus Jakarta Sans',
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 4.0, 0.0, 0.0),
                                                    child: Text(
                                                      (riddleData[i]['simpleContent']??''),
                                                      style: FlutterFlowTheme.of(
                                                          context)
                                                          .labelMedium
                                                          .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0.0,
                                                      ),
                                                    ),
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
                              )
                          ],
                        ).animateOnPageLoad(
                            animationsMap['listViewOnPageLoadAnimation']!),
                      ),
                      if(currentProgress == riddleData.length)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 12.0),
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 330.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        'assets/CongratulationsImage.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            _model.userName = await context.push<String>('/namePage');
                          },
                          text: '당신이 속한 팀명 혹은 이름을 입력하세요.',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0x006F61EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            borderSide: const BorderSide(
                              color: Color(0x006F61EF),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final result = await context.push<String>('/codeScan');
                            if (result.toString() == riddleData[currentProgress]['qrCode']) {
                              currentProgress++;
                              if (currentProgress == riddleData.length) {
                                if (context.mounted) {
                                  await showAlertWithoutChoice(context, '최종 보물에 도달하였습니다!\n상품을 받아가세요!');
                                }
                                setState(() {});
                              } else {
                                if(riddleData[currentProgress-1]['miniGame'] != null && context.mounted) {
                                  await context.push(riddleData[currentProgress-1]['miniGame']);
                                }

                                if (context.mounted) {
                                  await showAlertWithoutChoice(context, '축하합니다!\n$currentProgress번째 단서를 찾아냈습니다!');
                                }
                                setState(() {});
                              }
                            } else {
                              if (context.mounted) {
                                await showAlertWithoutChoice(context, '틀렸습니다');
                              }
                            }
                            debugPrint(currentProgress.toString());
                            debugPrint(result.toString());
                          },
                          text: 'QR 코드 스캔',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
