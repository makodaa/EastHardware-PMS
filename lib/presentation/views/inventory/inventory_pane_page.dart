import 'package:easthardware_pms/presentation/router/app_router.dart';
import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

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
        ].withGap(
          () => Gaps.v16,
        ),
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
        Column(
          children: [
            FittedBox(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300.0),
                child: const TextBox(
                  placeholder: "Search",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
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
                router.goNamed('CreateProduct');
              },
            )
          ].withGap(() => Gaps.h16),
        ),
      ],
    );
  }
}
