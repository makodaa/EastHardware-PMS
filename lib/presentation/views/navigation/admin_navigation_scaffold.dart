import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class AdminNavigationScaffold extends StatefulWidget {
  const AdminNavigationScaffold(this.shell, this.children, {super.key});

  final StatefulNavigationShell shell;
  final List<Widget> children;

  @override
  State<AdminNavigationScaffold> createState() => _AdminNavigationScaffoldState();
}

class _AdminNavigationScaffoldState extends State<AdminNavigationScaffold> {
  int selected = 0;

  // TODO: vincent, dito yung navigation ng sidebar
  void _changePaneItem(int index) {
    widget.shell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      paneBodyBuilder: (item, body) {
        return widget.children[widget.shell.currentIndex];
      },
      pane: NavigationPane(
        displayMode: PaneDisplayMode.auto,
        onItemPressed: _changePaneItem,
        items: [
          PaneItem(
              icon: const Icon(FluentIcons.home),
              title: const Text("Dashboard"),
              body: const SizedBox()),
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.package),
            title: const Text("Inventory"),
            body: const SizedBox(),
          )
        ],
      ),
    );
  }
}
