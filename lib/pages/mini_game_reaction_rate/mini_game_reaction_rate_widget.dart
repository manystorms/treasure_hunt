import 'dart:async';
import 'dart:math';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:treasure_hunt/show_alert.dart';
import 'package:treasure_hunt/data.dart';

import 'mini_game_reaction_rate_model.dart';
export 'mini_game_reaction_rate_model.dart';

class MiniGameReactionRateWidget extends StatefulWidget {
  const MiniGameReactionRateWidget({super.key});

  @override
  State<MiniGameReactionRateWidget> createState() =>
      _MiniGameReactionRateWidgetState();
}

class _MiniGameReactionRateWidgetState
    extends State<MiniGameReactionRateWidget> {
  late MiniGameReactionRateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void startGame() {
    setState(() {
      _model.ready = true;
    });

    final randomDelay = Random().nextInt(3000)+4000;
    _model.timer = Timer(Duration(milliseconds: randomDelay), () {
      setState(() {
        _model.ready = false;
        _model.startTime = DateTime.now().millisecondsSinceEpoch;
      });
    });
  }

  void gameEnd() async{
    final reactionRateSum = _model.reactionRate.reduce((a, b) => a + b);
    final average = reactionRateSum/_model.reactionRate.length;

    int changingScore = 0;
    if(average >= 0.5) {
      changingScore = -3;
    }else if(average >= 0.25){
      changingScore = 1;
    }else{
      changingScore = 3;
    }

    changeScore(changingScore);
    await showAlertWithoutChoice(context, '평균 ${average.toStringAsFixed(2)}초가 걸렸습니다\n점수가 ${changingScore.abs()}만큼 ${(changingScore > 0)? '증가':'감소'}했습니다');
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniGameReactionRateModel());

    startGame();
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
                    '반응속도 테스트',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      '버튼이 바뀌면 빠르게 버튼을 누르세요!\n총 3번의 기회가 있습니다\n참고-준비 상태에 버튼을 누르지 마세요',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: LinearPercentIndicator(
                      percent: _model.reactionRate.length/measureReactionRateTotalCnt,
                      lineHeight: 35,
                      animation: true,
                      animateFromLastPercent: true,
                      progressColor: FlutterFlowTheme.of(context).primary,
                      backgroundColor: FlutterFlowTheme.of(context).accent4,
                      center: Text(
                        '${_model.reactionRate.length.toString()}번',
                        style:
                        FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Inter Tight',
                          letterSpacing: 0.0,
                        ),
                      ),
                      barRadius: const Radius.circular(12),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if(_model.ready) {
                          _model.reactionRate.add(penaltyTime);
                          await showAlertWithoutChoice(context, '준비 상태에 버튼을 눌러서 $penaltyTime초로 측정됩니다');
                        }else{
                          _model.reactionRate.add((DateTime.now().millisecondsSinceEpoch-_model.startTime)/1000.0);
                          await showAlertWithoutChoice(context, '${_model.reactionRate.last}초 걸렸습니다');
                        }

                        if(_model.reactionRate.length == measureReactionRateTotalCnt) {
                          gameEnd();
                        }else{
                          startGame();
                        }
                      },
                      text: (_model.ready)? '준비':'누르세요',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 150,
                        padding: const EdgeInsets.all(0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: (_model.ready)? FlutterFlowTheme.of(context).primary:const Color(0xFFCB2D36),
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 40,
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
