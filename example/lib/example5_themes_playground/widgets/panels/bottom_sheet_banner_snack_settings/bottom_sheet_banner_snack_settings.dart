import 'dart:async';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/theme_showcase.dart';
import '../../shared/color_scheme_popup_menu.dart';

class BottomSheetBannerSnackSettings extends StatelessWidget {
  const BottomSheetBannerSnackSettings(this.controller, {super.key});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;
    final bool isDark = theme.brightness == Brightness.dark;

    final String snackDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (light primary, 93% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (dark primary, 95% opacity)'
            : useMaterial3
                ? 'default (inverseSurface)'
                : 'default (onSurface.op80%, alphaBlend surface)';

    final String snackActionDefaultColorLabel = isDark
        ? (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)'
        : (controller.useSubThemes && controller.useFlexColorScheme)
            ? 'default (inversePrimary)'
            : useMaterial3
                ? 'default (inversePrimary)'
                : 'default (secondary)';

    final String sheetDefaultColorLabel =
        controller.useSubThemes && controller.useFlexColorScheme
            ? 'default (surface)'
            : useMaterial3
                ? 'default (surface)'
                : 'default (theme.canvasColor)';
    final String sheetElevationDefaultLabel =
        controller.bottomSheetElevation == null
            ? useMaterial3
                ? 'default 1'
                : 'default 4'
            : '';
    final String sheetModalElevationDefaultLabel =
        controller.bottomSheetModalElevation == null
            ? useMaterial3
                ? 'default 2'
                : 'default 8'
            : '';
    final String sheetRadiusDefaultLabel =
        controller.bottomSheetBorderRadius == null &&
                controller.defaultRadius == null
            ? 'default 28'
            : controller.bottomSheetBorderRadius == null &&
                    controller.defaultRadius != null
                ? 'global ${controller.defaultRadius!.toStringAsFixed(0)}'
                : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('BottomSheet border radius (modal and none modal)'),
          subtitle: Slider(
            min: -1,
            max: 50,
            divisions: 51,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius == null ||
                        (controller.bottomSheetBorderRadius ?? -1) < 0
                    ? sheetRadiusDefaultLabel
                    : (controller.bottomSheetBorderRadius?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 28'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetBorderRadius ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetBorderRadius(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'RADIUS',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetBorderRadius == null ||
                              (controller.bottomSheetBorderRadius ?? -1) < 0
                          ? sheetRadiusDefaultLabel
                          : (controller.bottomSheetBorderRadius
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 28'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetShowcase(),
        ),
        const SizedBox(height: 16),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('BottomSheet elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation == null ||
                        (controller.bottomSheetElevation ?? -1) < 0
                    ? sheetElevationDefaultLabel
                    : (controller.bottomSheetElevation?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetElevation == null ||
                              (controller.bottomSheetElevation ?? -1) < 0
                          ? sheetElevationDefaultLabel
                          : (controller.bottomSheetElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('BottomSheet background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetSchemeColor(null);
                  } else {
                    controller
                        .setBottomSheetSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: BottomSheetModalShowcase(),
        ),
        const SizedBox(height: 16),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Modal BottomSheet elevation'),
          subtitle: Slider(
            min: -1,
            max: 20,
            divisions: 21,
            label: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation == null ||
                        (controller.bottomSheetModalElevation ?? -1) < 0
                    ? sheetModalElevationDefaultLabel
                    : (controller.bottomSheetModalElevation
                            ?.toStringAsFixed(0) ??
                        '')
                : useMaterial3
                    ? 'default 1'
                    : 'default 0',
            value: controller.useSubThemes && controller.useFlexColorScheme
                ? controller.bottomSheetModalElevation ?? -1
                : -1,
            onChanged: controller.useSubThemes && controller.useFlexColorScheme
                ? (double value) {
                    controller.setBottomSheetModalElevation(
                        value < 0 ? null : value.roundToDouble());
                  }
                : null,
          ),
          trailing: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'ELEV',
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  controller.useSubThemes && controller.useFlexColorScheme
                      ? controller.bottomSheetModalElevation == null ||
                              (controller.bottomSheetModalElevation ?? -1) < 0
                          ? sheetModalElevationDefaultLabel
                          : (controller.bottomSheetModalElevation
                                  ?.toStringAsFixed(0) ??
                              '')
                      : useMaterial3
                          ? 'default 1'
                          : 'default 0',
                  style: theme.textTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        ColorSchemePopupMenu(
          title: const Text('Modal BottomSheet background color'),
          labelForDefault: sheetDefaultColorLabel,
          index: controller.bottomSheetModalSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setBottomSheetModalSchemeColor(null);
                  } else {
                    controller.setBottomSheetModalSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        const SizedBox(height: 16),
        const Divider(),
        ColorSchemePopupMenu(
          title: const Text('SnackBar background color'),
          subtitle: const Text('Set to inverseSurface for default M3 style'),
          labelForDefault: snackDefaultColorLabel,
          index: controller.snackBarSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSnackBarSchemeColor(null);
                  } else {
                    controller
                        .setSnackBarSchemeColor(SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ColorSchemePopupMenu(
          title: const Text('SnackBar action button text color'),
          labelForDefault: snackActionDefaultColorLabel,
          index: controller.snackBarActionSchemeColor?.index ?? -1,
          onChanged: controller.useSubThemes && controller.useFlexColorScheme
              ? (int index) {
                  if (index < 0 || index >= SchemeColor.values.length) {
                    controller.setSnackBarActionSchemeColor(null);
                  } else {
                    controller.setSnackBarActionSchemeColor(
                        SchemeColor.values[index]);
                  }
                }
              : null,
        ),
        ListTile(
          title: const Text('Show a fixed test SnackBar'),
          trailing: FilledButton(
            onPressed: () {
              unawaited(_showDemoSnackBar(context, SnackBarBehavior.fixed,
                  'A SnackBar with SnackBarBehavior.fixed'));
            },
            child: const Text('Fixed Snack'),
          ),
          onTap: () {
            unawaited(_showDemoSnackBar(context, SnackBarBehavior.fixed,
                'A SnackBar with SnackBarBehavior.fixed'));
          },
        ),
        ListTile(
          title: const Text('Show a floating test SnackBar'),
          trailing: FilledButton(
            onPressed: () {
              unawaited(_showDemoSnackBar(context, SnackBarBehavior.floating,
                  'A SnackBar with SnackBarBehavior.floating'));
            },
            child: const Text('Float Snack'),
          ),
          onTap: () {
            unawaited(_showDemoSnackBar(context, SnackBarBehavior.floating,
                'A SnackBar with SnackBarBehavior.floating'));
          },
        ),
        const SizedBox(height: 8),
        const MaterialBannerSnackBarShowcase(),
        const SizedBox(height: 8),
      ],
    );
  }

  Future<void> _showDemoSnackBar(
      BuildContext context, SnackBarBehavior style, String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: style,
        showCloseIcon: true,
        action: SnackBarAction(
          label: 'Close',
          onPressed: () {},
        ),
        duration: const Duration(milliseconds: 3000),
      ),
    );
  }
}
