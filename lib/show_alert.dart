import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAlertWithoutChoice(BuildContext context, String title) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true, // 배경 클릭 시 닫힘
    barrierLabel: "Dismiss",
    transitionDuration: const Duration(milliseconds: 500), // 애니메이션 지속 시간
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('확인'),
                ),
              ),
            ],
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Fade + Scale 애니메이션 적용
      return ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
    },
  );
}


Future<bool?> showAlertWithTwoChoice(BuildContext context, String title, String firstChoice, String secondChoice) {
  return showCupertinoDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(title),
        actions: [
          Center(
            child: Column(
              children: [
                TextButton(
                  child: Text(firstChoice),
                  onPressed: () {
                    Navigator.of(context).pop(true); // '예' 선택 시 true 반환
                  },
                ),
                const SizedBox(height: 12.0),
                TextButton(
                  child: Text(secondChoice),
                  onPressed: () {
                    Navigator.of(context).pop(false); // '아니요' 선택 시 false 반환
                  },
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}