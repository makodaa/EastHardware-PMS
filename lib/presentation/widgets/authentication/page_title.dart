import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: FluentTheme.of(context).typography.title,
          textAlign: TextAlign.start,
        ),
        Gaps.v8,
        Text(
          subtitle,
          style: FluentTheme.of(context).typography.body?.copyWith(color: Colors.grey[170]),
          textAlign: TextAlign.start,
        ),
        Gaps.v32
      ],
    );
  }
}
