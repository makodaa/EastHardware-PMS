import 'package:easthardware_pms/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController skuController = TextEditingController();
  final TextEditingController productCategoryController =
      TextEditingController();
  final TextEditingController productQuantityController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController criticalLevelController = TextEditingController();
  final TextEditingController deadStockController = TextEditingController();
  final TextEditingController fastMovingStockController =
      TextEditingController();
  final TextEditingController salePriceController = TextEditingController();
  final TextEditingController orderCostController = TextEditingController();
  final TextEditingController dateCreatedController = TextEditingController();

  // void _handleSubmit(BuildContext context) {
  //   primaryFocus?.unfocus();
  //   context.read<AuthenticationBloc>().add(Event(
  //         sku: skuController.text.trim(),
  //         category: productCategoryController.text.trim(),
  //         description: descriptionController.text.trim(),
  //         salePrice: salePriceController.text.trim(),
  //         orderCost: orderCostController.text.trim(),
  //         productQuantity: productQuantityController.text.trim(),
  //         criticallevel: criticalLevelController.text.trim(),
  //         deadStock: deadStockController.text.trim(),
  //         fastMovingStock: fastMovingStockController.text.trim(),
  //         creationDate: dateCreatedController.text.trim(),
  //       ));
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    "Create New Product",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextBoxInput(
                    label: "SKU",
                    controller: skuController,
                  ),
                  TextBoxInput(
                    label: "Product Category",
                    controller: productCategoryController,
                  ),
                  ExpandedTextBoxInput(
                    label: "Description",
                    controller: descriptionController,
                  ),
                  TextBoxInput(
                    label: "Sale Price",
                    controller: salePriceController,
                  ),
                  TextBoxInput(
                    label: "Order Cost",
                    controller: orderCostController,
                  ),
                  TextBoxInput(
                    label: "Product Quantiy",
                    controller: productQuantityController,
                  ),
                  TextBoxInput(
                    label: "Critical Level",
                    controller: criticalLevelController,
                  ),
                  TextBoxInput(
                    label: "Dead Stock Threshold",
                    controller: deadStockController,
                  ),
                  TextBoxInput(
                    label: "Fast Moving Threshold",
                    controller: fastMovingStockController,
                  ),
                  TextBoxInput(
                    label: "Date",
                    controller: dateCreatedController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    spacing: 8,
                    children: [
                      Button(
                        onPressed: () {},
                        child: const Text("Cancel"),
                      ),
                      Button(
                        onPressed: () {
                          //_handleSubmit(context);
                        },
                        child: const Text("Create"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextBoxInput extends StatelessWidget {
  const TextBoxInput({
    required this.label,
    required this.controller,
    super.key,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          TextBox(controller: controller),
        ],
      ),
    );
  }
}

class ExpandedTextBoxInput extends StatelessWidget {
  const ExpandedTextBoxInput({
    required this.label,
    required this.controller,
    super.key,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 4),
          TextBox(
            maxLines: 3,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
