import 'package:easthardware_pms/domain/enums/enums.dart';
import 'package:easthardware_pms/presentation/bloc/inventory/productlist/product_list_bloc.dart';
import 'package:easthardware_pms/presentation/router/app_routes.dart';
import 'package:easthardware_pms/presentation/widgets/buttons/text_button.dart';
import 'package:easthardware_pms/presentation/widgets/helper/data_row_mapper.dart';
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
          const SummarySection(),
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
        Expanded(child: Container()),
        TextButton('Manage Categories', onPressed: () => context.push(AppRoutes.categoriesPage)),
        TextButtonFilled('New Product', onPressed: () => context.push(AppRoutes.createProductPage)),
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        children: const [
          InventorySummary(),
        ].withSpacing(() => Spacing.h16),
      ),
    );
  }
}

class InventorySummary extends StatelessWidget {
  const InventorySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SubheadingText('Inventory Summary'),
          BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              final totalCount = state.allProducts.length;
              final lowStockCount = state.lowStockProducts.length;
              final fastMovingCount = state.fastMovingProducts.length;
              final deadCount = state.deadStockProducts.length;

              return Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          TotalCountCard(value: totalCount.toString()),
                          LowStockCountCard(value: lowStockCount.toString()),
                          HangingCountCard(value: deadCount.toString()),
                          FastMovingCountCard(value: fastMovingCount.toString()),
                        ].withSpacing(() => Spacing.h16),
                      ),
                    ),
                  ].withSpacing(() => Spacing.v16),
                ),
              );
            },
          ),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class TotalCountCard extends KPICard {
  const TotalCountCard({super.key, required super.value})
      : super(
          'Total Products',
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
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SubheadingText('List of Products'),
          const SearchRow(),
          Expanded(
            child: Container(
              padding: AppPadding.a4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const MockDataTable(),
            ),
          ),
        ].withSpacing(() => Spacing.v8),
      ),
    );
  }
}

class MockDataTable extends StatelessWidget {
  const MockDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListState>(
      builder: (context, state) {
        if (state.status == DataStatus.loading) {
          return const Center(
            child: ProgressRing(),
          );
        }

        final allProducts = state.allProducts.where((p) => p.archiveStatus == 0).toList();

        if (allProducts.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FluentIcons.product_list,
                  size: 48,
                  color: Colors.grey,
                ),
                SizedBox(height: 16),
                Text(
                  'No products found',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return DataTable(
            showCheckboxColumn: true,
            columns: const [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text("SKU")),
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
            }).toList());
      },
    );
  }
}
