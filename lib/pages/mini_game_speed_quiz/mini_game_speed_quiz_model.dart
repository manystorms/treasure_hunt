import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_speed_quiz_widget.dart' show MiniGameSpeedQuizWidget;
import 'package:flutter/material.dart';

const double settingTime = 30;

List<String> problem = [
  'gggg',
  'sdfs',
];

List<List<String>> problemChoice = [
  ['aa', 'bb', 'cc', 'dd'],
  ['qq', 'ww', 'ee', 'rr'],
];

List<List<int>> ans = [
  [0, 1],
  [2],
];

class MiniGameSpeedQuizModel extends FlutterFlowModel<MiniGameSpeedQuizWidget> {
  ///  State fields for stateful widgets in this page.

  List<bool> checkboxValue = [false, false, false, false];
  late Timer timer;
  double timeLeft = settingTime;
  int problemCnt = 0;
  int ansCnt = 0;
  bool? previousProblemAns;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timer.cancel();
  }
}
