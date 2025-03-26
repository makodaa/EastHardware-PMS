import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show DataCell, DataColumn, DataRow, DataTable;

class InventoryPanePage extends StatelessWidget {
  const InventoryPanePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Title(),
          const SearchRow(),
          const Expanded(child: ProductsDisplay())
        ].withGap(() => Gaps.v16),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Products',
      style: FluentTheme.of(context).typography.title,
    );
  }
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
          child: TextBox(
            placeholder: "Search",
          ),
        ),
        Button(
          child: const Padding(
            padding: AppPadding.a8,
            child: Text('Customize Categories'),
          ),
          onPressed: () {},
        ),
        FilledButton(
          child: const Padding(
            padding: AppPadding.a8,
            child: Text('New Product'),
          ),
          onPressed: () {
            router.pushNamed('CreateProduct');
          },
        )
      ].withGap(() => Gaps.h16),
    );
  }
}

class ProductsDisplay extends StatelessWidget {
  const ProductsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.a4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DataTable(
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
      ),
    );
  }
}
