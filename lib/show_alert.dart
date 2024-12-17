import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

Future<void> showAlertWithoutChoice(BuildContext context, String title) async {
  return showGeneralDialog<void>(
    context: context,
    barrierDismissible: false,
    barrierLabel: "Dismiss",
    transitionDuration: const Duration(milliseconds: 500),
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
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop(); // 안전하게 pop 호출
                    }
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