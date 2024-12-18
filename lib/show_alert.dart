import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showAlertWithoutChoice(BuildContext context, String title) async {
  bool pagePop = false;

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
                    if (!pagePop) {
                      if (Navigator.canPop(context)) {
                        pagePop = true;
                        Navigator.of(context).pop();
                      }
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