import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/utils/app_scroll_behavior.dart';
import 'app_example_chat.dart';
import 'app_example_components.dart';
import 'app_example_login.dart';
import 'app_example_shop.dart';

/// An example that show what an app using the theme might look like
class ThemeSimulator extends StatefulWidget {
  const ThemeSimulator({required this.controller, super.key});

  final ThemeController controller;

  @override
  State<ThemeSimulator> createState() => _ThemeSimulatorState();
}

class _ThemeSimulatorState extends State<ThemeSimulator>
    with TickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    currentPage = widget.controller.simulatorAppIndex;
    tabController = TabController(
      initialIndex: currentPage,
      length: 4,
      vsync: this,
    );
    // Update stored page info also if swiped to new page.
    tabController.addListener(() {
      if (tabController.index != currentPage) {
        currentPage = tabController.index;
        widget.controller.setSimulatorAppIndex(currentPage);
      }
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ScrollConfiguration(
      behavior: const DragScrollBehavior(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
              child: TabBar(
                indicatorColor: theme.colorScheme.primary,
                labelColor: theme.colorScheme.primary,
                unselectedLabelColor: theme.colorScheme.onSurface,
                controller: tabController,
                onTap: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                    widget.controller.setSimulatorAppIndex(currentPage);
                  });
                },
                tabs: const <Widget>[
                  Tab(text: 'Components'),
                  Tab(text: 'Login'),
                  Tab(text: 'Shop'),
                  Tab(text: 'Chat'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const ListTile(
              title: Text('Themed app simulated on a device'),
              subtitle: Text('Select device device: iPhone 13 Max Pro'),
            ),
            ListTile(
              leading: const Text('Size'),
              title: Slider(
                min: 400,
                max: 1400,
                divisions: 100,
                label: widget.controller.deviceSize.toStringAsFixed(0),
                value: widget.controller.deviceSize,
                onChanged: widget.controller.setDeviceSize,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: widget.controller.deviceSize,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    SimulatorFrame(
                      child:
                          AppExampleComponents(controller: widget.controller),
                    ),
                    const SimulatorFrame(
                      child: AppExampleLogin(),
                    ),
                    const SimulatorFrame(
                      child: AppExampleShop(),
                    ),
                    SimulatorFrame(
                      child: AppExampleChat(controller: widget.controller),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
          ]),
    );
  }
}

class SimulatorFrame extends StatelessWidget {
  const SimulatorFrame({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: Devices.ios.iPhone13ProMax,
      orientation: Orientation.portrait,
      screen: Builder(
        builder: (BuildContext deviceContext) => MaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: Theme.of(context),
          home: child,
        ),
      ),
    );
  }
}