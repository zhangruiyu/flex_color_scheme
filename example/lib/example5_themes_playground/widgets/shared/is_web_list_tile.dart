import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../shared/widgets/universal/is_web_toggle_buttons.dart';

class IsWebListTile extends StatelessWidget {
  const IsWebListTile({
    required this.controller,
    super.key,
  });
  final ThemeController controller;

  String _explainLabelStyle(final bool? isWeb) {
    switch (isWeb) {
      case true:
        return 'Mock web platform info (kIsWeb=true) is used';
      case false:
        return 'Mock web platform info (kIsWeb=false) is used';
      case null:
        return 'Actual web platform info (kIsWeb=$kIsWeb) is used';
    }
    return 'Actual web platform info (kIsWeb=$kIsWeb) is used';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Set mock web platform for adaptive theming testing'),
      subtitle: Text(_explainLabelStyle(controller.fakeIsWeb)),
      trailing: IsWebToggleButtons(
        isWeb: controller.fakeIsWeb,
        onChanged: controller.setFakeIsWeb,
      ),
      onTap: () {
        if (controller.fakeIsWeb ?? false) {
          controller.setFakeIsWeb(null);
        } else if (controller.fakeIsWeb == null) {
          controller.setFakeIsWeb(false);
        } else {
          controller.setFakeIsWeb(true);
        }
      },
    );
  }
}