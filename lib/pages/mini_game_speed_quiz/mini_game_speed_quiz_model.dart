import 'dart:async';
import '/flutter_flow/flutter_flow_util.dart';
import 'mini_game_speed_quiz_widget.dart' show MiniGameSpeedQuizWidget;
import 'package:flutter/material.dart';

const double settingTime = 20;

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
  ['이진법(Binary)', '아스키 코드', '텍스트 언어', '자연어'],
  ['6', '8', '18', '20'],
  ['프로세서', '센서', '디스플레이', 'GPS'],
  ['블록체인', '빅데이터', '사물인터넷(IoT)', 'Lidar'],
  ['렉(Lag)', '해킹(Hacking)', '디버깅(Debugging)', '시킹(seeking)'],
  ['Python', 'HTML', 'C++', 'Java'],
  ['print(“Hello, World!”)', 'echo “Hello, World!”', 'console.log(“Hello, World!”)', 'say Hello, World!'],
  ['if', 'while', 'else', 'def'],
  [':', '=', '==', '->'],
  ['AI 오류', '데이터 편향', '알고리즘 최적화', '강화 학습 문제'],
];

List<List<int>> ans = [
  [0],
  [3],
  [1],
  [2],
  [2],
  [1],
  [0],
  [1],
  [1],
  [1],
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
