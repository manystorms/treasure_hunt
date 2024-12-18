import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_match_color_widget.dart' show MiniGameMatchColorWidget;
import 'package:flutter/material.dart';

const double settingTime = 30;

const List<List<Color>> colorProblem = [
  [Color(0xFF5B4FE0), Color(0xFF2F2968), Color(0xFF544B91), Color(0xFF7C72D9)],
  [Color(0xFFCC1713), Color(0xFF9B0F0D), Color(0xFF9D1D1B), Color(0xFFCA2A27)],
  [Color(0xFF345C1D), Color(0xFF3B6423), Color(0xFF375F1C), Color(0xFF2C4A17)],
  [Color(0x79C9C763), Color(0x79C8C570), Color(0x79A09F5B), Color(0x799D9B51)],
  [Color(0x79A11FB4), Color(0x79A021B0), Color(0x79AB24BE), Color(0x798E209D)]
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
