import 'package:flutter/material.dart';

import '../../../../shared/const/app_images.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/svg_asset_image.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';

/// An example that show what an app using the theme might look like
class AppExampleHome extends StatelessWidget {
  const AppExampleHome({super.key, required this.controller});

  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      drawer: AppExampleDrawer(controller: controller),
      bottomNavigationBar: const AppExampleNavigationBar(),
    );
  }
}

class AppExampleDrawer extends StatefulWidget {
  const AppExampleDrawer({super.key, required this.controller});

  final ThemeController controller;

  @override
  State<AppExampleDrawer> createState() => _AppExampleDrawerState();
}

class _AppExampleDrawerState extends State<AppExampleDrawer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int value) {
        setState(() {
          selectedIndex = value;
        });
      },
      children: <Widget>[
        CircleAvatar(
          radius: 60,
          backgroundColor: theme.colorScheme.secondaryContainer,
          child: SvgAssetImage(
            assetName: AppImages.nature,
            color: theme.colorScheme.secondary,
          ),
        ),
        Center(
          child: Text(
            'Plants Inc',
            style:
                textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        const NavigationDrawerDestination(
          icon: Badge(
            label: Text('26'),
            child: Icon(Icons.chat_bubble),
          ),
          label: Text('Chat'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.beenhere),
          label: Text('Tasks'),
        ),
        const Divider(),
        const NavigationDrawerDestination(
          icon: Icon(Icons.create_new_folder),
          label: Text('Folder'),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.logout),
          label: Text('Logout'),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: const Text('Theme mode'),
          subtitle: Text('Theme ${widget.controller.themeMode.name}'),
          trailing: ThemeModeSwitch(
            themeMode: widget.controller.themeMode,
            onChanged: widget.controller.setThemeMode,
          ),
          // Toggle theme mode also via the ListTile tap.
          onTap: () {
            if (theme.brightness == Brightness.light) {
              widget.controller.setThemeMode(ThemeMode.dark);
            } else {
              widget.controller.setThemeMode(ThemeMode.light);
            }
          },
        ),
      ],
    );
  }
}

class AppExampleNavigationBar extends StatefulWidget {
  const AppExampleNavigationBar({super.key});

  @override
  State<AppExampleNavigationBar> createState() =>
      _AppExampleNavigationBarState();
}

class _AppExampleNavigationBarState extends State<AppExampleNavigationBar> {
  int buttonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: buttonIndex,
      onDestinationSelected: (int value) {
        setState(() {
          buttonIndex = value;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Badge(
            label: Text('12'),
            child: Icon(Icons.chat_bubble),
          ),
          label: 'Chat',
        ),
        NavigationDestination(
          icon: Icon(Icons.beenhere),
          label: 'Tasks',
        ),
        NavigationDestination(
          icon: Icon(Icons.create_new_folder),
          label: 'Folder',
        ),
      ],
    );
  }
}