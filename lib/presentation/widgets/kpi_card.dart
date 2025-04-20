import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';

class KPICard extends StatelessWidget {
  const KPICard(
    this.title, {
    required this.value,
    this.icon = const Icon(FluentIcons.square_shape),
    super.key,
  });

  final String title;
  final String value;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: AppPadding.a16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: BodyText(title)),
                icon,
              ],
            ),
            HeadingText(value),
          ],
        ),
      ),
    );
  }
}
