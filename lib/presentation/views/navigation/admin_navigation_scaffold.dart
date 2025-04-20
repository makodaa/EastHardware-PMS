import 'package:easthardware_pms/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:easthardware_pms/presentation/widgets/brand/navrail_header.dart';
import 'package:easthardware_pms/presentation/widgets/helper/route_index_mapper.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminNavigationScaffold extends StatelessWidget {
  const AdminNavigationScaffold(this.shell, this.children, {super.key});

  final StatefulNavigationShell shell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        final route = RouteIndexMapper.getRouteFromIndex(state);
        if (route != null && state.selectedIndex != shell.currentIndex) {
          context.push(route);
        }
      },
      builder: (context, state) {
        return NavigationView(
            paneBodyBuilder: (item, body) {
              return children[shell.currentIndex];
            },
            pane: NavigationPane(
              header: const LogoRow(),
              selected: state.selectedIndex,
              displayMode: PaneDisplayMode.auto,
              onItemPressed: (index) {
                if ([1].contains(index)) index++;
                context.read<NavigationBloc>().add(NavigationIndexChanged(index: index));
              },
              items: [
                PaneItem(
                  icon: const Icon(FluentIcons.dynamic_list),
                  title: const Text("Dashboard"),
                  body: const SizedBox(),
                ),
                PaneItemSeparator(),
                PaneItemExpander(
                  icon: const Icon(FluentIcons.product),
                  title: const Text("Inventory"),
                  body: const SizedBox(),
                  items: _inventorySubItems,
                ),
                PaneItemExpander(
                  title: const Text('Billing'),
                  icon: const Icon(FluentIcons.text_document),
                  items: _billingSubItems,
                  body: const SizedBox(),
                ),
                PaneItemExpander(
                  title: const Text('Orders'),
                  icon: const Icon(FluentIcons.bill),
                  items: _orderSubItems,
                  body: const SizedBox(),
                ),
                PaneItem(
                  icon: const Icon(FluentIcons.bar_chart_vertical_fill),
                  title: const Text('Reports'),
                  body: const SizedBox(),
                )
                //
              ],
            ));
      },
    );
  }
}

List<NavigationPaneItem> _inventorySubItems = [
  PaneItem(
    icon: const Icon(FluentIcons.product_list),
    title: const Text("List of Products"),
    body: const SizedBox(),
  ),
  PaneItem(
    icon: const Icon(FluentIcons.product_release),
    title: const Text("Create Product"),
    body: const SizedBox(),
  ),
  PaneItem(
    icon: const Icon(FluentIcons.product_catalog),
    title: const Text("Manage Categories"),
    body: const SizedBox(),
  ),
];

List<NavigationPaneItem> _billingSubItems = [
  PaneItem(
    icon: const Icon(FluentIcons.text_document),
    title: const Text("Invoice List"),
    body: const SizedBox(),
  ),
  PaneItem(
    icon: const Icon(FluentIcons.text_document_edit),
    title: const Text("Payments"),
    body: const SizedBox(),
  ),
];

List<NavigationPaneItem> _orderSubItems = [
  PaneItem(
    icon: const Icon(FluentIcons.bill),
    title: const Text('Orders List'),
    body: const SizedBox(),
  ),
  PaneItem(
    icon: const Icon(FluentIcons.reservation_orders),
    title: const Text('Manage Expense Type'),
    body: const SizedBox(),
  ),
];
