import 'package:easthardware_pms/presentation/widgets/buttons/tool_tip_icon_button.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

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
        ].withGap(() => Gaps.h8),
      ),
    );
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
