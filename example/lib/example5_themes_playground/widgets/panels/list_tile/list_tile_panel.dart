import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';
import '../../../../shared/widgets/universal/slider_list_tile_reveal.dart';
import '../../../theme/theme_values.dart';
import '../../shared/color_scheme_popup_menu.dart';

class ListTilePanel extends StatelessWidget {
  const ListTilePanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool useMaterial3 = theme.useMaterial3;

    // The most common logic for enabling Playground controls.
    final bool enableControl =
        controller.useSubThemes && controller.useFlexColorScheme;

    // Paddings for the two column control layouts.
    const EdgeInsetsDirectional paddingStartColumn =
        EdgeInsetsDirectional.only(start: 16, end: 8);
    final EdgeInsetsDirectional paddingEndColumn =
        EdgeInsetsDirectional.only(start: 8, end: useMaterial3 ? 24 : 16);

    return Column(
      children: <Widget>[
        const SizedBox(height: 8),
        ColorSchemePopupMenu(
          enabled: enableControl,
          title: const Text('Selected color'),
          defaultLabel: 'primary',
          value: controller.listTileSelectedSchemeColor,
          onChanged: controller.setListTileSelectedSchemeColor,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingStart(context),
                title: const Text('Icon color'),
                defaultLabel: 'onSurfaceVariant',
                defaultLabelM2: 'Black opacity 54%',
                defaultLabelDarkM2: 'White',
                value: controller.listTileIconSchemeColor,
                onChanged: controller.setListTileIconSchemeColor,
              ),
            ),
            Expanded(
              child: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: ThemeValues.tilePaddingEnd(context),
                title: const Text('Text color'),
                defaultLabel: 'Used text styles',
                defaultLabelM2: 'Used text styles & subtitle bodySmall',
                defaultDisabledLabel: 'onSurface',
                value: controller.listTileTextSchemeColor,
                onChanged: controller.setListTileTextSchemeColor,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: paddingStartColumn,
                title: const Text('Tile color'),
                defaultLabel: 'transparent',
                value: controller.listTileTileSchemeColor,
                onChanged: controller.setListTileTileSchemeColor,
              ),
            ),
            Expanded(
              child: ColorSchemePopupMenu(
                enabled: enableControl,
                contentPadding: paddingEndColumn,
                title: const Text('Selected tile color'),
                defaultLabel: 'transparent',
                value: controller.listTileSelectedTileSchemeColor,
                onChanged: controller.setListTileSelectedTileSchemeColor,
              ),
            ),
          ],
        ),
        ListTile(
          enabled: controller.useSubThemes && controller.useFlexColorScheme,
          title: const Text('Content padding'),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
                trailingWidth: 52,
                enabled: enableControl,
                value: controller.listTilePaddingStart,
                onChanged: controller.setListTilePaddingStart,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'START',
                valueUnitLabel: ' dp',
                valueDefaultLabel: '16 dp',
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
                trailingWidth: 60,
                enabled: enableControl,
                value: controller.listTilePaddingEnd,
                onChanged: controller.setListTilePaddingEnd,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'END',
                valueUnitLabel: ' dp',
                valueDefaultLabel: useMaterial3 ? '24 dp' : '16 dp',
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingStartColumn,
                trailingWidth: 52,
                enabled: enableControl,
                value: controller.listTilePaddingTop,
                onChanged: controller.setListTilePaddingTop,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'TOP',
                valueUnitLabel: ' dp',
                valueDefaultLabel: '0 dp',
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                contentPadding: paddingEndColumn,
                trailingWidth: 60,
                enabled: enableControl,
                value: controller.listTilePaddingBottom,
                onChanged: controller.setListTilePaddingBottom,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'BOTTOM',
                valueUnitLabel: ' dp',
                valueDefaultLabel: '0 dp',
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SliderListTileReveal(
                title: const Text('Horizontal title gap'),
                contentPadding: paddingStartColumn,
                trailingWidth: 52,
                enabled: enableControl,
                value: controller.listTileHorizontalTitleGap,
                onChanged: controller.setListTileHorizontalTitleGap,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'GAP',
                valueUnitLabel: ' dp',
                valueDefaultLabel: '16 dp',
              ),
            ),
            Expanded(
              child: SliderListTileReveal(
                title: const Text('Min vertical padding'),
                contentPadding: paddingEndColumn,
                trailingWidth: 60,
                enabled: enableControl,
                value: controller.listTileMinVerticalPadding,
                onChanged: controller.setListTileMinVerticalPadding,
                min: 0,
                max: 40,
                divisions: 40,
                valueDecimalPlaces: 0,
                valueHeading: 'PADDING',
                valueUnitLabel: ' dp',
                valueDefaultLabel: useMaterial3 ? '8 dp' : '4 dp',
              ),
            ),
          ],
        ),
        const Divider(height: 1),
        const ListTileShowcase(),
        const Divider(height: 1),
        const SwitchListTileShowcase(),
        const Divider(height: 1),
        const CheckboxListTileShowcase(),
        const Divider(height: 1),
        const RadioListTileShowcase(),
        const Divider(),
        const ExpansionTileShowcase(),
        const SizedBox(height: 8),
        const ExpansionPanelListShowcase(),
        const SizedBox(height: 16),
      ],
    );
  }
}
