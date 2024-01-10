


import 'package:babynama/themes/extension.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../themes/app_text.dart';

@lazySingleton
class SnackbarService {
  BuildContext get context => StackedService.navigatorKey!.currentContext!;
  SnackBar errorSnackBar({
    String? title,
    required String subTitle,
    required bool isDarkMode,
    required BuildContext context,
    Duration duration = const Duration(milliseconds: 4000),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    return SnackBar(
      elevation: 0,
      dismissDirection: dismissDirection,
      backgroundColor: Colors.red.withOpacity(0.8),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      content: AppText(subTitle, context).bodyMedium,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(20),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      // clipBehavior: Clip.hardEdge,
    );
  }
  showSnackMessage(
    String message, {
    Duration duration = const Duration(milliseconds: 4000),
    DismissDirection dismissDirection = DismissDirection.down,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(errorSnackBar(
      subTitle: message,
      isDarkMode: false,
      dismissDirection: dismissDirection,
      duration: duration,
      context: context,
    ));
  }

  // showSnackSuccessMessage(
  //   String message, {
  //   Duration duration = const Duration(milliseconds: 4000),
  //   DismissDirection dismissDirection = DismissDirection.down,
  // }) {
  //   ScaffoldMessenger.of(context).showSnackBar(successSnackBar(
  //     subTitle: message,
  //     isDarkMode: false,
  //     dismissDirection: dismissDirection,
  //     duration: duration,
  //     context: context,
  //   ));
  // }
  //
  // showUndoSnack(String message, BuildContext context,
  //     {required VoidCallback undoCallback}) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     elevation: 0,
  //     backgroundColor: context.colorScheme.appBodyColor,
  //     behavior: SnackBarBehavior.floating,
  //     duration: const Duration(seconds: 2),
  //     content: Row(
  //       children: [
  //         AppText(message, context).bodyMedium,
  //         const Spacer(),
  //         RawMaterialButton(
  //           onPressed: undoCallback,
  //           fillColor: context.colorScheme.appBodyColor,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(5),
  //           ),
  //           padding: EdgeInsets.zero,
  //           constraints: const BoxConstraints(
  //             minHeight: 30,
  //             maxHeight: 30,
  //             maxWidth: 50,
  //             minWidth: 50,
  //           ),
  //           child: AppText(AppString.undo, context).bodyMedium,
  //         ),
  //       ],
  //     ),
  //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
  //     padding: const EdgeInsets.symmetric(horizontal: 16),
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(Radius.circular(8)),
  //     ),
  //     // clipBehavior: Clip.hardEdge,
  //   ));
  // }

  void get clearSnackbars => ScaffoldMessenger.of(context).clearSnackBars();
}
