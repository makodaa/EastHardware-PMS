import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class UsernameFormRow extends StatelessWidget {
  const UsernameFormRow({
    required this.controller,
    this.placeholder,
    super.key,
  });

  final String? placeholder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Username",
        style: FluentTheme.of(context).typography.bodyStrong,
      ),
      Gaps.v8,
      TextBox(
        placeholder: placeholder,
      )
    ]);
  }
}
