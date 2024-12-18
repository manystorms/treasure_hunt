import 'dart:async';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'mini_game_typing_widget.dart' show MiniGameTypingWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

const double settingTime = 30;
const List<String> textAsk = [
  "Hannah는 거꾸로 읽어도 한나이다.",
  "글을 빨리 쓰는 것과 잘 쓰는것은 전혀 다른 실력이다.",
  "새로운 사람들은 쫓아내야할 침략군이 아니다.",
  "서울 특별시 특허 허가국 특허 허가과 허가과장 허과장",
];
class MiniGameTypingModel extends FlutterFlowModel<MiniGameTypingWidget> {
  ///  State fields for stateful widgets in this page.

  late Timer timer;
  double timeLeft = settingTime;
  int problemText = 0;
  int ansText = 0;
  bool? previousProblemAns;

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    timer.cancel();
  }
}
