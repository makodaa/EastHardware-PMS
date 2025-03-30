import 'package:fluent_ui/fluent_ui.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}

class SubheadingText extends StatelessWidget {
  const SubheadingText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

class DisplayText extends StatelessWidget {
  const DisplayText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  const BodyText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}

class StrongText extends StatelessWidget {
  const StrongText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class CaptionText extends StatelessWidget {
  const CaptionText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 10.0,
      ),
    );
  }
}

class ButtonText extends StatelessWidget {
  const ButtonText(
    this.data, {
    super.key,
  });
  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        fontSize: 14.0,
      ),
    );
  }
}
