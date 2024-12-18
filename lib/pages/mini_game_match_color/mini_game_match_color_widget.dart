import 'dart:async';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:treasure_hunt/show_alert.dart';
import 'package:treasure_hunt/data.dart';

import 'mini_game_match_color_model.dart';
export 'mini_game_match_color_model.dart';

class MiniGameMatchColorWidget extends StatefulWidget {
  const MiniGameMatchColorWidget({super.key});

  @override
  State<MiniGameMatchColorWidget> createState() =>
      _MiniGameMatchColorWidgetState();
}

class _MiniGameMatchColorWidgetState extends State<MiniGameMatchColorWidget> {
  late MiniGameMatchColorModel _model;

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
    _model.timer.cancel();
    await showAlertWithoutChoice(context, '게임이 끝났습니다');
    int changingScore = _model.ansCnt-2;
    changeScore(changingScore);
    await showAlertWithoutChoice(context, '점수가 ${changingScore.abs()}만큼 ${(changingScore > 0)? '증가':'감소'}했습니다');

    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniGameMatchColorModel());

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
                    '색깔 맞추기 게임',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 2),
                    child: Text(
                      '아래 4가지 색 중에서 주어진 보기와 같은 색깔을 고르세요!!',
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
                        lineWidth: 17,
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        color: colorProblem[_model.problemCnt][ans[_model.problemCnt]],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 6, 6),
                          child: FFButtonWidget(
                            onPressed: () {
                              if(ans[_model.problemCnt] == 0) {
                                _model.previousProblemAns = true;
                                _model.ansCnt++;
                              }else{
                                _model.previousProblemAns = false;
                              }
                              _model.problemCnt++;
                              if(_model.problemCnt == ans.length) {
                                _model.problemCnt = 0;
                                gameEnd();
                              }else{
                                setState(() {});
                              }
                            },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: colorProblem[_model.problemCnt][0],
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(6, 24, 0, 6),
                          child: FFButtonWidget(
                            onPressed: () {
                              if(ans[_model.problemCnt] == 1) {
                                _model.previousProblemAns = true;
                                _model.ansCnt++;
                              }else{
                                _model.previousProblemAns = false;
                              }
                              _model.problemCnt++;
                              if(_model.problemCnt == ans.length) {
                                _model.problemCnt = 0;
                                gameEnd();
                              }else{
                                setState(() {});
                              }
                            },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: colorProblem[_model.problemCnt][1],
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 6, 6, 6),
                          child: FFButtonWidget(
                            onPressed: () {
                              if(ans[_model.problemCnt] == 2) {
                                _model.previousProblemAns = true;
                                _model.ansCnt++;
                              }else{
                                _model.previousProblemAns = false;
                              }
                              _model.problemCnt++;
                              if(_model.problemCnt == ans.length) {
                                _model.problemCnt = 0;
                                gameEnd();
                              }else{
                                setState(() {});
                              }
                            },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: colorProblem[_model.problemCnt][2],
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(6, 6, 0, 6),
                          child: FFButtonWidget(
                            onPressed: () {
                              if(ans[_model.problemCnt] == 3) {
                                _model.previousProblemAns = true;
                                _model.ansCnt++;
                              }else{
                                _model.previousProblemAns = false;
                              }
                              _model.problemCnt++;
                              if(_model.problemCnt == ans.length) {
                                _model.problemCnt = 0;
                                gameEnd();
                              }else{
                                setState(() {});
                              }
                            },
                            text: '',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50,
                              padding: const EdgeInsets.all(0),
                              iconPadding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              color: colorProblem[_model.problemCnt][3],
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                fontFamily: 'Inter Tight',
                                color: Colors.white,
                                fontSize: 25,
                                letterSpacing: 0.0,
                              ),
                              elevation: 0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
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
