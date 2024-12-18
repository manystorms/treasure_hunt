import 'dart:async';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:treasure_hunt/show_alert.dart';
import 'package:treasure_hunt/data.dart';
import 'mini_game_typing_model.dart';
export 'mini_game_typing_model.dart';

class MiniGameTypingWidget extends StatefulWidget {
  const MiniGameTypingWidget({super.key});

  @override
  State<MiniGameTypingWidget> createState() => _MiniGameTypingWidgetState();
}

class _MiniGameTypingWidgetState extends State<MiniGameTypingWidget> {
  late MiniGameTypingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniGameTypingModel());

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();
  }

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
    int changingScore = _model.ansText-2;
    changeScore(changingScore);
    await showAlertWithoutChoice(context, '점수가 ${changingScore.abs()}만큼 ${(changingScore > 0)? '증가':'감소'}했습니다');

    context.pop();
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
                    '타이핑 게임',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '주어진 문장을 시간 안에 타이핑 하세요!',
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
                  Container(
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: TextFormField(
                        controller: _model.descriptionTextController,
                        focusNode: _model.descriptionFocusNode,
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: textAsk[_model.ansText],
                          labelStyle:
                          FlutterFlowTheme.of(context).labelLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                          alignLabelWithHint: true,
                          hintStyle:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                          errorStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).error,
                            fontSize: 12,
                            letterSpacing: 0.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).alternate,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding:
                          const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                        ),
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                        maxLines: 9,
                        minLines: 5,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        validator: _model.descriptionTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () {
                        if(textAsk[_model.problemText] == "") { //수정 필요
                          _model.previousProblemAns = true;
                          _model.ansText++;
                        }
                        else{
                          _model.previousProblemAns = false;
                        }
                        _model.problemText++;
                        if(_model.problemText == textAsk.length) {
                          _model.problemText = 0;
                          gameEnd();
                        }else{
                          setState(() {});
                        }
                      },
                      text: '제출하기',
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
