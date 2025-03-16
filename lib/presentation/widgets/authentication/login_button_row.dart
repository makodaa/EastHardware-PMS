import 'package:easthardware_pms/presentation/widgets/layout/gaps.dart';
import 'package:fluent_ui/fluent_ui.dart';

class LoginButtonRow extends StatelessWidget {
  const LoginButtonRow({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FilledButton(
          onPressed: onPressed,
          child: Padding(
            padding: AppPadding.a12,
            child: Text(
              "Login",
              style:
                  FluentTheme.of(context).typography.body!.copyWith(color: const Color(0xFFFFFFFF)),
            ),
          ),
        ),
      ],
    );
  }
}
