import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: NavigationAppBar(
        height: 52.0,
        leading: Image.asset('assets/icons/app.png', height: 24, width: 24),
        actions: const AppBarActionsGroup(),
      ),
      pane: NavigationPane(displayMode: PaneDisplayMode.auto, items: [
        PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text("Home"),
            body: const Text("Check")),
        PaneItemSeparator(),
      ]),
    );
  }
}

class AppBarActionsGroup extends StatelessWidget {
  const AppBarActionsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a8,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const NavigationSearchBar(),
          ToolTipIconButton(
              icon: const Icon(FluentIcons.settings, size: 18.0),
              tooltip: "Settings",
              onPressed: () {}),
          IconButton(
              icon: const Icon(
                FluentIcons.contact,
                size: 18.0,
              ),
              onPressed: () {}),
          const Text('Administrator')
          // ignore: prefer_const_constructors
        ],
      ),
    );
  }
}

class ToolTipIconButton extends StatelessWidget {
  const ToolTipIconButton(
      {super.key, required this.icon, required this.tooltip, required this.onPressed});
  final String tooltip;
  final Icon icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: tooltip,
        useMousePosition: false,
        style: const TooltipThemeData(preferBelow: true),
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ));
  }
}

class NavigationSearchBar extends StatefulWidget {
  const NavigationSearchBar({super.key});

  @override
  State<NavigationSearchBar> createState() => _NavigationSearchBarState();
}

class _NavigationSearchBarState extends State<NavigationSearchBar> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480.0),
      child: const TextBox(
        prefix: Padding(
          padding: AppPadding.a8,
          child: Icon(
            FluentIcons.search,
            size: 16.0,
          ),
        ),
        placeholder: 'Search',
      ),
    );
  }
}
