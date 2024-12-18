import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_speed_quiz_widget.dart' show MiniGameSpeedQuizWidget;
import 'package:flutter/material.dart';

const double settingTime = 60;

List<String> problem = [
  '컴퓨터가 이해할 수 있는 0과 1로 이루어진 언어를 무엇이라고 하나요?',
  '다음의 이진수의 계산 결과는 무엇인가요?\n001101+000111=010100',
  '로봇이 주변 환경을 감지하기 위해 사용하는 장치는 무엇인가요?',
  '인터넷에 연결된 장치를 제어하거나 데이터는 교환하는 기술을 뭐라고 하나요?',
  '프로그램에 발생한 오류를 찾아 수정하는 과정을 뭐라고 하나요?',
  '다음 중 프로그래밍 언어가 아닌 것은 무엇일까요?',
  '"Hello, World!"를 출력하는 가장 기본적인 Python 코드는 무엇인가요?',
  '다음 중 반복문을 의미하는 Python 키워드는 무엇인가요?',
  '변수에 값을 할당할 때 사용하는 기호는 무엇인가요?',
  '인공지능의 윤리적 문제 중 하나로, AI가 편향된 데이터를 학습해 잘못된 결정을 내리는 현상을 무엇이라 하나요?'
];

List<List<String>> problemChoice = [
  ['aa', 'bb', 'cc', 'dd'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
  ['qq', 'ww', 'ee', 'rr'],
];

List<List<int>> ans = [
  [0, 1],
  [2],
  [2],
  [2],
  [2],
  [2],
  [2],
  [2],
  [2],
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
