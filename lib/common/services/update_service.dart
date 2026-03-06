import 'package:in_app_update/in_app_update.dart';
import 'package:flutter/material.dart';
import '/common/services/utils.dart';
import '../widgets/common.dart';

Future<void> checkForUpdate(BuildContext context) async {
  try {
    final info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailability == UpdateAvailability.updateAvailable) {
      showUpdateBottomSheet(context, () async {
        try {
          await InAppUpdate.performImmediateUpdate();
          showToastMessage(context, "Update performed successfully",
              type: 'success');
        } catch (e) {}
      });
    } else {}
  } catch (e) {}
}
