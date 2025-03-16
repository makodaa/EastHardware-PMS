import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          'assets/icons/app.png',
          height: 24,
          width: 24,
        ),
        Text(
          "East Hardware",
          style: FluentTheme.of(context).typography.bodyLarge?.copyWith(color: Colors.blue.dark),
        )
      ].withGap(() => Gaps.h16),
    );
  }
}
