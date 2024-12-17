import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_button_click_widget.dart' show MiniGameButtonClickWidget;
import 'package:flutter/material.dart';

const settingTime = 5.0;

class MiniGameButtonClickModel
    extends FlutterFlowModel<MiniGameButtonClickWidget> {

  int cnt = 0;
  late Timer timer;
  double timeLeft = settingTime;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timer.cancel();
  }
}
