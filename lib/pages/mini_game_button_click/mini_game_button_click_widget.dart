import 'dart:async';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:treasure_hunt/show_alert.dart';

import 'mini_game_button_click_model.dart';
export 'mini_game_button_click_model.dart';

class MiniGameButtonClickWidget extends StatefulWidget {
  const MiniGameButtonClickWidget({super.key});

  @override
  State<MiniGameButtonClickWidget> createState() =>
      _MiniGameButtonClickWidgetState();
}

class _MiniGameButtonClickWidgetState extends State<MiniGameButtonClickWidget> {
  late MiniGameButtonClickModel _model;

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
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MiniGameButtonClickModel());
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
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Bug Report',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Inter Tight',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'Fill out the form below to submit a ticket.',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                      child: CircularPercentIndicator(
                        percent: _model.timeLeft/settingTime,
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 12),
                    child: FFButtonWidget(
                      onPressed: () {
                        setState(() {
                          _model.cnt++;
                        });
                      },
                      text: _model.cnt.toString(),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 100,
                        padding: EdgeInsets.all(0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                        FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Inter Tight',
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 0.0,
                        ),
                        elevation: 4,
                        borderSide: BorderSide(
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
