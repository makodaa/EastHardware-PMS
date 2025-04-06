import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:easthardware_pms/presentation/widgets/buttons/text_button.dart';
import 'package:easthardware_pms/presentation/widgets/kpi_card.dart';
import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show DataCell, DataColumn, DataRow, DataTable;

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
        TextButton('Manage Categories', onPressed: () {}),
        TextButtonFilled('New Product', onPressed: () => router.pushNamed('CreateProduct')),
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
          Notifications(),
        ].withSpacing(() => Spacing.h16),
      ),
    );
  }
}

class InventorySummary extends StatelessWidget {
  const InventorySummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SubheadingText('Inventory Summary'),
          Expanded(
            child: Row(
              children: const [
                TotalCountCard(),
                LowStockCountCard(),
              ].withSpacing(() => Spacing.h16),
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                HangingCountCard(),
                FastMovingCountCard(),
              ].withSpacing(() => Spacing.h16),
            ),
          ),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class Notifications extends StatelessWidget {
  const Notifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SubheadingText('Notifications'),
          Expanded(
            child: Container(
              color: Colors.white,
              padding: AppPadding.a8,
              child: const BodyText('Add List View here'),
            ),
          ),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class TotalCountCard extends KPICard {
  const TotalCountCard({super.key})
      : super(
          'Total Products',
          value: '100',
          icon: const Icon(FluentIcons.product),
        );
}

class LowStockCountCard extends KPICard {
  const LowStockCountCard({super.key})
      : super(
          'Low Stock Products',
          value: '0',
          icon: const Icon(FluentIcons.product_warning),
        );
}

class HangingCountCard extends KPICard {
  const HangingCountCard({super.key})
      : super(
          'Hanging Products',
          value: '0',
          icon: const Icon(FluentIcons.market_down),
        );
}

class FastMovingCountCard extends KPICard {
  const FastMovingCountCard({super.key})
      : super(
          'Fast Moving Products',
          value: '0',
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
    return DataTable(
      columns: const [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Category')),
        DataColumn(label: Text('Price')),
        DataColumn(label: Text('Stock')),
        DataColumn(label: Text('Actions')),
      ],
      rows: const [
        DataRow(cells: [
          DataCell(Text('Product 1')),
          DataCell(Text('Category 1')),
          DataCell(Text('100')),
          DataCell(Text('10')),
          DataCell(Text('Edit')),
        ]),
        DataRow(cells: [
          DataCell(Text('Product 2')),
          DataCell(Text('Category 2')),
          DataCell(Text('200')),
          DataCell(Text('20')),
          DataCell(Text('Edit')),
        ]),
        DataRow(cells: [
          DataCell(Text('Product 3')),
          DataCell(Text('Category 3')),
          DataCell(Text('300')),
          DataCell(Text('30')),
          DataCell(Text('Edit')),
        ]),
      ],
    );
  }
}
