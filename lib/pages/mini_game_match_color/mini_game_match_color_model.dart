import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_match_color_widget.dart' show MiniGameMatchColorWidget;
import 'package:flutter/material.dart';

const double settingTime = 120;

const List<List<Color>> colorProblem = [
  [Color(0xFF584CDA), Color(0xFF2E2877), Color(0xFF524B8E), Color(0xFF7E72E3)],
];

List<int> ans = [2];

class MiniGameMatchColorModel
    extends FlutterFlowModel<MiniGameMatchColorWidget> {

  late Timer timer;
  double timeLeft = settingTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timer.cancel();
  }
}
