import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_match_color_widget.dart' show MiniGameMatchColorWidget;
import 'package:flutter/material.dart';

const double settingTime = 5;

const List<List<Color>> colorProblem = [
  [Color(0xFF584CDA), Color(0xFF2E2877), Color(0xFF524B8E), Color(0xFF7E72E3)],
  [Color(0xFFCF1A15), Color(0xFF9E120F), Color(0xFF9E211F), Color(0xFFCC2C29)],
  [Color(0xFF35591F), Color(0xFF3E6824), Color(0xFF38631E), Color(0xFF2B4C18)],
  [Color(0x79CDCB64), Color(0x79CAC872), Color(0x79A1A05C), Color(0x799F9E52)],
  [Color(0x79A41DB6), Color(0x79A021B1), Color(0x79AA24BC), Color(0x798D209C)]
];

List<int> ans = [2, 3, 1, 2, 0];

class MiniGameMatchColorModel
    extends FlutterFlowModel<MiniGameMatchColorWidget> {

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
