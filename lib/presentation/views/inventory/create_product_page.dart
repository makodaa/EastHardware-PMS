import 'package:easthardware_pms/presentation/widgets/buttons/text_button.dart';
import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class CreateProductPage extends StatelessWidget {
  const CreateProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.panePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageHeader(),
          Expanded(
              child: Row(
            children: [
              const LeftColumn(),
              const RightColumn(),
            ].withSpacing(() => Spacing.h16),
          )),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class LeftColumn extends StatelessWidget {
  const LeftColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: const [
          BasicInformationSection(),
          AlternateUnitsSection(),
        ].withSpacing(() => Spacing.v16),
      ),
    );
  }
}

class RightColumn extends StatelessWidget {
  const RightColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Column(children: [
      SaleInformationSection(),
      Spacing.v16,
      OrderInformationSection(),
    ]));
  }
}

class SaleInformationSection extends StatelessWidget {
  const SaleInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.a16,
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SubheadingText('Sale Information'),
          Spacing.v16,
          BodyText('Sale Price'),
          Spacing.v4,
          TextBox(),
        ],
      ),
    );
  }
}

class OrderInformationSection extends StatelessWidget {
  const OrderInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.a16,
      color: Colors.white,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SubheadingText('Order Information'),
          Spacing.v16,
          BodyText('Order Cost'),
          Spacing.v4,
          TextBox(),
        ],
      ),
    );
  }
}

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPadding.a16,
      color: Colors.white,
      child: const Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SubheadingText('Basic Information'),
        Spacing.v16,
        BodyText('Product Name'),
        Spacing.v4,
        TextBox(),
        Spacing.v8,
        BodyText('Stock Keeping Unit (SKU)'),
        Spacing.v4,
        TextBox(),
        Spacing.v8,
        BodyText('Category'),
        Spacing.v4,
        TextBox(),
        Spacing.v8,
        BodyText('Description'),
        Spacing.v4,
        TextBox(minLines: 2, maxLines: 2),
        Spacing.v8,
        BodyText('Main Unit'),
        Spacing.v4,
        TextBox(),
        Spacing.v8,
        BodyText('Critical Level'),
        Spacing.v4,
        TextBox(),
        Spacing.v8,
        DeadFastStockFields(),
      ]),
    );
  }
}

class AlternateUnitsSection extends StatefulWidget {
  const AlternateUnitsSection({
    super.key,
  });

  @override
  State<AlternateUnitsSection> createState() => _AlternateUnitsSectionState();
}

class _AlternateUnitsSectionState extends State<AlternateUnitsSection> {
  //TODO: connect to state soon
  final List<String> names = [''];
  final List<double> values = [0];

  void addRow() {
    setState(() {
      names.add('');
      values.add(0);
    });
  }

  removeRow(int index) {
    setState(() {
      names.removeAt(index);
      values.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: AppPadding.a16,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SubheadingText('Alternate Units'),
            Spacing.v12,
            Flexible(
              child: ListView.separated(
                  separatorBuilder: (_, __) => Spacing.v8,
                  itemCount: names.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return index == 0
                        ? FirstAlternateUnitField(name: names[index], factor: values[index])
                        : index == names.length
                            ? names.length < 5
                                ? AddNewUnitButton(onPressed: () => addRow())
                                : null
                            : AlternateUnitField(
                                name: names[index],
                                factor: values[index],
                                onPressed: () => removeRow(index),
                              );
                  }),
            ),
            if (5 <= names.length) AddNewUnitButton(onPressed: () => addRow())
          ].withSpacing(() => Spacing.v4),
        ),
      ),
    );
  }
}

class AddNewUnitButton extends StatelessWidget {
  const AddNewUnitButton({
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Button(
        onPressed: onPressed,
        child: const Padding(
          padding: AppPadding.a4,
          child: GreyText('Add New Unit'),
        ));
  }
}

class FirstAlternateUnitField extends StatelessWidget {
  const FirstAlternateUnitField({
    required this.name,
    required this.factor,
    super.key,
  });

  final String name;
  final double factor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BodyText('Unit Name'),
            Spacing.v4,
            TextBox(controller: TextEditingController(text: name)),
          ],
        )),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BodyText('Equivalent'),
            Spacing.v4,
            TextBox(
              controller: TextEditingController(text: factor.toString()),
            ),
          ],
        )),
        const Column(
          children: [
            Text(''), // Modern Problems require modern solutions
            IconButton(icon: Icon(FluentIcons.cancel), onPressed: null),
          ],
        ),
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class AlternateUnitField extends StatelessWidget {
  const AlternateUnitField({
    required this.name,
    required this.factor,
    required this.onPressed,
    super.key,
  });

  final String name;
  final double factor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: TextBox(controller: TextEditingController(text: name))),
        Expanded(child: TextBox(controller: TextEditingController(text: factor.toString()))),
        IconButton(icon: const Icon(FluentIcons.cancel), onPressed: onPressed)
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class QuantityUnitFields extends StatelessWidget {
  const QuantityUnitFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  BodyText('Quantity on Hand'),
                  TextBox(),
                ].withSpacing(
                  () => Spacing.v12,
                ))),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  BodyText('Main Unit'),
                  TextBox(),
                ].withSpacing(
                  () => Spacing.v12,
                ))),
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class DeadFastStockFields extends StatelessWidget {
  const DeadFastStockFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  BodyText('Hanging Stock Treshold'),
                  TextBox(
                    suffix: Padding(
                      padding: AppPadding.a4,
                      child: GreyText('Days'),
                    ),
                  ),
                ].withSpacing(
                  () => Spacing.v12,
                ))),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  BodyText('Moving Stock Treshold'),
                  TextBox(
                    suffix: Padding(
                      padding: AppPadding.a4,
                      child: GreyText('Days'),
                    ),
                  ),
                ].withSpacing(
                  () => Spacing.v12,
                ))),
      ].withSpacing(() => Spacing.h16),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(icon: const Icon(FluentIcons.back), onPressed: context.pop),
        const DisplayText('Add Product'),
        const Spacer(flex: 1),
        TextButtonFilled('Save', onPressed: () {})
      ].withSpacing(() => Spacing.h16),
    );
  }
}
