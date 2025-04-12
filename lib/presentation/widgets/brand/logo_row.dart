import 'package:easthardware_pms/presentation/widgets/spacing.dart';
import 'package:easthardware_pms/presentation/widgets/text.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LogoRow extends StatelessWidget {
  const LogoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.a16,
      child: Row(
        children: <Widget>[
          Image.asset(
            'assets/icons/app.png',
            height: 18,
            width: 18,
          ),
          const SubheadingText("East Hardware")
        ].withSpacing(() => Spacing.h16),
      ),
    );
  }
}
