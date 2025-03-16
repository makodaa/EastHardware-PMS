import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class PasswordFormRow extends StatelessWidget {
  const PasswordFormRow({
    required this.controller,
    this.placeholder,
    super.key,
  });

  final String? placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Password",
          style: FluentTheme.of(context).typography.bodyStrong,
        ),
        Gaps.v8,
        PasswordBox(
          placeholder: placeholder,
          revealMode: PasswordRevealMode.peek,
          controller: controller,
        ),
      ],
    );
  }
}
