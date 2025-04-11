import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

extension DialogExtension on BuildContext {
  Future<T?> showDialog<T>({
    String? titleText,
    String? confirmTitle,
    Widget? titleWidget,
    String? bodyText,
    Widget? bodyWidget,
    List<Widget>? actions,
    double? maxWidth,
    Color? confirmButtonBackgroundColor,
    Color? cancelButtonForegroundColor,
    bool warning = false,
    EdgeInsetsGeometry? actionsPadding,
    bool barrierDismissible = true,
  }) async {
    return showGeneralDialog<T?>(
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      context: this,
      transitionBuilder: (context, a1, a2, widget) {
        return Opacity(
          opacity: a1.value,
          child: AlertDialog(
            title: titleWidget ?? Text(titleText!),
            actionsPadding: actionsPadding,
            content: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth ?? 400),
              child: bodyWidget ?? Text(bodyText!),
            ),
            actions:
                actions ??
                [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor:
                          cancelButtonForegroundColor ??
                          (warning ? context.colorScheme.onSurface : null),
                    ),
                    child: Text(context.appLocalization.cancel),
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          confirmButtonBackgroundColor ??
                          (warning ? context.colorScheme.error : null),
                    ),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text(context.appLocalization.confirm),
                  ),
                ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 240),
      pageBuilder: (BuildContext context, animation1, animation2) {
        return const SizedBox.shrink();
      },
    ).then<T?>((value) => value);
  }
}
