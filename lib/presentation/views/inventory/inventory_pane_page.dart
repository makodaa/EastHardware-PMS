import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/presentation/bloc/inventory/productlist/product_list_bloc.dart';
import 'package:easthardware_pms/presentation/bloc/navigation/navigation_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/widgets/buttons/text_button.dart';
import 'package:easthardware_pms/presentation/widgets/data_table_place_holder.dart';
import 'package:easthardware_pms/presentation/widgets/helper/data_row_mapper.dart';
import 'package:easthardware_pms/presentation/widgets/helper/route_index_mapper.dart';
import 'package:easthardware_pms/presentation/widgets/kpi_card.dart';
import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show DataColumn, DataTable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InventoryPanePage extends StatelessWidget {
  const InventoryPanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.panePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageHeader(),
          const InventorySummary(),
          const ProductListSection(),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeadingText('Products'),
        const Spacer(flex: 1),
        TextButton('Manage Categories', onPressed: () {
          const route = AppRoutes.categoriesPage;
          context
              .read<NavigationBloc>()
              .add(NavigationIndexChanged(index: RouteIndexMapper.getIndexFromRoute(route)!));
        }),
        TextButtonFilled('New Product', onPressed: () {
          const route = AppRoutes.createProductPage;
          context
              .read<NavigationBloc>()
              .add(NavigationIndexChanged(index: RouteIndexMapper.getIndexFromRoute(route)!));
        }),
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class InventorySummary extends StatelessWidget {
  const InventorySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SubheadingText('Inventory Summary'),
            BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                final activeCount =
                    state.allProducts.where((product) => product.archiveStatus == 0).length;
                final lowStockCount = state.lowStockProducts.length;
                final fastMovingCount = state.fastMovingProducts.length;
                final deadCount = state.deadStockProducts.length;

                return Expanded(
                  child: Row(
                    children: [
                      ActiveCountCard(value: activeCount.toString()),
                      LowStockCountCard(value: lowStockCount.toString()),
                      HangingCountCard(value: deadCount.toString()),
                      FastMovingCountCard(value: fastMovingCount.toString()),
                    ].withSpacing(() => Spacing.h16),
                  ),
                );
              },
            ),
          ].withSpacing(() => Spacing.v8),
        ),
      ),
    );
  }
}

class ActiveCountCard extends KPICard {
  const ActiveCountCard({super.key, required super.value})
      : super(
          'Active Products',
          icon: const Icon(FluentIcons.product),
        );
}

class LowStockCountCard extends KPICard {
  const LowStockCountCard({super.key, required super.value})
      : super(
          'Low Stock Products',
          icon: const Icon(FluentIcons.product_warning),
        );
}

class HangingCountCard extends KPICard {
  const HangingCountCard({super.key, required super.value})
      : super(
          'Hanging Products',
          icon: const Icon(FluentIcons.market_down),
        );
}

class FastMovingCountCard extends KPICard {
  const FastMovingCountCard({super.key, required super.value})
      : super(
          'Fast Moving Products',
          icon: const Icon(FluentIcons.market),
        );
}

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: TextBox(placeholder: "Search"),
        ),
        const CategoryButton(),
        const SortByButton(),
        const Spacer(flex: 2),
      ].withSpacing(() => Spacing.h8),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      title: const Padding(
        padding: AppPadding.a4,
        child: ButtonText('Category'),
      ),
      items: [
        MenuFlyoutItem(
          text: const BodyText('Category 1'),
          onPressed: () {},
        ),
      ],
    );
  }
}

class SortByButton extends StatelessWidget {
  const SortByButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      title: const Padding(
        padding: AppPadding.a4,
        child: ButtonText('Sort By'),
      ),
      items: [
        MenuFlyoutItem(text: const BodyText('Name Ascending'), onPressed: () {}),
        MenuFlyoutItem(text: const BodyText('Name Descendnig'), onPressed: () {}),
        const MenuFlyoutSeparator(),
        MenuFlyoutItem(text: const BodyText('Stock Ascending'), onPressed: () {}),
        MenuFlyoutItem(text: const BodyText('Stock Descendnig'), onPressed: () {}),
      ],
    );
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SubheadingText('List of Products'),
          const SearchRow(),
          const ProductsDataTable(),
        ].withSpacing(() => Spacing.v8),
      ),
    );
  }
}

class ProductsDataTable extends StatelessWidget {
  const ProductsDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const Expanded(
            child: Center(
              child: ProgressRing(),
            ),
          );
        }

        final allProducts = state.allProducts.where((p) => p.archiveStatus == 0).toList();

        if (allProducts.isEmpty) {
          return const DataTablePlaceHolder(FluentIcons.product_list, 'Products');
        }

        return Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: DataTable(
                showCheckboxColumn: true,
                columns: const [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Price')),
                  DataColumn(label: Text('Cost')),
                  DataColumn(label: Text('Quantity')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: allProducts.map((product) {
                  return DataRowMapper.mapProductToRow(product, () {
                    context.push(AppRoutes.editProductPage, extra: product);
                  });
                }).toList()),
          ),
        );
      },
    );
  }
}
