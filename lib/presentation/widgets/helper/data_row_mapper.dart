import 'package:easthardware_pms/domain/models/category.dart';
import 'package:easthardware_pms/domain/models/product.dart';
import 'package:easthardware_pms/presentation/widgets/data_row.dart';
import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show DataCell, DataRow;

class DataRowMapper {
  static DataRow mapProductToRow(Product product, Function() action) {
    if (product.isBelowCriticalLevel!) {
      return WarningDataRow([
        DataCell(Text(product.name)),
        DataCell(Text(product.categoryName!)),
        DataCell(Text(product.salePrice.toString())),
        DataCell(Text(product.orderCost.toString())),
        DataCell(Row(
          children: [
            Text('${product.quantity.toString()} ${product.mainUnit}'),
            Spacing.h12,
            Icon(FluentIcons.alert_solid, color: Colors.red.lightest)
          ],
        )),
        DataCell(HyperlinkButton(onPressed: action, child: const Text('Edit')))
      ]);
    }
    if (product.isFastMovingStock!) {
      return SuccessDataRow([
        DataCell(Text(product.name)),
        DataCell(Text(product.categoryName!)),
        DataCell(Text(product.salePrice.toString())),
        DataCell(Text(product.orderCost.toString())),
        DataCell(Text('${product.quantity.toString()} ${product.mainUnit}')),
        DataCell(HyperlinkButton(onPressed: action, child: const Text('Edit')))
      ]);
    }
    if (product.isDeadStock!) {
      return InfoDataRow([
        DataCell(Text(product.name)),
        DataCell(Text(product.categoryName!)),
        DataCell(Text(product.salePrice.toString())),
        DataCell(Text(product.orderCost.toString())),
        DataCell(Text('${product.quantity.toString()} ${product.mainUnit}')),
        DataCell(HyperlinkButton(onPressed: action, child: const Text('Edit')))
      ]);
    }

    return DataRow(cells: [
      DataCell(Text(product.name)),
      DataCell(Text(product.categoryName!)),
      DataCell(Text(product.salePrice.toString())),
      DataCell(Text(product.orderCost.toString())),
      DataCell(Text('${product.quantity.toString()} ${product.mainUnit}')),
      DataCell(HyperlinkButton(onPressed: action, child: const Text('Edit')))
    ]);
  }

  static DataRow mapCategoryToRow(Category category, int productCount, Function() action) {
    return DataRow(cells: [
      DataCell(Text(category.id!.toString())),
      DataCell(Text(category.name.toString())),
      DataCell(Text(productCount.toString())),
      DataCell(HyperlinkButton(onPressed: action, child: const Text('Edit'))),
    ]);
  }
}
