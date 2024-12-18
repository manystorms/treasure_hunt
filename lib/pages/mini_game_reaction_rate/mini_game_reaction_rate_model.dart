import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_reaction_rate_widget.dart' show MiniGameReactionRateWidget;
import 'package:flutter/material.dart';

const measureReactionRateTotalCnt = 3;
const penaltyTime = 0.5;

class MiniGameReactionRateModel
    extends FlutterFlowModel<MiniGameReactionRateWidget> {

  List<double> reactionRate = [];
  bool ready = true;
  int startTime = 0;
  late Timer timer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
