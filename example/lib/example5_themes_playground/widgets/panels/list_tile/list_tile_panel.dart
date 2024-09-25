import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/list_tile_reveal.dart';
import '../../../../shared/widgets/universal/showcase_material.dart';

class ListTilePanel extends StatelessWidget {
  const ListTilePanel(this.controller, {super.key});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(height: 8),
        ListTileReveal(
          title: Text('List tiles'),
          subtitleReveal: Text(
            'There are many different types of ListTiles in Flutter. They '
            'are useful widgets for showing lists of items, for '
            'settings and options.\n'
            '\n'
            'FlexColorScheme does not currently offer any theming of ListTile '
            'properties. However, if you theme the colors of Switch, Checkbox '
            'or Radio the corresponding ListTiles will use these colors as '
            'well.\n'
            '\n'
            'Below you can find a presentation of what all the different '
            'ListTile types look like with current theme and colors applied '
            'on them.\n',
          ),
        ),
        Divider(height: 1),
        ListTileShowcase(),
        Divider(height: 1),
        SwitchListTileShowcase(),
        Divider(height: 1),
        CheckboxListTileShowcase(),
        Divider(height: 1),
        RadioListTileShowcase(),
        Divider(),
        ListTileReveal(
          title: Text('ExpansionTile'),
          subtitleReveal: Text(
            'No theming properties in current FCS version, only '
            'included to show it with current theme.\n',
          ),
        ),
        ExpansionTileShowcase(),
        Divider(),
        ListTileReveal(
          title: Text('ExpansionPanelList'),
          subtitleReveal: Text(
            'No theming properties in current FCS version, only '
            'included to show it with current theme.\n',
          ),
        ),
        ExpansionPanelListShowcase(),
        SizedBox(height: 16),
      ],
    );
  }
}