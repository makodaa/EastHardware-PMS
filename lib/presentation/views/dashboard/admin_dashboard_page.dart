import 'package:fluent_ui/fluent_ui.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      appBar: const NavigationAppBar(title: Text("Text")),
      pane: NavigationPane(displayMode: PaneDisplayMode.auto, items: [
        PaneItem(icon: const Icon(FluentIcons.home), title: const Text("Home"), body: Container()),
        PaneItem(
            icon: const Icon(FluentIcons.insert), title: const Text("Insert"), body: Container()),
        PaneItem(icon: const Icon(FluentIcons.view), title: const Text("View"), body: Container())
      ]),
    );
  }
}
