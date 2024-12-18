import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_typing_widget.dart' show MiniGameTypingWidget;
import 'package:flutter/material.dart';

const double settingTime = 30;
const List<String> textAsk = [
  "인터넷이 너무 느리다",
  "Hannah는 거꾸로 읽어도 한나",
  "하드 드라이브의 용량 부족",
  "서울 특별시 특허 허가국 특허 허가과 허가과장 허과장",
];

class MiniGameTypingModel extends FlutterFlowModel<MiniGameTypingWidget> {
  ///  State fields for stateful widgets in this page.

  late Timer timer;
  double timeLeft = settingTime;
  int problemTextNum = 0;
  int ansTextNum = 0;
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
