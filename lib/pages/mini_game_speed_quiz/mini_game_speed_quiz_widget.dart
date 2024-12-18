import 'dart:async';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:treasure_hunt/show_alert.dart';
import 'package:treasure_hunt/data.dart';

import 'mini_game_speed_quiz_model.dart';
export 'mini_game_speed_quiz_model.dart';

class MiniGameSpeedQuizWidget extends StatefulWidget {
  const MiniGameSpeedQuizWidget({super.key});

  @override
  State<MiniGameSpeedQuizWidget> createState() =>
      _MiniGameSpeedQuizWidgetState();
}

class _MiniGameSpeedQuizWidgetState extends State<MiniGameSpeedQuizWidget> {
  late MiniGameSpeedQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void startTimer() {
    const duration = Duration(milliseconds: 10);

    _model.timeLeft = settingTime;

    _model.timer = Timer.periodic(duration, (timer) {
      setState(() {
        if (_model.timeLeft <= 0) {
          _model.timeLeft = 0;
          timer.cancel();
          gameEnd();
        } else {
          _model.timeLeft -= 0.01;
        }
      });
    });
  }

  void gameEnd() async{
    await showAlertWithoutChoice(context, '게임이 끝났습니다');
    int changingScore = _model.ansCnt-2;
    changeScore(changingScore);
    await showAlertWithoutChoice(context, '점수가 ${changingScore.abs()}만큼 ${(changingScore > 0)? '증가':'감소'}했습니다');

    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniGameSpeedQuizModel());
    _model.problemCnt = 0;

    startTimer();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '스피드 퀴즈',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '제한시간 안에 ${problem.length}문제를 맞히세요!!',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  if(_model.previousProblemAns != null)
                    Text(
                      (_model.previousProblemAns??true)? '맞았습니다':'틀렸습니다',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: (_model.previousProblemAns??true)? const Color(0xFF4B39EF):const Color(0xFFFF5963),
                        letterSpacing: 0.0,
                      ),
                    ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                      child: CircularPercentIndicator(
                        percent: (_model.timeLeft>= 0)? _model.timeLeft/settingTime:0,
                        radius: 150,
                        lineWidth: 25,
                        animation: true,
                        animateFromLastPercent: true,
                        progressColor: FlutterFlowTheme.of(context).primary,
                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                        center: Text(
                          _model.timeLeft.toStringAsFixed(2),
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                            fontFamily: 'Inter Tight',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 8),
                    child: Center(
                      child: Text(
                        '${_model.problemCnt+1}번: ${problem[_model.problemCnt]}',
                        style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                          fontSize: 25,
                        ),
                      ),
                    )
                  ),
                  for(int i = 0; i < _model.checkboxValue.length; i++)
                    InkWell(
                      onTap: () {
                        setState(() {
                          _model.checkboxValue[i] = !_model.checkboxValue[i];
                        });
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 6.5, 0, 6.5),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      2,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16, 6, 16, 6),
                                    child: Container(
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0,
                                              1,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              problemChoice[_model.problemCnt][i],
                                              style: FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                fontFamily: 'Inter',
                                                fontSize: 16,
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                            Theme(
                                              data: ThemeData(
                                                checkboxTheme: CheckboxThemeData(
                                                  visualDensity:
                                                  VisualDensity.compact,
                                                  materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(4),
                                                  ),
                                                ),
                                                unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                              ),
                                              child: Checkbox(
                                                value: _model.checkboxValue[i],
                                                onChanged: (newValue) async {
                                                  safeSetState(() => _model
                                                      .checkboxValue[i] = newValue!);
                                                },
                                                side: BorderSide(
                                                  width: 2,
                                                  color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                                ),
                                                activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                                checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                              ),
                                            ),
                                          ],
                                        ),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () {
                        bool inputAns = true;
                        for(int i = 0; i < _model.checkboxValue.length; i++) {
                          if(_model.checkboxValue[i] == true && (ans[_model.problemCnt].contains(i)) == false) inputAns = false;
                          if(_model.checkboxValue[i] == false && (ans[_model.problemCnt].contains(i)) == true) inputAns = false;
                        }
                        _model.checkboxValue = [false, false, false, false];

                        if(inputAns) {
                          _model.previousProblemAns = true;
                          _model.ansCnt++;
                        }else{
                          _model.previousProblemAns = false;
                        }
                        _model.problemCnt++;
                        if(_model.problemCnt == ans.length) {
                          _model.problemCnt = 0;
                          _model.timer.cancel();
                          gameEnd();
                        }else{
                          setState(() {});
                        }
                      },
                      text: '정답 제출',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.all(0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 25,
                          letterSpacing: 0.0,
                        ),
                        elevation: 4,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
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
